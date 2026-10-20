if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
else
{
    image_blend = merge_color(c_purple, c_white, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x + 2, y + 2, image_xscale, image_yscale, image_angle, c_black, image_alpha / 2);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
if (instance_exists(objPlayer))
{
    image_alpha = lerp(image_alpha, clamp(point_distance(x, y, objPlayer.x, objPlayer.y) / 29, 0.5, 1), 0.25);
}
else
{
    image_alpha = lerp(image_alpha, 1, 0.25);
}
