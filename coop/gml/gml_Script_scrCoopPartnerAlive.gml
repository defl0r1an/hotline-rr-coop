// True while the partner is on this floor and not dead (their puppet shows a body, or is hidden mid-animation).
var q;
if (!global.coop_active)
{
    return 0;
}
q = instance_find(objCoopPuppet, 0);
if (q == noone || !instance_exists(q))
{
    return 0;
}
if (q.stale > 60)
{
    return 0;
}
return q.p_kind != 2;
