if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
if (bottom == "Police" && sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Police")))
{
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Police"), image_index, x + 1, y + 1, image_xscale, image_yscale, direction - 180, c_black, shadow);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Police"), image_index, x, y, image_xscale, image_yscale, direction - 180, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, direction - 180, c_black, shadow);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction - 180, image_blend, image_alpha);
}
shader_reset();
