draw_sprite_ext(sprite_index, image_index, x + 3, y + 3, image_xscale, image_yscale, image_angle, c_black, image_alpha / 2);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprSignGlow, index, x, y, image_xscale, image_yscale, image_angle, merge_color(c_ltgray, c_white, random(1)), image_alpha);
index += 0.2;
draw_set_blend_mode(bm_normal);
if (place_meeting(x, y, objPlayer))
{
    image_alpha = lerp(image_alpha, 0.5, 0.25);
}
else
{
    image_alpha = lerp(image_alpha, 1, 0.25);
}
