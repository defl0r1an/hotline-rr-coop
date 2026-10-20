draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, angle, c_black, 0.5);
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, angle, image_blend, image_alpha);
shader_reset();
draw_set_blend_mode(bm_add);
draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Hot"), image_index, x, y, image_xscale, image_yscale * left, angle, merge_color(c_red, c_orange, 0.5), hotalpha);
draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Hot"), image_index, x, y, image_xscale, image_yscale * left, angle, merge_color(c_white, c_ltgray, 0.5), hotalpha / 7);
draw_set_blend_mode(bm_normal);
