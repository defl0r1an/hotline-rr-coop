if (global.maskindex == 19 || place_meeting(x, y, objSewerWaterWave))
{
    i = 0;
    repeat (blur)
    {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + ((1 * i) / 10), image_yscale + ((1 * i) / 10), image_angle, image_blend, image_alpha - ((1 * i) / 10));
        i += 1;
    }
    if (image_alpha > 0)
    {
        image_alpha -= 0.01;
        if (blur < 10)
        {
            blur += 0.1;
        }
    }
    else
    {
        instance_destroy();
    }
}
draw_self();
