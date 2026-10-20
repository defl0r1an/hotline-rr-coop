// Some game code destroys this persistent controller mid-level (seen right after choosing a mask; the exact
// culprit is not found yet). All session state lives in globals and in the DLL, so come straight back: the new
// instance re-sends HELLO, and the host answers with WELCOME and the current ROOM.
external_call(global.coop_f_log, "objCoopNet destroyed in " + room_get_name(room) + ", recreating");
if (!global.coop_restarting)
{
    instance_create(0, 0, objCoopNet);
}
