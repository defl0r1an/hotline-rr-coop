d3d_set_fog(true, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 0, 0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, image_blend, global.GlowSkippy - (global.GlowSkippy / 1.5) - global.GlowSkippyEnd);
d3d_set_fog(false, c_black, 0, 0);
draw_set_blend_mode(bm_normal);
if (sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Glow")))
{
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 1);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_purple, c_fuchsia, clamp(global.GlowDebuff, 0, 1)), global.GlowDebuff);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, c_white, global.GlowCharge);
    draw_set_blend_mode(bm_add);
    i = 0;
    repeat (8)
    {
        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x + clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) + i, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x - clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) - i, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y + clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) + i, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y - clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) - i, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
        i += 0.5;
    }
    draw_set_blend_mode(bm_normal);
}
