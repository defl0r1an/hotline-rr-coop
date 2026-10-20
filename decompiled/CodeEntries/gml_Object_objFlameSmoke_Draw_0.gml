dir += 0.15;
if (global.maskindex == 26 && global.maskon == 1)
{
    if (image_index > 1)
    {
        draw_sprite_ext(sprite_index, image_index - 1, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
    }
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
}
else
{
    if (image_index > 1)
    {
        draw_sprite_ext(sprite_index, image_index - 1, x, y, image_xscale, image_yscale, image_angle, merge_color(merge_color(c_orange, c_red, random(0.5)), c_maroon, clamp(dir - 0.25, 0, 1)), 1);
    }
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, merge_color(merge_color(c_orange, c_red, random(0.5)), c_maroon, clamp(dir - 0.25, 0, 1)), 1);
}
shader_reset();
