hurtindex = 0;
targetindex = 0;
image_speed = 0;
scrInitMaskPos();
scrUpdateMaskPos(2502);
ammo = 0;
bottom = 2705;
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
edir = 0;
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 3;
    }
}
