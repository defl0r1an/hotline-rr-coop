if (global.xbox == 1)
{
    exit;
}
if (global.maskindex == 6 && global.hardmode == 1)
{
    exit;
}
__b__ = action_if_variable(release, 20, 1);
if (__b__ && reload <= 0)
{
    scrPlayerPickUp(0, 0, 0, 0, 0);
}
release = 0;
with (objWeapon)
{
    scrGunIndexGetMaxAmmo(image_index);
}
