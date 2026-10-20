// Host: CORPSE (68: room i, spr i, img f, w4(x, y, image_angle, 0)) - a corpse the partner's own execution left;
// it becomes a real corpse here and is never sent back (coop_ent_skip). Called by objCoopNet.
var r, spr, img, px, py, ang, b;
r = external_call(global.coop_f_ri);
spr = external_call(global.coop_f_ri);
img = external_call(global.coop_f_rf);
px = external_call(global.coop_f_rf);
py = external_call(global.coop_f_rf);
ang = external_call(global.coop_f_rf);
external_call(global.coop_f_rf);
if (global.coop_role != 1 || !global.coop_active || r != room || !sprite_exists(spr))
{
    exit;
}
if (test_auto == 3)
{
    external_call(global.coop_f_log, "test: host received CORPSE");
}
b = instance_create(px, py, objDeadBody);
ds_map_add(coop_ent_skip, b, 1);
b.sprite_index = spr;
b.image_index = img;
b.image_angle = ang;
