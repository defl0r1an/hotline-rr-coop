if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
else
{
    image_blend = merge_color(c_purple, c_white, image_alpha);
}
draw_self();
shader_reset();
if (instance_exists(objPlayer))
{
    image_alpha = lerp(image_alpha, clamp(point_distance(x, y, objPlayer.x, objPlayer.y) / 29, 0.5, 1), 0.25);
}
else
{
    image_alpha = lerp(image_alpha, 1, 0.25);
}
