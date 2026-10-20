if (rasmus == 1 && global.maskindex != 1)
{
    exit;
}
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_self();
shader_reset();
if (global.maskindex == 1 && image_index == 0)
{
    draw_set_blend_mode(bm_add);
    draw_circle_color(x, y, 16 + random(8) + light, make_color_hsv(0, 0, 30), c_black, 0);
    draw_set_blend_mode(bm_normal);
}
