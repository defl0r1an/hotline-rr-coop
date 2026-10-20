// SuperRRCoop.dll - network transport for Hotline Miami Super R-R online co-op.
//
// GameMaker: Studio 1.x calls this through external_define(..., dll_cdecl, ...), so every
// export takes and returns only double (ty_real) or const char* (ty_string), with at most
// four arguments. ENet runs on a worker thread; the game thread only touches byte queues,
// so pings keep flowing while the game is busy loading rooms.
//
// Wire format of one ENet packet: u8 proto, then repeated { u8 type, u16 len, payload }.

#define WIN32_LEAN_AND_MEAN
#define _CRT_SECURE_NO_WARNINGS
#include <enet/enet.h>
#include <windows.h>
#include <iphlpapi.h>
#ifndef SIO_UDP_CONNRESET
#define SIO_UDP_CONNRESET _WSAIOW(IOC_VENDOR, 12)
#endif

#include <atomic>
#include <chrono>
#include <condition_variable>
#include <cstdarg>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <cwctype>
#include <deque>
#include <mutex>
#include <string>
#include <thread>
#include <vector>

#define GMEXPORT extern "C" __declspec(dllexport)

namespace {

const double kApiVersion = 1;
const uint8_t kProto = 1;
const size_t kMaxPayload = 1100;  // keeps datagrams under the ~1280 MTU of Tailscale/WireGuard
const enet_uint32 kMtu = 1200;

enum State { ST_IDLE = 0, ST_HOSTING = 1, ST_CONNECTING = 2, ST_CONNECTED = 3, ST_LOST = 4, ST_FAILED = 5 };
enum Reason { RS_NONE = 0, RS_DATA_MISMATCH = 1, RS_PROTO_MISMATCH = 2, RS_FULL = 3, RS_BYE = 4 };

typedef std::vector<uint8_t> Bytes;

struct OutPacket {
    Bytes data;
    int channel;
    enet_uint32 flags;
    LARGE_INTEGER due;  // for the network simulator
};

enum CmdKind { CMD_HOST, CMD_JOIN, CMD_DISCONNECT };
struct Command {
    CmdKind kind;
    std::string ip;
    int port;
};

// ---- shared between threads (guarded by g_mu) ----
std::mutex g_mu;
std::condition_variable g_cv;
std::deque<Command> g_cmds;
std::deque<OutPacket> g_out;
std::deque<Bytes> g_in;  // one entry per received message: u8 type + payload
bool g_stop = false;
std::string g_error;

std::atomic<int> g_state(ST_IDLE);
std::atomic<int> g_role(0);
std::atomic<int> g_rtt(0);
std::atomic<int> g_loss(0);
std::atomic<uint32_t> g_crc(0);
std::atomic<bool> g_crc_ready(false);
std::atomic<int> g_lag_ms(0);
std::atomic<int> g_loss_pct(0);
std::atomic<long long> g_bytes_out(0), g_bytes_in(0);

// ---- game thread only ----
bool g_inited = false;
std::thread g_worker;
std::string g_dir;  // exe directory with trailing backslash
FILE* g_log = nullptr;
std::mutex g_log_mu;
LARGE_INTEGER g_qpf, g_t0;

Bytes g_msg;            // message being built
bool g_msg_open = false;
Bytes g_batch[2];       // per-channel batch for this frame
std::deque<Bytes> g_rx; // messages handed to GML
Bytes g_cur;            // current message being read
size_t g_cur_pos = 0;
long long g_last_out = 0, g_last_in = 0;
double g_rate_out = 0, g_rate_in = 0;
LARGE_INTEGER g_rate_t;

// ---------------------------------------------------------------------------

void logf(const char* fmt, ...) {
    std::lock_guard<std::mutex> lk(g_log_mu);
    if (!g_log) return;
    SYSTEMTIME st;
    GetLocalTime(&st);
    fprintf(g_log, "%02d:%02d:%02d.%03d ", st.wHour, st.wMinute, st.wSecond, st.wMilliseconds);
    va_list ap;
    va_start(ap, fmt);
    vfprintf(g_log, fmt, ap);
    va_end(ap);
    fputc('\n', g_log);
    fflush(g_log);
}

void set_error(const std::string& e) {
    {
        std::lock_guard<std::mutex> lk(g_mu);
        g_error = e;
    }
    logf("error: %s", e.c_str());
}

uint32_t crc32_file(const std::string& path) {
    uint32_t table[256];
    for (uint32_t i = 0; i < 256; i++) {
        uint32_t c = i;
        for (int k = 0; k < 8; k++) c = (c & 1) ? 0xEDB88320u ^ (c >> 1) : c >> 1;
        table[i] = c;
    }
    FILE* f = fopen(path.c_str(), "rb");
    if (!f) return 0;
    std::vector<uint8_t> buf(1 << 20);
    uint32_t crc = 0xFFFFFFFFu;
    size_t n;
    while ((n = fread(buf.data(), 1, buf.size(), f)) > 0)
        for (size_t i = 0; i < n; i++) crc = table[(crc ^ buf[i]) & 0xFF] ^ (crc >> 8);
    fclose(f);
    return crc ^ 0xFFFFFFFFu;
}

const char* reason_text(enet_uint32 r) {
    switch (r) {
        case RS_DATA_MISMATCH: return "data.win differs between host and client";
        case RS_PROTO_MISMATCH: return "SuperRRCoop.dll versions differ";
        case RS_FULL: return "host already has a partner";
        case RS_BYE: return "partner left";
        default: return "connection lost";
    }
}

// Splits one received packet into messages and queues them for the game thread.
void unpack(const uint8_t* p, size_t n) {
    if (n < 1 || p[0] != kProto) return;
    size_t i = 1;
    std::lock_guard<std::mutex> lk(g_mu);
    while (i + 3 <= n) {
        uint8_t type = p[i];
        size_t len = p[i + 1] | (p[i + 2] << 8);
        i += 3;
        if (i + len > n) break;
        Bytes m;
        m.reserve(len + 1);
        m.push_back(type);
        m.insert(m.end(), p + i, p + i + len);
        g_in.push_back(std::move(m));
        i += len;
    }
}

// Windows reports an ICMP "port unreachable" as WSAECONNRESET on the next recvfrom. ENet then
// returns from enet_host_service before checking timeouts, so a join to a host that is not
// running would hang forever. Turn that report off.
void disable_connreset(ENetHost* host) {
    BOOL off = FALSE;
    DWORD ret = 0;
    WSAIoctl(host->socket, SIO_UDP_CONNRESET, &off, sizeof(off), nullptr, 0, &ret, nullptr, nullptr);
}

void worker_main() {
    // data.win CRC first, so a host never accepts a partner before it can compare builds.
    g_crc = crc32_file(g_dir + "data.win");
    g_crc_ready = true;
    logf("data.win crc32 = %08X", (unsigned)g_crc.load());

    ENetHost* host = nullptr;
    ENetPeer* peer = nullptr;  // the single partner
    bool is_host = false;
    LARGE_INTEGER connect_start = {};
    std::deque<OutPacket> delayed;

    auto close_host = [&]() {
        if (host) {
            if (peer) {
                enet_peer_disconnect_now(peer, RS_BYE);
                peer = nullptr;
            }
            enet_host_flush(host);
            enet_host_destroy(host);
            host = nullptr;
        }
        delayed.clear();
    };

    for (;;) {
        std::deque<Command> cmds;
        std::deque<OutPacket> out;
        {
            std::unique_lock<std::mutex> lk(g_mu);
            if (!host) g_cv.wait_for(lk, std::chrono::milliseconds(20), [] { return g_stop || !g_cmds.empty(); });
            if (g_stop) break;
            cmds.swap(g_cmds);
            out.swap(g_out);
        }

        for (auto& c : cmds) {
            if (c.kind == CMD_DISCONNECT) {
                close_host();
                g_state = ST_IDLE;
                logf("disconnected by game");
            } else if (c.kind == CMD_HOST) {
                close_host();
                ENetAddress addr;
                addr.host = ENET_HOST_ANY;
                addr.port = (enet_uint16)c.port;
                host = enet_host_create(&addr, 1, 2, 0, 0);
                if (!host) {
                    set_error("cannot listen on UDP port " + std::to_string(c.port) + " (already in use?)");
                    g_state = ST_FAILED;
                    continue;
                }
                host->mtu = kMtu;
                disable_connreset(host);
                is_host = true;
                g_state = ST_HOSTING;
                logf("hosting on UDP port %d", c.port);
            } else if (c.kind == CMD_JOIN) {
                close_host();
                host = enet_host_create(nullptr, 1, 2, 0, 0);
                if (!host) {
                    set_error("cannot create client socket");
                    g_state = ST_FAILED;
                    continue;
                }
                host->mtu = kMtu;
                disable_connreset(host);
                is_host = false;
                ENetAddress addr;
                if (enet_address_set_host(&addr, c.ip.c_str()) != 0) {
                    set_error("cannot resolve host address '" + c.ip + "'");
                    close_host();
                    g_state = ST_FAILED;
                    continue;
                }
                addr.port = (enet_uint16)c.port;
                peer = enet_host_connect(host, &addr, 2, g_crc.load());
                if (!peer) {
                    set_error("cannot start connection");
                    close_host();
                    g_state = ST_FAILED;
                    continue;
                }
                enet_peer_timeout(peer, 32, 3000, 8000);
                QueryPerformanceCounter(&connect_start);
                g_state = ST_CONNECTING;
                logf("connecting to %s:%d", c.ip.c_str(), c.port);
            }
        }

        if (!host) continue;

        // Outgoing packets, optionally through the lag/loss simulator.
        LARGE_INTEGER now;
        QueryPerformanceCounter(&now);
        for (auto& o : out) {
            int lag = g_lag_ms.load();
            o.due.QuadPart = now.QuadPart + (long long)lag * g_qpf.QuadPart / 1000;
            delayed.push_back(std::move(o));
        }
        while (!delayed.empty() && delayed.front().due.QuadPart <= now.QuadPart) {
            OutPacket& o = delayed.front();
            bool drop = !(o.flags & ENET_PACKET_FLAG_RELIABLE) && g_loss_pct.load() > 0 &&
                        (rand() % 100) < g_loss_pct.load();
            if (peer && g_state == ST_CONNECTED && !drop) {
                ENetPacket* pk = enet_packet_create(o.data.data(), o.data.size(), o.flags);
                if (enet_peer_send(peer, (enet_uint8)o.channel, pk) == 0)
                    g_bytes_out += (long long)o.data.size();
            }
            delayed.pop_front();
        }

        ENetEvent ev;
        int guard = 0;
        while (guard++ < 256 && enet_host_service(host, &ev, guard == 1 ? 2 : 0) > 0) {
            switch (ev.type) {
                case ENET_EVENT_TYPE_CONNECT:
                    if (is_host) {
                        if (peer && peer != ev.peer) {
                            enet_peer_disconnect_now(ev.peer, RS_FULL);
                            break;
                        }
                        if (ev.data != g_crc.load()) {
                            logf("rejected partner: data.win crc %08X != ours %08X", (unsigned)ev.data,
                                 (unsigned)g_crc.load());
                            enet_peer_disconnect_later(ev.peer, RS_DATA_MISMATCH);
                            break;
                        }
                        peer = ev.peer;
                        enet_peer_timeout(peer, 32, 3000, 8000);
                    }
                    {
                        char ip[64] = "?";
                        enet_address_get_host_ip(&ev.peer->address, ip, sizeof(ip));
                        logf("partner connected from %s:%u", ip, ev.peer->address.port);
                    }
                    {
                        std::lock_guard<std::mutex> lk(g_mu);
                        g_in.clear();
                        g_error.clear();
                    }
                    g_state = ST_CONNECTED;
                    break;
                case ENET_EVENT_TYPE_RECEIVE:
                    if (ev.peer == peer) {
                        g_bytes_in += (long long)ev.packet->dataLength;
                        unpack(ev.packet->data, ev.packet->dataLength);
                    }
                    enet_packet_destroy(ev.packet);
                    break;
                case ENET_EVENT_TYPE_DISCONNECT:
                    if (ev.peer != peer) break;  // a rejected extra connection
                    peer = nullptr;
                    {
                        int prev = g_state.load();
                        std::string why = reason_text(ev.data);
                        logf("partner disconnected (%s)", why.c_str());
                        if (is_host) {
                            g_state = ST_HOSTING;
                        } else {
                            bool refused = ev.data == RS_DATA_MISMATCH || ev.data == RS_PROTO_MISMATCH || ev.data == RS_FULL;
                            set_error(prev == ST_CONNECTING && ev.data == 0 ? "no answer from host" : why);
                            g_state = (prev == ST_CONNECTING || refused) ? ST_FAILED : ST_LOST;
                            close_host();
                        }
                    }
                    break;
                default:
                    break;
            }
            if (!host) break;
        }
        if (host && !is_host && g_state == ST_CONNECTING &&
            (now.QuadPart - connect_start.QuadPart) > 10 * g_qpf.QuadPart) {
            set_error("no answer from host");
            close_host();
            g_state = ST_FAILED;
        }
        if (host && peer) {
            g_rtt = (int)peer->roundTripTime;
            g_loss = (int)(peer->packetLoss * 100 / ENET_PEER_PACKET_LOSS_SCALE);
        }
    }
    close_host();
}

void push_cmd(CmdKind k, const std::string& ip = "", int port = 0) {
    std::lock_guard<std::mutex> lk(g_mu);
    g_cmds.push_back({k, ip, port});
    g_cv.notify_one();
}

void put_u8(Bytes& b, uint8_t v) { b.push_back(v); }
template <typename T> void put_raw(Bytes& b, T v) {
    const uint8_t* p = (const uint8_t*)&v;
    b.insert(b.end(), p, p + sizeof(T));
}
template <typename T> T get_raw() {
    T v = 0;
    if (g_cur_pos + sizeof(T) <= g_cur.size()) {
        memcpy(&v, g_cur.data() + g_cur_pos, sizeof(T));
        g_cur_pos += sizeof(T);
    } else {
        g_cur_pos = g_cur.size();
    }
    return v;
}

void send_batch(int ch) {
    Bytes& b = g_batch[ch];
    if (b.size() <= 1) {
        b.clear();
        return;
    }
    OutPacket o;
    o.data.swap(b);
    o.channel = ch;
    o.flags = ch == 0 ? ENET_PACKET_FLAG_RELIABLE : 0;
    if (ch == 1 && o.data.size() > kMaxPayload) o.flags |= ENET_PACKET_FLAG_UNRELIABLE_FRAGMENT;
    std::lock_guard<std::mutex> lk(g_mu);
    g_out.push_back(std::move(o));
}

}  // namespace

