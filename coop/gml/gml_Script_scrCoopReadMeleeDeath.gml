// Client: DEATH_MELEE (96, from scrCoopMeleePuppet) - an enemy on the host reached this player. The death goes
// through the game's own bullet-hit code: an enemy bullet is spawned against the player from the enemy's side,
// so blood and objPlayerDead work as usual (the death pose is a shot one, not a melee one).
var r, ex, ey, dtype, p, d, b;
r = external_call(global.coop_f_ri);
ex = external_call(global.coop_f_rf);
ey = external_call(global.coop_f_rf);
dtype = external_call(global.coop_f_rf);
external_call(global.coop_f_rf);
if (!global.coop_active || global.coop_role != 2 || r != room)
{
    exit;
}
p = instance_find(objPlayerMouse, 0);
if (p == noone || !instance_exists(p))
{
    exit;
}
d = point_direction(ex, ey, p.x, p.y);
// A melee hit always kills: the bullet code lets a player with energie 1 survive half the time (and armour
// masks more). Spawned on the player itself, so a wall right behind them cannot stop it (a bullet inside
// objSolid is pushed back first).
if (dtype == 1)
{
    global.coop_death_sprite = sprPBackCut;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
}
else if (dtype == 2 || dtype == 3)
{
    global.coop_death_sprite = sprPBackEaten;
    audio_play_sound(sndDogAttack, 0, false);
}
else
{
    global.coop_death_sprite = choose(sprPBackBlunt, sprPBackBlunt, sprPFrontBlunt);
    audio_play_sound(sndHit, 0, false);
}
p.energie = 0;
b = instance_create(p.x - lengthdir_x(1, d), p.y - lengthdir_y(1, d), objEBullet);
ds_map_add(global.coop_net_ids, b, 1);
b.direction = d;
b.speed = 2;
b.image_angle = d;
external_call(global.coop_f_log, "client: killed in melee by the host's enemy");
