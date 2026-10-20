if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, alpha / 2);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + (0.3 * scale), image_yscale + (0.3 * scale), direction, merge_color(c_white, c_black, black), alpha);
draw_set_color(c_white);
shader_reset();
