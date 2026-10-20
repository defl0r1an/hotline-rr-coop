// Co-op gate for every R (restart) handler, called first in them; returns 1 when the handler must stop.
// A floor restarts only when both players are dead, and on both PCs together (scrCoopRestartBoth). While co-op
// is off, or inside scrCoopRestartBoth, it returns 0 and the game's handler runs as usual.
var coop_q;
if (global.coop_active && !global.coop_restart_ok)
{
    if (instance_exists(objPlayer) && global.deadIgel != 1)
    {
        return 1;
    }
    if (scrCoopPartnerAlive())
    {
        if (global.coop_notice_time <= 0)
        {
            external_call(global.coop_f_log, "restart blocked: partner still alive");
        }
        global.coop_notice = "YOUR PARTNER IS STILL ALIVE - WAIT FOR THEM";
        global.coop_notice_time = 120;
        return 1;
    }
    if (global.coop_restart_cd > 0)
    {
        return 1;
    }
    global.coop_restart_cd = 60;
    coop_q = instance_find(objCoopPuppet, 0);
    if (coop_q != noone && instance_exists(coop_q))
    {
        external_call(global.coop_f_log, "restart key in " + object_get_name(object_index) + ": partner kind " + string(coop_q.p_kind) + " stale " + string(coop_q.stale));
    }
    else
    {
        external_call(global.coop_f_log, "restart key in " + object_get_name(object_index) + ": no partner puppet");
    }
    if (global.coop_role == 2)
    {
        external_call(global.coop_f_begin, 114);
        external_call(global.coop_f_wi, room);
        external_call(global.coop_f_end, 1);
        return 1;
    }
    scrCoopRestartBoth();
    return 1;
}
return 0;
