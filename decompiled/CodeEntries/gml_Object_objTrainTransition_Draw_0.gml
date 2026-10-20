if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_sprite_general(sprite_index, image_index, 0, 0, sprite_get_width(sprite_index), sprite_get_width(sprite_index) + yy + -75, x + 39, (y - yy) + 208, image_xscale, image_yscale, 0, merge_color(c_dkgray, c_white, shadow), merge_color(c_dkgray, c_white, shadow), merge_color(c_black, c_white, shadow1), merge_color(c_black, c_white, shadow1), 1);
shader_reset();
