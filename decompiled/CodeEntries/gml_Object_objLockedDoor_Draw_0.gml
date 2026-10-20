draw_sprite_ext(sprite_index, image_index, x + 2, y + 3, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, 1 - solid, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (arrow == 1)
{
    if (global.locked == 0)
    {
        if (solid == 1)
        {
            draw_sprite_ext(sprArrow, 0, (x - 12) + lengthdir_x(3, global.dir * 8), y + 16, 1, 1, 90, c_white, 1);
        }
    }
}