// ===========================================================================
// Session
// ===========================================================================

int g_init_calls = 0;

// How many times coop_init ran in this process: 1 on the first boot, more after each game_restart.
GMEXPORT double coop_boot_count() { return g_init_calls; }

// Starts the worker on first call; later calls (after game_restart) just return the version.
GMEXPORT double coop_init(const char* logdir) {
    g_init_calls++;
    if (g_inited) return kApiVersion;
    char path[MAX_PATH];
    GetModuleFileNameA(nullptr, path, MAX_PATH);
    g_dir = path;
    g_dir = g_dir.substr(0, g_dir.find_last_of("\\/") + 1);
    std::string ldir = (logdir && *logdir) ? std::string(logdir) : g_dir;
    if (!ldir.empty() && ldir.back() != '\\' && ldir.back() != '/') ldir += '\\';
    g_log = fopen((ldir + "coop_log.txt").c_str(), "w");
    QueryPerformanceFrequency(&g_qpf);
    QueryPerformanceCounter(&g_t0);
    g_rate_t = g_t0;
    if (enet_initialize() != 0) {
        set_error("enet_initialize failed");
        return 0;
    }
    logf("SuperRRCoop.dll api %d, exe dir %s", (int)kApiVersion, g_dir.c_str());
    g_stop = false;
    g_worker = std::thread(worker_main);
    g_inited = true;
    return kApiVersion;
}

