hurtindex = 0;
targetindex = 0;
image_speed = 0;
scrInitMaskPos();
ammo = 0;
edir = 0;
sprite_index = sprPAxeKill;
if (global.weaponsprite == 10)
{
    sprite_index = sprPAxeKill;
}
if (global.weaponsprite == 39)
{
    sprite_index = sprPSwordKill;
}
scrUpdateMaskPos(sprite_index);
bled = 0;
