// Host, enemy context (inserted before the enemy's own contact-kill test against objPlayer): the same test
// against the partner's puppet. On contact the enemy plays its attack and the partner dies on their own PC
// (DEATH_MELEE 96: room i, w4(enemy x, enemy y, 0, 0)); returns 1 then. argument0 = reach in front (px).
var coop_p;
if (!global.coop_active || global.coop_role != 1)
{
    return 0;
}
coop_p = instance_find(objCoopPuppet, 0);
if (coop_p == noone || !instance_exists(coop_p))
{
    return 0;
}
if (coop_p.p_kind != 1 || coop_p.coop_hit_cd > 0)
{
    return 0;
}
if (!(place_meeting(x + lengthdir_x(argument0, direction), y + lengthdir_y(argument0, direction), objCoopPuppet) || place_meeting(x, y, objCoopPuppet)))
{
    return 0;
}
if (scrIsSearching(sprite_index))
{
    sprite_index = scrStopSearch(sprite_index);
}
coop_p.coop_hit_cd = 60;
external_call(global.coop_f_begin, 96);
external_call(global.coop_f_wi, room);
dtype = 0;
if (object_index == objDogPatrol)
{
    dtype = 2;
}
else if (sprite_index == sprEAttackKnife || sprite_index == sprPantherHitback)
{
    dtype = 1;
}
external_call(global.coop_f_w4, x, y, dtype, 0);
external_call(global.coop_f_end, 1);
external_call(global.coop_f_log, "host: " + object_get_name(object_index) + " hit the partner in melee");
return 1;
