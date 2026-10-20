if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_sprite_ext(bottom, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(bottom, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
scrDrawMask(1);
shader_reset();
