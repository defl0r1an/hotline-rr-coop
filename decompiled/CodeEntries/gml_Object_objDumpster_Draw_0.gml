if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
if (on == 0)
{
    if (global.maskindex == 26 && global.maskon == 1)
    {
        draw_sprite_ext(sprArrowHLM1, 0, x + 32, y + 60 + lengthdir_x(3, dir), 1, 1, 180, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sprArrow, 0, x + 32, y + 60 + lengthdir_x(3, dir), 1, 1, 180, c_white, 1);
    }
}
dir += 8;
