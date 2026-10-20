if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, image_index, x + 5, y + 5, image_xscale, image_yscale, dir, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, dir, image_blend, image_alpha);
draw_set_blend_mode(bm_subtract);
draw_circle_colour(x, y, 15, merge_color(c_black, c_gray, image_alpha), c_black, 0);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprCellFanDot, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * 2);
dir -= speedfan;
shader_reset();
