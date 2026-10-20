draw_set_blend_mode(bm_subtract);
draw_circle_colour(x, y, (image_yscale + image_xscale) * 12, c_white, c_black, 0);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle - dir, image_blend, image_alpha);