GMEXPORT double coop_host(double port) {
    if (!g_inited) return 0;
    g_role = 1;
    push_cmd(CMD_HOST, "", (int)port);
    return 1;
}

GMEXPORT double coop_join(const char* ip, double port) {
    if (!g_inited || !ip || !*ip) return 0;
    g_role = 2;
    g_state = ST_CONNECTING;
    push_cmd(CMD_JOIN, ip, (int)port);
    return 1;
}

GMEXPORT double coop_state() { return g_state.load(); }

// 0 none, 1 host, 2 client. Lives in the DLL so GML can re-attach after game_restart.
GMEXPORT double coop_role() { return g_role.load(); }

GMEXPORT double coop_disconnect() {
    if (!g_inited) return 0;
    g_role = 0;
    push_cmd(CMD_DISCONNECT);
    return 1;
}

// Only for a real exit of the game, never for game_restart.
GMEXPORT double coop_shutdown() {
    if (!g_inited) return 0;
    {
        std::lock_guard<std::mutex> lk(g_mu);
        g_stop = true;
        g_cv.notify_one();
    }
    if (g_worker.joinable()) g_worker.join();
    enet_deinitialize();
    logf("shutdown");
    if (g_log) fclose(g_log);
    g_log = nullptr;
    g_inited = false;
    return 1;
}

