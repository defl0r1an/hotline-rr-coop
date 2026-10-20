image_index = 1;
image_speed = 0;
ammo = 0;
bled = 0;
bag = 0;
scrInitMaskPos();
scrUpdateMaskPos(67);
energie = round(random(1));
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 3;
    }
}
throwindex = global.throwindex;
