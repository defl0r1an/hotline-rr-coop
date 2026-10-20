draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (room != rmJanitors)
{
    exit;
}
if (enter == 0)
{
    if (global.maskindex == 26 && global.maskon == 1)
    {
        draw_sprite_ext(sprArrowHLM1, 0, x + 100 + lengthdir_x(3, dir), y + 77, image_xscale, image_yscale, 270, image_blend, image_alpha);
    }
    else
    {
        draw_sprite_ext(sprArrow, 0, x + 100 + lengthdir_x(3, dir), y + 77, image_xscale, image_yscale, 270, image_blend, image_alpha);
    }
    dir += 4;
}
