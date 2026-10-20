if (hurtindex < targetindex)
{
    hurtindex += 0.2;
}
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
if (sprite_index == sprPJacketKillThrowingKnife)
{
    if (bled == 0)
    {
        draw_sprite_ext(enemy, 0, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
        draw_sprite_ext(enemy, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
    else
    {
        draw_sprite_ext(enemy, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
        draw_sprite_ext(enemy, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
else
{
    draw_sprite_ext(enemy, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(enemy, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
shader_reset();
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (sprite_index != sprPigKillKnife)
{
    if (global.maskon)
    {
        scrDrawMask(1);
    }
}
shader_reset();
