// objPlayerDead's camera target (y): the partner while they are alive, 1.5 s after this player died; else the corpse.
var coop_q;
if (global.coop_active && global.coop_spec_t > 90)
{
    coop_q = instance_find(objCoopPuppet, 0);
    if (coop_q != noone && instance_exists(coop_q))
    {
        return coop_q.y;
    }
}
return y;
