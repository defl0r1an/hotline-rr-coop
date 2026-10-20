draw_set_blend_mode(bm_add);
draw_circle_color(x, y - move, 16 + random(8), merge_color(c_black, make_color_hsv(0, 0, 30), light), c_black, 0);
draw_set_blend_mode(bm_normal);
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, image_index, x, y - move, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
d3d_set_fog(true, c_white, 0, 0);
draw_sprite_ext(sprite_index, image_index, x, y - move, image_xscale, image_yscale, image_angle, image_blend, clamp((light / 10) + lengthdir_x(light / 10, dir), 0, 1));
d3d_set_fog(false, c_black, 0, 0);
dir += 4;
shader_reset();
