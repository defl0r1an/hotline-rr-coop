draw_sprite_ext(sprite_index, 0, x - 7, y, image_xscale, image_yscale, image_angle, c_black, 0.35);
draw_sprite_ext(sprShootingRangeRope, 0, x, y + 3 + 51, image_xscale, image_yscale, image_angle, c_black, 0.35);
draw_sprite_ext(sprShootingRangeRope, 0, x, y + 51, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
i = 0;
repeat (3)
{
    if (lamp[i] == 1)
    {
        draw_sprite_ext(sprite_index, i + 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
    if (alarmlamp[i] > 0)
    {
        alarmlamp[i]--;
    }
    if (alarmlamp[i] <= 0)
    {
        if (lamp[i] == 1)
        {
            lamp[i] = 0;
            alarmlamp[i] = 1 + round(random(6));
        }
        else
        {
            lamp[i] = 1;
            alarmlamp[i] = 150 + round(random(250));
        }
    }
    i += 1;
}
