hurtindex = 0;
targetindex = 0;
energie = round(random(1));
image_speed = 0.25;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = objPlayer.ammo;
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
edir = 0;
bled = 0;
hat = 0;
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 3;
    }
}
enemy = 2179;
