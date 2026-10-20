// Client, called INSIDE with(<local objWeaponThrow / objThrowingWeapon>): THROW (83) to the host, which throws
// the real one (it can knock down / kill its enemies). Fields: room i, obj i, img i, ammo d, hotalpha f,
// decadenced i, w4(x, y, direction, speed), w4(image_angle, friction, 0, 0).
// objThrowingWeapon does not have objWeaponThrow's ammo/hotalpha/decadenced, so they are sent as 0.
if (objCoopNet.test_auto == 3)
{
    external_call(global.coop_f_log, "test: client reports THROW " + object_get_name(object_index));
}
external_call(global.coop_f_begin, 83);
external_call(global.coop_f_wi, room);
external_call(global.coop_f_wi, object_index);
external_call(global.coop_f_wi, image_index);
if (object_index == objWeaponThrow)
{
    external_call(global.coop_f_wd, ammo);
    external_call(global.coop_f_wf, hotalpha);
    external_call(global.coop_f_wi, decadenced);
}
else
{
    external_call(global.coop_f_wd, 0);
    external_call(global.coop_f_wf, 0);
    external_call(global.coop_f_wi, 0);
}
external_call(global.coop_f_w4, x, y, direction, speed);
external_call(global.coop_f_w4, image_angle, friction, 0, 0);
external_call(global.coop_f_end, 1);
