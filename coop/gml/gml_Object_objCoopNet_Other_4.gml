// Room Start: optional windowed mode for testing two copies on one PC (windowed=1 in coop.ini).
// The splash screen forces fullscreen in its Create event, which runs before this.
if (cfg_windowed)
{
    window_set_fullscreen(false);
}
ds_map_clear(global.coop_net_ids);
ds_map_clear(global.coop_gone);
global.coop_spec_t = 0;
if (global.coop_state == 3 && global.coop_role == 2)
{
    scrCoopClientRoomStart();
}
external_call(global.coop_f_log, "room start " + room_get_name(room) + " state " + string(global.coop_state) + " role " + string(global.coop_role));
coop_test_t = 0;
