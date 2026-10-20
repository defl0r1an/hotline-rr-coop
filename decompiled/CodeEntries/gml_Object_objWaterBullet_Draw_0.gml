if (speedbullet == 0)
{
    i = 0;
    repeat (blur)
    {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + ((1 * i) / 10), image_yscale + ((1 * i) / 10), image_angle, image_blend, image_alpha - ((1 * i) / 10));
        i += 1;
    }
    repeat (4 - (image_alpha * 4))
    {
        my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objWaterPuddle2);
        my_id.direction = direction - 140 - random(80);
        my_id.speed = clamp((speed / 2) + random(speed / 4), 0, 2);
        my_id.image_blend = image_blend;
        my_id.image_alpha = image_alpha / 2;
    }
    if (image_alpha > 0)
    {
        image_alpha -= 0.08;
        if (blur < 10)
        {
            blur += 0.8;
        }
    }
    else
    {
        instance_destroy();
    }
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
