if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, image_index, x + 2, y + 2, 1, 1, image_angle, c_black, 0.5);
draw_self();
shader_reset();
