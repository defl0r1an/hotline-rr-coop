// Restart this PC's floor the game's way (objEffector's R handler) past the co-op gate. On the host it also tells
// the client (RESTART 115: room i), so both start the floor again together.
if (global.coop_role == 1)
{
    external_call(global.coop_f_begin, 115);
    external_call(global.coop_f_wi, room);
    external_call(global.coop_f_end, 1);
}
global.coop_restart_ok = 1;
with (objEffector)
{
    if (object_index == objEffectorHouse)
    {
        // Boss floors: objEffectorHouse's own R handler only serves rmAlley; the bosses' handlers restart with
        // objEffector.fade = 1 (the fade's end calls room_restart in those rooms).
        fade = 1;
    }
    else
    {
        event_perform(ev_keypress, ord("R"));
    }
}
global.coop_restart_ok = 0;
external_call(global.coop_f_log, "floor restart (both players dead) in " + room_get_name(room));