// ===========================================================================
// Diagnostics
// ===========================================================================

GMEXPORT double coop_rtt() { return g_rtt.load(); }

GMEXPORT double coop_hash() { return g_crc_ready ? (double)g_crc.load() : 0; }

GMEXPORT const char* coop_error() {
    static std::string s;
    std::lock_guard<std::mutex> lk(g_mu);
    s = g_error;
    return s.c_str();
}

// Reads [coop] key from coop.ini next to the exe; "" when missing.
GMEXPORT const char* coop_cfg(const char* key) {
    static char buf[512];
    buf[0] = 0;
    if (key && *key) GetPrivateProfileStringA("coop", key, "", buf, sizeof(buf), (g_dir + "coop.ini").c_str());
    return buf;
}

namespace {
bool has_word(const wchar_t* s, const wchar_t* needle) {
    if (!s) return false;
    std::wstring a(s);
    for (auto& c : a) c = towlower(c);
    return a.find(needle) != std::wstring::npos;
}
}  // namespace

// The address(es) a partner should type to reach this PC. Virtual-LAN VPNs come first (Tailscale
// 100.64/10, Radmin VPN 26/8, Hamachi 25/8, ZeroTier), all of them joined by " / "; without a VPN,
// a private LAN address of a real adapter; "" when there is none.
GMEXPORT const char* coop_local_ip() {
    static std::string out;
    out.clear();
    std::string lan;
    ULONG size = 16 * 1024;
    std::vector<uint8_t> buf(size);
    auto* list = (IP_ADAPTER_ADDRESSES*)buf.data();
    ULONG flags = GAA_FLAG_SKIP_ANYCAST | GAA_FLAG_SKIP_MULTICAST | GAA_FLAG_SKIP_DNS_SERVER;
    if (GetAdaptersAddresses(AF_INET, flags, nullptr, list, &size) == ERROR_BUFFER_OVERFLOW) {
        buf.resize(size);
        list = (IP_ADAPTER_ADDRESSES*)buf.data();
    }
    if (GetAdaptersAddresses(AF_INET, flags, nullptr, list, &size) != NO_ERROR) return "";
    for (auto* a = list; a; a = a->Next) {
        if (a->OperStatus != IfOperStatusUp || a->IfType == IF_TYPE_SOFTWARE_LOOPBACK) continue;
        bool vpn_name = has_word(a->Description, L"tailscale") || has_word(a->Description, L"radmin") ||
                        has_word(a->Description, L"hamachi") || has_word(a->Description, L"zerotier") ||
                        has_word(a->FriendlyName, L"tailscale") || has_word(a->FriendlyName, L"radmin") ||
                        has_word(a->FriendlyName, L"hamachi") || has_word(a->FriendlyName, L"zerotier");
        bool virtual_nic = has_word(a->Description, L"hyper-v") || has_word(a->Description, L"virtualbox") ||
                           has_word(a->Description, L"vmware") || has_word(a->FriendlyName, L"vethernet");
        for (auto* u = a->FirstUnicastAddress; u; u = u->Next) {
            uint32_t ip = ntohl(((sockaddr_in*)u->Address.lpSockaddr)->sin_addr.s_addr);
            if ((ip >> 16) == 0xA9FE) continue;  // 169.254.x.x: no address assigned
            char s[32];
            snprintf(s, sizeof(s), "%u.%u.%u.%u", ip >> 24, (ip >> 16) & 255, (ip >> 8) & 255, ip & 255);
            bool vpn_range = (ip & 0xFFC00000u) == 0x64400000u || (ip >> 24) == 26 || (ip >> 24) == 25;
            bool private_lan = (ip >> 24) == 10 || (ip >> 20) == 0xAC1 || (ip >> 16) == 0xC0A8;
            if (vpn_name || vpn_range) {
                if (!out.empty()) out += " / ";
                out += s;
            } else if (private_lan && !virtual_nic && lan.empty()) {
                lan = s;
            }
        }
    }
    if (out.empty()) out = lan;
    return out.c_str();
}

