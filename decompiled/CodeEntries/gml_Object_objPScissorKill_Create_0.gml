image_speed = 0;
bled = 0;
scrInitMaskPos();
scrUpdateMaskPos(166);
ammo = 0;
energie = round(random(1));
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 3;
    }
}
