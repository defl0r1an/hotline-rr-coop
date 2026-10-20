if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, 1, 1, angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, angle, image_blend, image_alpha);
shader_reset();
