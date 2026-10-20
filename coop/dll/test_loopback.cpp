// Two-process loopback test for SuperRRCoop.dll, calling it exactly like GameMaker does
// (cdecl, doubles and char* only).  Usage: test_loopback host <port> | join <ip> <port>
#include <windows.h>
#include <cstdio>
#include <cstring>

typedef double(__cdecl* F0)();
typedef double(__cdecl* F1)(double);
typedef double(__cdecl* F2)(double, double);
typedef double(__cdecl* F4)(double, double, double, double);
typedef double(__cdecl* FS)(const char*);
typedef double(__cdecl* FS1)(const char*, double);
typedef const char*(__cdecl* RS0)();
typedef const char*(__cdecl* RSS)(const char*);

HMODULE dll;
template <typename T> T fn(const char* name) {
    T f = (T)GetProcAddress(dll, name);
    if (!f) {
        printf("missing export %s\n", name);
        ExitProcess(2);
    }
    return f;
}

int main(int argc, char** argv) {
    if (argc < 3) return 2;
    dll = LoadLibraryA("SuperRRCoop.dll");
    if (!dll) {
        printf("LoadLibrary failed %lu\n", GetLastError());
        return 2;
    }
    auto init = fn<FS>("coop_init");
    auto host = fn<F1>("coop_host");
    auto join = fn<FS1>("coop_join");
    auto state = fn<F0>("coop_state");
    auto rtt = fn<F0>("coop_rtt");
    auto hash = fn<F0>("coop_hash");
    auto err = fn<RS0>("coop_error");
    auto cfg = fn<RSS>("coop_cfg");
    auto begin = fn<F1>("coop_begin");
    auto wi = fn<F1>("coop_wi");
    auto wf = fn<F1>("coop_wf");
    auto wd = fn<F1>("coop_wd");
    auto w4 = fn<F4>("coop_w4");
    auto ws = fn<FS>("coop_ws");
    auto end = fn<F1>("coop_end");
    auto flush = fn<F0>("coop_flush");
    auto poll = fn<F0>("coop_poll");
    auto next = fn<F0>("coop_next");
    auto ri = fn<F0>("coop_ri");
    auto rf = fn<F0>("coop_rf");
    auto rd = fn<F0>("coop_rd");
    auto rs = fn<RS0>("coop_rs");
    auto left = fn<F0>("coop_left");
    auto disc = fn<F0>("coop_disconnect");
    auto shut = fn<F0>("coop_shutdown");
    auto stat = fn<F1>("coop_stat");

    printf("api=%g\n", init(""));
    printf("cfg test_key='%s'\n", cfg("test_key"));
    printf("local ip='%s'\n", fn<RS0>("coop_local_ip")());
    if (init("") != 1) return 3;
    bool is_host = strcmp(argv[1], "host") == 0;
    if (is_host) host(atof(argv[2]));
    else join(argv[2], atof(argv[3]));

    int got_reliable = 0, got_unreliable = 0, frames = 0, last_state = -1;
    int sent_unrel = 0;
    bool sent = false;
    for (frames = 0; frames < 60 * 18; frames++) {  // ~18 s at 60 fps
        int st = (int)state();
        if (st != last_state) {
            printf("[%s] state %d err='%s' hash=%08X\n", argv[1], st, err(), (unsigned)hash());
            last_state = st;
        }
        if (st == 4 || st == 5) break;
        poll();
        double t;
        while ((t = next()) >= 0) {
            if (t == 1) {
                int a = (int)ri();
                float b = (float)rf();
                double c = rd();
                const char* s = rs();
                float q0 = (float)rf(), q1 = (float)rf(), q2 = (float)rf(), q3 = (float)rf();
                printf("[%s] reliable: %d %g %.10f '%s' w4=%g,%g,%g,%g left=%g\n", argv[1], a, b, c, s, q0, q1, q2, q3, left());
                got_reliable++;
                if (is_host) {  // echo back
                    begin(1); wi(a + 1); wf(b * 2); wd(c); ws("pong"); w4(q0, q1, q2, q3); end(1);
                }
            } else if (t == 2) {
                got_unreliable++;
                ri();
            }
        }
        if (st == 3) {
            if (!sent && !is_host) {
                begin(1); wi(41); wf(1.5); wd(123456789.123456789); ws("ping from client"); w4(1, 2, 3, 4); end(1);
                sent = true;
            }
            // 60 Hz "PSTATE"-like traffic, ~120 bytes each
            begin(2); wi(frames);
            for (int k = 0; k < 7; k++) w4(k, k, k, k);
            end(0);
            sent_unrel++;
        }
        flush();
        Sleep(16);
    }
    printf("[%s] done: reliable=%d unreliable=%d/%d rtt=%gms out=%gB/s in=%gB/s\n", argv[1], got_reliable,
           got_unreliable, sent_unrel, rtt(), stat(0), stat(1));
    disc();
    Sleep(200);
    shut();
    return 0;
}
