if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, shadow);
draw_self();
shader_reset();
