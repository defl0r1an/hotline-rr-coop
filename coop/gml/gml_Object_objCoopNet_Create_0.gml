// Persistent co-op controller: pumps SuperRRCoop.dll every frame and draws the status overlay.
// Message types (protocol 2): 1 HELLO, 2 WELCOME, 3 REJECT, 16 ROOM (host floor), 32 PSTATE (player look).
coop_proto = 2;
coop_modver = "29.10.0";
last_state = -1;
var s;
my_name = external_call(global.coop_f_cfg, "name");
if (my_name == "")
{
    my_name = "Player";
}
cfg_windowed = 0;
if (external_call(global.coop_f_cfg, "windowed") == "1")
{
    cfg_windowed = 1;
}
s = external_call(global.coop_f_cfg, "netsim_lag");
sim_lag = 0;
if (s != "")
{
    sim_lag = real(s);
}
s = external_call(global.coop_f_cfg, "netsim_loss");
sim_loss = 0;
if (s != "")
{
    sim_loss = real(s);
}
external_call(global.coop_f_netsim, sim_lag, sim_loss);
// auto=host / auto=join in coop.ini starts the session at boot (for testing without key presses).
s = external_call(global.coop_f_cfg, "auto");
if (global.coop_state == 0)
{
    if (s == "host")
    {
        scrCoopHost();
    }
    else if (s == "join")
    {
        scrCoopJoin();
    }
}
external_call(global.coop_f_log, "objCoopNet created in " + room_get_name(room) + ", role " + string(global.coop_role) + ", state " + string(global.coop_state));
sent_room = -2;
sent_done = 0;
coop_dlg_current = -1;
coop_leaving = 0;
// test_level=<first floor room> in coop.ini: the host enters that level by itself once a partner is connected
// (unattended testing only).
s = external_call(global.coop_f_cfg, "test_level");
test_level = 0;
if (s != "")
{
    test_level = real(s);
}
coop_beat = 0;
// test_auto=1: drive mask menu / floor change automatically (scrCoopTestAuto).
test_auto = 0;
s = external_call(global.coop_f_cfg, "test_auto");
if (s != "")
{
    test_auto = real(s);  // 1 = gun test, 2 = melee test (scrCoopTestAuto)
}
coop_test_t = 0;
coop_test_n = 0;
// Host entity replication (scrCoopSendEnts): ids seen this pass / last pass.
coop_ent_now = ds_map_create();
coop_ent_sum = ds_map_create();
coop_ent_skip = ds_map_create();  // host: corpses the client created (CORPSE) - never sent back  // host instance id -> checksum of the last sent look
coop_ent_list_now = ds_list_create();
coop_ent_list_prev = ds_list_create();
coop_ent_pass = 0;
coop_ent_refresh = 0;
coop_frame = 0;
coop_cancel_log = 0;
// Projectile watermark: instances with a larger id were created after the last End Step (scrCoopSendShots).
coop_mark = 0;
with (instance_create(0, 0, objCoopMarker))
{
    other.coop_mark = id;
    instance_destroy();
}
coop_heard = 0;
