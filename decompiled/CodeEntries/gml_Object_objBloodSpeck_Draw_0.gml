if (global.maskindex == 19 || place_meeting(x, y, objSewerWaterWave))
{
    if (image_alpha > 0)
    {
        image_alpha -= 0.01;
    }
    else
    {
        instance_destroy();
    }
}
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, image_alpha);
