// Called at the top of the enemy AI scripts listed in coop\patch\ai_retarget.txt, where every objPlayer.x /
// objPlayer.y read was replaced by global.coop_tx / global.coop_ty. Sets them to the player this enemy (self)
// should react to: the nearer of the host's body and the partner's puppet while co-op runs on the host,
// otherwise exactly objPlayer's position (single-player behaviour unchanged). The scripts keep their
// instance_exists(objPlayer) checks, so enemies ignore the puppet while the host is dead.
var coop_p, coop_q, coop_i;
coop_p = noone;
for (coop_i = 0; coop_i < instance_number(objPlayer); coop_i += 1)
{
    coop_q = instance_find(objPlayer, coop_i);
    if (coop_q != noone && instance_exists(coop_q))
    {
        coop_p = coop_q;
        break;
    }
}
if (coop_p != noone)
{
    global.coop_tx = coop_p.x;
    global.coop_ty = coop_p.y;
    global.coop_tinst = coop_p;  // special enemies read other player fields through this (ai_retarget_special.txt)
}
if (!global.coop_active || global.coop_role != 1)
{
    exit;
}
coop_q = instance_find(objCoopPuppet, 0);
if (coop_q == noone || !instance_exists(coop_q))
{
    exit;
}
if (coop_q.p_kind != 1)
{
    exit;
}
if (coop_p == noone || point_distance(x, y, coop_q.x, coop_q.y) < point_distance(x, y, global.coop_tx, global.coop_ty))
{
    global.coop_tx = coop_q.x;
    global.coop_ty = coop_q.y;
    global.coop_tinst = coop_q;
}