// Writes [coop] key=value into coop.ini next to the exe (GML's ini functions write to AppData instead).
GMEXPORT double coop_cfg_set(const char* key, const char* value) {
    if (!key || !*key) return 0;
    return WritePrivateProfileStringA("coop", key, value ? value : "", (g_dir + "coop.ini").c_str()) ? 1 : 0;
}

GMEXPORT double coop_log(const char* line) {
    logf("gml: %s", line ? line : "");
    return 1;
}

GMEXPORT double coop_time() {
    LARGE_INTEGER now;
    QueryPerformanceCounter(&now);
    return (double)(now.QuadPart - g_t0.QuadPart) * 1000.0 / (double)g_qpf.QuadPart;
}

// 0 bytes out/s, 1 bytes in/s, 2 packet loss %, 3 messages waiting for GML.
GMEXPORT double coop_stat(double id) {
    LARGE_INTEGER now;
    QueryPerformanceCounter(&now);
    double dt = (double)(now.QuadPart - g_rate_t.QuadPart) / (double)g_qpf.QuadPart;
    if (dt >= 1.0) {
        long long o = g_bytes_out.load(), i = g_bytes_in.load();
        g_rate_out = (o - g_last_out) / dt;
        g_rate_in = (i - g_last_in) / dt;
        g_last_out = o;
        g_last_in = i;
        g_rate_t = now;
    }
    switch ((int)id) {
        case 0: return g_rate_out;
        case 1: return g_rate_in;
        case 2: return g_loss.load();
        case 3: {
            std::lock_guard<std::mutex> lk(g_mu);
            return (double)(g_in.size() + g_rx.size());
        }
    }
    return 0;
}

