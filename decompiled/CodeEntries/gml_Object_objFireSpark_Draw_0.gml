draw_set_blend_mode(bm_add);
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
if (global.maskindex == 26 && global.maskon == 1)
{
    image_blend = c_white;
}
else
{
    image_blend = merge_color(merge_color(c_white, c_yellow, random(1)), c_red, alpha);
}
image_xscale = speed * 0.5;
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
draw_set_blend_mode(bm_normal);
