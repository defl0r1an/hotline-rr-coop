draw_set_blend_mode(bm_add);
draw_set_circle_precision(5);
draw_set_alpha(0.75);
i = 0;
repeat (8)
{
    draw_circle_colour(x + xx[i] + random_range(0.5, -0.5), y + yy[i] + random_range(0.5, -0.5), image_xscale + random(1), merge_color(c_black, c_dkgray, image_alpha), c_black, 0);
    i += 1;
}
draw_set_circle_precision(14);
draw_set_alpha(0.25);
draw_circle_colour(x, y, (image_xscale * 10) + random(1), merge_color(c_black, blend, image_alpha), c_black, 0);
draw_circle_colour(x, y, (image_xscale * 4) + random(1), merge_color(c_black, merge_color(c_white, c_ltgray, 0.5), image_alpha), c_black, 0);
draw_set_alpha(1);
draw_set_circle_precision(24);
i = 0;
repeat (4)
{
    draw_sprite_ext(sprite_index, image_index, x + i, y, image_xscale, image_yscale, image_angle, blend, image_alpha - 0.5 - (i / 2));
    draw_sprite_ext(sprite_index, image_index, x - i, y, image_xscale, image_yscale, image_angle, blend, image_alpha - 0.5 - (i / 2));
    draw_sprite_ext(sprite_index, image_index, x, y + i, image_xscale, image_yscale, image_angle, blend, image_alpha - 0.5 - (i / 2));
    draw_sprite_ext(sprite_index, image_index, x, y - i, image_xscale, image_yscale, image_angle, blend, image_alpha - 0.5 - (i / 2));
    i += 0.5;
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, merge_color(c_white, c_ltgray, 0.5), image_alpha / 4);
draw_set_blend_mode(bm_normal);
