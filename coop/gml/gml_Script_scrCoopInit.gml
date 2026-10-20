// Co-op bootstrap. Called at the end of global_init, so it also runs again after every game_restart.
// Every co-op global is set here unconditionally: patched game code may read them even when
// SuperRRCoop.dll is missing, and the game is built with "error on uninitialised variables".
global.coop_dll = 0;
global.coop_active = 0;
global.coop_role = 0;
global.coop_state = 0;
global.coop_partner = "";
global.coop_notice = "";
global.coop_notice_time = 0;
global.coop_restarting = 0;
global.coop_exit_cd = 0;
global.coop_spec_t = 0;  // frames a dead player has been spectating the living partner (objPlayerDead camera)  // client: frames until it may ask the host to use an exit again
global.coop_restart_cd = 0;  // frames until R may send / start a co-op restart again
global.coop_restart_ok = 0;  // set while scrCoopRestartBoth runs objEffector's R handler past the co-op gate
global.coop_ents = ds_map_create();
global.coop_net_ids = ds_map_create();
global.coop_netdestroy = 0;  // set while the network removes a real copy (its Destroy event must not report it)
global.coop_gone = ds_map_create();  // client: host ids picked up / finished here this visit (ignore late ENT)  // projectiles re-created from the network (never sent back)
global.coop_tx = 0;  // enemy AI target position (scrCoopTarget)
global.coop_ty = 0;
global.coop_tinst = noone;  // enemy AI target instance (host body or puppet), see scrCoopTarget  // client: host instance id -> objCoopEnt ghost  // set before our own game_restart so objCoopNet does not recreate itself
global.coop_ip = "";
global.coop_port = 27515;
// Where the host is (client side, from ROOM messages): room -1 = not on a co-op floor.
global.coop_host_room = -1;
global.coop_host_level = -1;
global.coop_host_sequence = 0;
global.coop_host_hardmode = 0;
global.coop_host_title = "";
global.coop_host_pretitle = "";
// Diagnostics: PSTATE messages sent / received (logged by objCoopNet every 3 s).
global.coop_ps_out = 0;
global.coop_ps_in = 0;
if (!file_exists("SuperRRCoop.dll"))
{
    exit;
}
var d;
d = "SuperRRCoop.dll";
global.coop_f_init = external_define(d, "coop_init", dll_cdecl, ty_real, 1, ty_string);
global.coop_f_host = external_define(d, "coop_host", dll_cdecl, ty_real, 1, ty_real);
global.coop_f_join = external_define(d, "coop_join", dll_cdecl, ty_real, 2, ty_string, ty_real);
global.coop_f_state = external_define(d, "coop_state", dll_cdecl, ty_real, 0);
global.coop_f_role = external_define(d, "coop_role", dll_cdecl, ty_real, 0);
global.coop_f_disconnect = external_define(d, "coop_disconnect", dll_cdecl, ty_real, 0);
global.coop_f_rtt = external_define(d, "coop_rtt", dll_cdecl, ty_real, 0);
global.coop_f_hash = external_define(d, "coop_hash", dll_cdecl, ty_real, 0);
global.coop_f_error = external_define(d, "coop_error", dll_cdecl, ty_string, 0);
global.coop_f_cfg = external_define(d, "coop_cfg", dll_cdecl, ty_string, 1, ty_string);
global.coop_f_cfg_set = external_define(d, "coop_cfg_set", dll_cdecl, ty_real, 2, ty_string, ty_string);
global.coop_f_local_ip = external_define(d, "coop_local_ip", dll_cdecl, ty_string, 0);
global.coop_f_log = external_define(d, "coop_log", dll_cdecl, ty_real, 1, ty_string);
global.coop_f_time = external_define(d, "coop_time", dll_cdecl, ty_real, 0);
global.coop_f_stat = external_define(d, "coop_stat", dll_cdecl, ty_real, 1, ty_real);
global.coop_f_netsim = external_define(d, "coop_netsim", dll_cdecl, ty_real, 2, ty_real, ty_real);
global.coop_f_begin = external_define(d, "coop_begin", dll_cdecl, ty_real, 1, ty_real);
global.coop_f_wi = external_define(d, "coop_wi", dll_cdecl, ty_real, 1, ty_real);
global.coop_f_wf = external_define(d, "coop_wf", dll_cdecl, ty_real, 1, ty_real);
global.coop_f_wd = external_define(d, "coop_wd", dll_cdecl, ty_real, 1, ty_real);
global.coop_f_w4 = external_define(d, "coop_w4", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
global.coop_f_ws = external_define(d, "coop_ws", dll_cdecl, ty_real, 1, ty_string);
global.coop_f_end = external_define(d, "coop_end", dll_cdecl, ty_real, 1, ty_real);
global.coop_f_flush = external_define(d, "coop_flush", dll_cdecl, ty_real, 0);
global.coop_f_poll = external_define(d, "coop_poll", dll_cdecl, ty_real, 0);
global.coop_f_next = external_define(d, "coop_next", dll_cdecl, ty_real, 0);
global.coop_f_ri = external_define(d, "coop_ri", dll_cdecl, ty_real, 0);
global.coop_f_rf = external_define(d, "coop_rf", dll_cdecl, ty_real, 0);
global.coop_f_rd = external_define(d, "coop_rd", dll_cdecl, ty_real, 0);
global.coop_f_rs = external_define(d, "coop_rs", dll_cdecl, ty_string, 0);
global.coop_f_left = external_define(d, "coop_left", dll_cdecl, ty_real, 0);
if (external_call(global.coop_f_init, "") != 1)
{
    exit;
}
global.coop_dll = 1;
// variable_global_exists crashes in this runner build, so the game globals co-op reads get defaults once per
// process (first boot only: after game_restart the game's own values must stay).
global.coop_f_boot_count = external_define(d, "coop_boot_count", dll_cdecl, ty_real, 0);
if (external_call(global.coop_f_boot_count) == 1)
{
    global.PauseRestart = 0;
    global.level = 0;
    global.sequence = 0;
    global.hardmode = 0;
    global.title = "";
    global.pretitle = "";
    global.my_id = noone;  // the game assigns it during play; the host saves/restores it around puppet melee
}
global.coop_ip = external_call(global.coop_f_cfg, "ip");
d = external_call(global.coop_f_cfg, "port");
if (d != "")
{
    global.coop_port = real(d);
}
global.coop_role = external_call(global.coop_f_role);
global.coop_state = external_call(global.coop_f_state);
if (!instance_exists(objCoopNet))
{
    instance_create(0, 0, objCoopNet);
}
