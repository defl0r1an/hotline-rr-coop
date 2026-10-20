// Host, at the top of the game's player-death scripts (scrPlayerDieMelee / ...PantherBite / ...DogBite /
// scrPlayerShieldDieDogBite), in the killing enemy's context. Retargeted enemies decide some kills by the distance
// to their target, which may be the partner's puppet: when the puppet is the nearer one and the host's body is out of
// reach, the partner dies on their own PC (DEATH_MELEE 96) and the host is spared. Returns 1 when redirected.
var coop_q, coop_h, coop_i;
if (!global.coop_active || global.coop_role != 1)
{
    return 0;
}
coop_q = instance_find(objCoopPuppet, 0);
if (coop_q == noone || !instance_exists(coop_q))
{
    return 0;
}
if (coop_q.p_kind != 1)
{
    return 0;
}
coop_h = noone;
for (coop_i = 0; coop_i < instance_number(objPlayer); coop_i += 1)
{
    if (instance_exists(instance_find(objPlayer, coop_i)))
    {
        coop_h = instance_find(objPlayer, coop_i);
        break;
    }
}
if (coop_h != noone)
{
    if (point_distance(x, y, coop_h.x, coop_h.y) <= 24 || point_distance(x, y, coop_q.x, coop_q.y) >= point_distance(x, y, coop_h.x, coop_h.y))
    {
        return 0;  // the host really was hit
    }
}
if (coop_q.coop_hit_cd <= 0)
{
    coop_q.coop_hit_cd = 60;
    external_call(global.coop_f_begin, 96);
    external_call(global.coop_f_wi, room);
    dtype = 0;
if (sprite_index == sprPantherAttack || sprite_index == sprPantherHitback)
{
    dtype = 3;
}
else if (object_index == objDogPatrol || sprite_index == sprDogBite)
{
    dtype = 2;
}
else if (sprite_index == sprEAttackKnife)
{
    dtype = 1;
}
external_call(global.coop_f_w4, x, y, dtype, 0);
    external_call(global.coop_f_end, 1);
    external_call(global.coop_f_log, "host: " + object_get_name(object_index) + " killed the partner (redirected death)");
}
return 1;