// Test-only: adds latency to every outgoing packet and drops unreliable ones.
GMEXPORT double coop_netsim(double lag_ms, double loss_pct) {
    g_lag_ms = (int)lag_ms;
    g_loss_pct = (int)loss_pct;
    logf("netsim lag=%dms loss=%d%%", (int)lag_ms, (int)loss_pct);
    return 1;
}

// ===========================================================================
// Outgoing messages: coop_begin(type), coop_w*(...), coop_end(reliable); coop_flush() once per frame.
// ===========================================================================

GMEXPORT double coop_begin(double type) {
    g_msg.clear();
    put_u8(g_msg, (uint8_t)(int)type);
    put_raw<uint16_t>(g_msg, 0);
    g_msg_open = true;
    return 1;
}

GMEXPORT double coop_wi(double v) { put_raw<int32_t>(g_msg, (int32_t)v); return 1; }
GMEXPORT double coop_wf(double v) { put_raw<float>(g_msg, (float)v); return 1; }
GMEXPORT double coop_wd(double v) { put_raw<double>(g_msg, v); return 1; }

GMEXPORT double coop_w4(double a, double b, double c, double d) {
    put_raw<float>(g_msg, (float)a);
    put_raw<float>(g_msg, (float)b);
    put_raw<float>(g_msg, (float)c);
    put_raw<float>(g_msg, (float)d);
    return 1;
}

