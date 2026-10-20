draw_set_color(merge_color(c_purple, c_black, 0.5));
draw_rectangle(0, sprite_height, sprite_width, sprite_height, false);
draw_set_color(merge_color(c_orange, merge_color(c_red, c_orange, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3)));
draw_rectangle(0, sprite_height, sprite_width, sprite_height, false);
draw_set_color(merge_color(c_purple, c_black, 0.5));
draw_rectangle(1, sprite_height - 1, sprite_width + comboline + movingline, sprite_height - 1, false);
draw_set_color(merge_color(merge_color(c_purple, c_aqua, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3)));
draw_rectangle(1, sprite_height - 1, sprite_width + comboline + movingline, sprite_height - 1, false);
