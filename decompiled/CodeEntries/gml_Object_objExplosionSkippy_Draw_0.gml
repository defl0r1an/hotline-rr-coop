draw_set_blend_mode(bm_add);
draw_circle_colour(x, y, circlescale + (scale * 8), merge_color(c_black, c_yellow, circlealpha), c_black, 0);
draw_circle_colour(x, y, circlescale + (scale * 2), merge_color(c_black, c_red, circlealpha), c_black, 0);
i = 0;
repeat (5)
{
    draw_sprite_ext(sprite_index, image_index, x, y, clamp((scale - Explosionend) + i, 1, 10), clamp((scale - Explosionend) + i, 1, 10), image_angle, merge_color(c_white, c_red, i / 2), image_alpha - (i / 2));
    i += 0.5;
}
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, image_angle, image_blend, image_alpha);
