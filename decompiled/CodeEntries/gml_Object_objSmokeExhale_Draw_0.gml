if (image_index >= 2)
{
    draw_sprite_ext(sprite_index, image_index - 1, x, y, scale, scale / image_yscale, image_angle, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x, y, scale, scale / image_yscale, image_angle, merge_color(c_white, c_gray, 0.25 + random(0.25)), image_alpha);
