hurtindex = 0;
targetindex = 0;
image_speed = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;
bottom = 468;
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
edir = 0;
energie = round(random(1));
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 3;
    }
}
