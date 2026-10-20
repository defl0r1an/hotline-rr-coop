// Client, every Begin Step while connected: keep this PC on the host's floor, or in the main menu
// while the host is in menus, story rooms or score screens. Runs inside objCoopNet.
var hr;
hr = global.coop_host_room;
if (room == rmPause || coop_leaving)
{
    exit;
}
if (hr < 0)
{
    // The game's own way back to the menu (pause > quit) is game_restart; the DLL session survives it.
    if (instance_exists(objEffector))
    {
        coop_leaving = 1;
        global.coop_restarting = 1;
        external_call(global.coop_f_log, "host left the floors: back to menu");
        game_restart();
    }
    exit;
}
if (room == hr)
{
    exit;
}
if (global.PauseRestart != 0)
{
    exit;  // the level's reset walk is still running
}
if (instance_exists(objEffector))
{
    if (global.level == global.coop_host_level)
    {
        if (instance_exists(objMaskMenu))
        {
            exit;  // let the client pick a mask on the first floor before following
        }
        external_call(global.coop_f_log, "following host to room " + string(hr));
        room_goto(hr);
        exit;
    }
}
scrCoopEnterLevel(global.coop_host_level, global.coop_host_sequence, global.coop_host_hardmode, global.coop_host_title, global.coop_host_pretitle);
