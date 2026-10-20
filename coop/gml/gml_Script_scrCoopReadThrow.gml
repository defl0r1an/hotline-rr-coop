// Host: THROW (83, field order in scrCoopThrowSend) - the partner threw / dropped a weapon; throw the real one.
var r, obj, img, am, hot, dec, px, py, dir, spd, ang, fr, b;
r = external_call(global.coop_f_ri);
obj = external_call(global.coop_f_ri);
img = external_call(global.coop_f_ri);
am = external_call(global.coop_f_rd);
hot = external_call(global.coop_f_rf);
dec = external_call(global.coop_f_ri);
px = external_call(global.coop_f_rf);
py = external_call(global.coop_f_rf);
dir = external_call(global.coop_f_rf);
spd = external_call(global.coop_f_rf);
ang = external_call(global.coop_f_rf);
fr = external_call(global.coop_f_rf);
external_call(global.coop_f_rf);
external_call(global.coop_f_rf);
if (global.coop_role != 1 || !global.coop_active || r != room || (obj != objWeaponThrow && obj != objThrowingWeapon))
{
    exit;
}
if (test_auto == 3)
{
    external_call(global.coop_f_log, "test: host received THROW " + object_get_name(obj));
}
b = instance_create(px, py, obj);
ds_map_add(global.coop_net_ids, b, 1);
b.image_index = img;
b.direction = dir;
b.speed = spd;
b.image_angle = ang;
b.friction = fr;
if (obj == objWeaponThrow)
{
    b.ammo = am;
    b.hotalpha = hot;
    b.decadenced = dec;
}
