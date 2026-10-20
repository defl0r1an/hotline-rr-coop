dir += 0.5;
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "CigaretteMask"), image_index, x, y, image_xscale, image_yscale, image_angle, merge_color(c_dkgray, merge_color(c_maroon, c_red, 0.5 + lengthdir_x(0.5, dir)), clamp(cigarette, 0, 1)), image_alpha);
if (sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "WireMask")))
{
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "WireMask"), image_index, x, y, image_xscale, image_yscale, image_angle, ColorWire, image_alpha);
}
