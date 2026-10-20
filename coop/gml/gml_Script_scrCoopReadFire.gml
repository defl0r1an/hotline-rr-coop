// FIRE (80) on the host, EFIRE (81) / host bullets (82) on the client: re-creates the partner's projectile here
// (field order in scrCoopFireSend). argument0 = message type.
var r, obj, spr, px, py, dir, spd, ang, fr, xs, ys, b;
r = external_call(global.coop_f_ri);
obj = external_call(global.coop_f_ri);
spr = external_call(global.coop_f_ri);
px = external_call(global.coop_f_rf);
py = external_call(global.coop_f_rf);
dir = external_call(global.coop_f_rf);
spd = external_call(global.coop_f_rf);
ang = external_call(global.coop_f_rf);
fr = external_call(global.coop_f_rf);
xs = external_call(global.coop_f_rf);
ys = external_call(global.coop_f_rf);
if (!global.coop_active || r != room || !object_exists(obj))
{
    exit;
}
if (argument0 == 80 && global.coop_role != 1)
{
    exit;
}
if (argument0 == 81 && (global.coop_role != 2 || obj != objEBullet))
{
    exit;
}
if (argument0 == 82 && global.coop_role != 2)
{
    exit;
}
if (argument0 == 82 && test_auto == 3)
{
    external_call(global.coop_f_log, "test: client received host projectile " + object_get_name(obj));
}
b = instance_create(px, py, obj);
ds_map_add(global.coop_net_ids, b, 1);
b.direction = dir;
b.speed = spd;
b.image_angle = ang;
b.friction = fr;
b.image_xscale = xs;
b.image_yscale = ys;
if (sprite_exists(spr))
{
    b.sprite_index = spr;
}
if (argument0 == 80)
{
    coop_heard = 1;  // enemies near the puppet hear the shot (objCoopNet, after the message loop)
}
