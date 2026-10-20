visible = false;
image_speed = 0;
i = 0;
repeat (68)
{
    maskaddx[i] = 0;
    maskaddy[i] = 0;
    i += 1;
}
scrUpdateHeadPos(sprite_index);
last_sprite = sprite_index;
stage = "Walk";
alarm[0] = -1;
maskindex = 0;
