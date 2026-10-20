if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
dir += 0.15;
if (random(randomlight) <= 10)
{
    light = 0.5 - random(0.25);
}
else
{
    light = 1;
}
color0 = merge_color(c_black, merge_color(c_yellow, merge_color(c_orange, c_yellow, 0.15), 0.5 + lengthdir_x(0.5, dir)), light);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprTableGuardLampe, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprTableGuardLampe, 1, x, y, image_xscale, image_yscale, image_angle, color0, light);
draw_set_blend_mode(bm_normal);
shader_reset();
