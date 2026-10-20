if (instance_exists(objBoss1Die))
{
    active = 1;
}
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
if (state == 2)
{
    if (global.maskindex == 26 && global.maskon == 1)
    {
        draw_sprite_ext(sprArrowHLM1, 0, (x - 20) + lengthdir_x(4, dir), y, 1, 1, 90, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sprArrow, 0, (x - 20) + lengthdir_x(4, dir), y, 1, 1, 90, c_white, 1);
    }
}
dir += 8;
