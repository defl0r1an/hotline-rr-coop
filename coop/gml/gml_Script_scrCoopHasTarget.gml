// Replaces instance_exists(objPlayer) in the retargeted enemy AI (coop\patch\ai_retarget.txt): enemies keep
// hunting while the host's player is dead but the partner's puppet is alive on the host.
var coop_q;
if (instance_exists(objPlayer))
{
    return 1;
}
if (!global.coop_active || global.coop_role != 1)
{
    return 0;
}
coop_q = instance_find(objCoopPuppet, 0);
if (coop_q == noone || !instance_exists(coop_q))
{
    return 0;
}
return coop_q.p_kind == 1;
