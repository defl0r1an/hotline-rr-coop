if (hurtindex < targetindex)
{
    hurtindex += 0.2;
}
draw_sprite_ext(sprBoss2AxeAndSword, hurtindex, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_sprite_ext(sprBoss2AxeAndSword, hurtindex, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
if (sprite_index == sprPAxeKill)
{
    draw_sprite_ext(sprite_index, image_index, (x + 1) - lengthdir_x(9, image_angle), (y + 1) - lengthdir_y(9, image_angle), image_xscale, image_yscale, image_angle, c_black, 0.5);
    if (global.maskindex == 26 && global.maskon == 1)
    {
        shader_set(shd_russell_player);
    }
    draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(9, image_angle), y - lengthdir_y(9, image_angle), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
    if (global.maskindex == 26 && global.maskon == 1)
    {
        shader_set(shd_russell_player);
    }
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (global.maskon)
{
    scrDrawMask(1);
}
if (sprite_index == sprPAxeKill)
{
    draw_sprite_ext(sprPAxeKillArms, image_index, x - lengthdir_x(9, image_angle), y - lengthdir_y(9, image_angle), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
shader_reset();
