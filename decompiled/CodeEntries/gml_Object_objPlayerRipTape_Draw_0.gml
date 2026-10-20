if (image_index > 11)
{
    if (ripped == 0)
    {
        ripped = 1;
        audio_play_sound(sndBox, 0, false);
    }
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (sprite_index == sprPJacketRipTape)
{
    maskaddx[0] = 0;
    maskaddy[0] = 0;
    maskaddx[1] = 1;
    maskaddy[1] = -1;
    maskaddx[2] = 2;
    maskaddy[2] = -1;
    maskaddx[3] = 2;
    maskaddy[3] = -1;
    maskaddx[4] = 2;
    maskaddy[4] = -1;
    maskaddx[5] = 2;
    maskaddy[5] = -1;
    maskaddx[6] = 2;
    maskaddy[6] = -1;
    maskaddx[7] = 2;
    maskaddy[7] = -1;
    maskaddx[8] = 2;
    maskaddy[8] = -1;
    maskaddx[9] = 2;
    maskaddy[9] = -1;
    maskaddx[10] = 2;
    maskaddy[10] = -1;
    maskaddx[11] = 2;
    maskaddy[11] = -1;
    maskaddx[12] = 2;
    maskaddy[12] = -1;
    maskaddx[13] = 2;
    maskaddy[13] = -1;
    maskaddx[14] = 2;
    maskaddy[14] = -1;
    maskaddx[15] = 0;
    maskaddy[15] = -1;
    left = 1;
    check = 1;
    scrDrawMask(0);
}
