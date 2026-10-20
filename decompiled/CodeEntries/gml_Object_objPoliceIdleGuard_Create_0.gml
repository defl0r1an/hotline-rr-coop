image_speed = 0;
image_index = 0;
reload = floor(random(10));
alert = 0;
direction = random(360);
ammo = 0;
path = path_add();
on = 0;
if (sprite_index == sprEPoliceStandGuardM16)
{
    ammo = 20;
}
if (sprite_index == sprEPoliceStandGuard9mm)
{
    ammo = 13;
}
if (sprite_index == sprEPoliceStandGuardShotgun)
{
    ammo = 6;
}
