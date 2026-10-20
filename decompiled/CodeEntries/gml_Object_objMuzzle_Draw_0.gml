if (global.maskindex == 26 && global.maskon == 1)
{
    d3d_set_fog(true, c_white, 0, 0);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
d3d_set_fog(false, c_black, 0, 0);
draw_set_blend_mode(bm_subtract);
draw_circle_color(x, y, 48 + random(6) + 15, merge_color(c_black, merge_color(c_blue, c_aqua, 0.5), 0.3), c_black, 0);
draw_set_blend_mode(bm_normal);
