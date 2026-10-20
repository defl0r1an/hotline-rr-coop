if (global.xbox == 1)
{
    scrInitXboxButtons();
}
energie = 1 + floor(random(4));
image_index = 3;
image_speed = 0;
ammo = 0;
scrInitMaskPos();
scrUpdateMaskPos(57);
maskindex = global.maskindex;
global.bigballs = 0;
