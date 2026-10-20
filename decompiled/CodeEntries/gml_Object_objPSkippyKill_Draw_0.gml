if (hurtindex < targetindex)
{
    hurtindex += 0.2;
}
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
if (bled == 0)
{
    draw_sprite_ext(enemy, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(enemy, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
shader_reset();
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_set_alpha(global.GlowSkippy - (global.GlowSkippy / 1.5));
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 25 + (global.PShaking * 2) + lengthdir_x(global.GlowSkippy * 2, global.flicker * 4) + (global.GlowSkippy * 15), merge_color(c_lime, c_red, global.GlowSkippy), c_black, 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle + global.PShaking, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle + global.PShaking, image_blend, image_alpha);
d3d_set_fog(true, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 0, 0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle + global.PShaking, image_blend, global.GlowSkippy - (global.GlowSkippy / 1.5));
draw_set_blend_mode(bm_normal);
d3d_set_fog(false, c_black, 0, 0);
if (sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Glow")))
{
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y, image_xscale, image_yscale, image_angle + global.PShaking, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 1);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y, image_xscale, image_yscale, image_angle + global.PShaking, merge_color(c_purple, c_fuchsia, clamp(global.GlowDebuff, 0, 1)), global.GlowDebuff);
}
if (global.maskon)
{
    scrDrawMask(1);
}
shader_reset();
