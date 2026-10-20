if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
if (global.maskindex == 27 || ((global.maskindex == 2 || global.maskindex == 6) && global.hardmode == 1))
{
    exit;
}
if (!instance_exists(objPlayer))
{
    exit;
}
with (objSpecificWeapon)
{
    if (global.maskindex == 26 && global.maskon == 1)
    {
        draw_sprite_ext(sprArrowHLM1, 0, x, (y - 8) + lengthdir_x(4, dir * 2), 1, 1, 0, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sprArrow, 0, x, (y - 8) + lengthdir_x(4, dir * 2), 1, 1, 0, c_white, 1);
    }
}
with (objWeapon)
{
    if (image_index == 1 || image_index == 6)
    {
        if (global.maskindex == 26 && global.maskon == 1)
        {
            draw_sprite_ext(sprArrowHLM1, 0, x, (y - 8) + lengthdir_x(4, dir * 2), 1, 1, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(sprArrow, 0, x, (y - 8) + lengthdir_x(4, dir * 2), 1, 1, 0, c_white, 1);
        }
    }
}
