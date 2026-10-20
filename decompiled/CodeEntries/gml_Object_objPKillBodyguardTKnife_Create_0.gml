energie = 1 + floor(random(4));
if (global.maskindex == 6)
{
    energie = 0;
}
image_index = 0;
image_speed = 0;
ammo = 0;
state = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
