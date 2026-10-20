color += 1;
draw_set_blend_mode(bm_add);
draw_line_width_colour(startx, starty, x, y, 3 + lengthdir_x(1, color * 8), c_black, make_colour_rgb(shadow, shadow, shadow));
draw_set_alpha(1 - clamp(point_distance(startx, starty, x, y) / 464, 0, 0.75));
draw_circle_colour(x, y, point_distance(startx, starty, x, y) / 12, merge_color(make_colour_rgb(shadow, shadow, shadow), c_black, 0.5 + lengthdir_x(0.5, color * 8)), c_black, 0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, merge_color(c_white, c_yellow, lengthdir_x(1, color * 18)), shadowlerp);