GMEXPORT double coop_ws(const char* s) {
    size_t n = s ? strlen(s) : 0;
    if (n > 255) n = 255;
    put_u8(g_msg, (uint8_t)n);
    if (n) g_msg.insert(g_msg.end(), (const uint8_t*)s, (const uint8_t*)s + n);
    return 1;
}

GMEXPORT double coop_end(double reliable) {
    if (!g_msg_open) return 0;
    g_msg_open = false;
    size_t len = g_msg.size() - 3;
    if (len > 0xFFFF) return 0;
    g_msg[1] = (uint8_t)(len & 0xFF);
    g_msg[2] = (uint8_t)(len >> 8);
    if (g_state != ST_CONNECTED) return 0;
    int ch = reliable != 0 ? 0 : 1;
    Bytes& b = g_batch[ch];
    if (b.size() > 1 && b.size() + g_msg.size() > kMaxPayload) send_batch(ch);
    if (b.empty()) b.push_back(kProto);
    b.insert(b.end(), g_msg.begin(), g_msg.end());
    return 1;
}

GMEXPORT double coop_flush() {
    send_batch(0);
    send_batch(1);
    return 1;
}

// ===========================================================================
// Incoming messages: n = coop_poll(); while ((t = coop_next()) >= 0) { read fields in order }
// ===========================================================================

GMEXPORT double coop_poll() {
    std::lock_guard<std::mutex> lk(g_mu);
    size_t n = g_in.size();
    while (!g_in.empty()) {
        g_rx.push_back(std::move(g_in.front()));
        g_in.pop_front();
    }
    return (double)n;
}

GMEXPORT double coop_next() {
    if (g_rx.empty()) {
        g_cur.clear();
        g_cur_pos = 0;
        return -1;
    }
    g_cur = std::move(g_rx.front());
    g_rx.pop_front();
    g_cur_pos = 1;
    return g_cur[0];
}

GMEXPORT double coop_ri() { return get_raw<int32_t>(); }
GMEXPORT double coop_rf() { return get_raw<float>(); }
GMEXPORT double coop_rd() { return get_raw<double>(); }

GMEXPORT const char* coop_rs() {
    static std::string s;
    s.clear();
    if (g_cur_pos < g_cur.size()) {
        size_t n = g_cur[g_cur_pos++];
        if (g_cur_pos + n > g_cur.size()) n = g_cur.size() - g_cur_pos;
        s.assign((const char*)g_cur.data() + g_cur_pos, n);
        g_cur_pos += n;
    }
    return s.c_str();
}

GMEXPORT double coop_left() { return (double)(g_cur.size() > g_cur_pos ? g_cur.size() - g_cur_pos : 0); }
