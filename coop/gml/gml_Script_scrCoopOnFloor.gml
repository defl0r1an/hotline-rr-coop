// True while this PC is on a combat floor: a plain objEffector controls the room, or objEffectorHouse in one of
// the boss rooms (story rooms and Hospital/Instant floors are not supported), and the level's reset walk is over.
// No var locals inside with() and no variable_global_exists: both crash this runner build.
var coop_i, coop_n, coop_inst;
if (global.PauseRestart != 0 || room == rmPause)
{
    return 0;
}
coop_n = instance_number(objEffector);
for (coop_i = 0; coop_i < coop_n; coop_i += 1)
{
    coop_inst = instance_find(objEffector, coop_i);
    if (!instance_exists(coop_inst))
    {
        continue;
    }
    if (coop_inst.object_index == objEffector)
    {
        return 1;
    }
    if (coop_inst.object_index == objEffectorHouse && (room == rmSecretSewer || room == rmPhoneHomUpstairs || room == rmMansionMainHall || room == rmPhoneHomUpstairsBiker))
    {
        return 1;
    }
}
return 0;
