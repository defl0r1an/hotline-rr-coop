dir += 0.25;
color2 = merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 2.1245));
color1 = merge_color(c_white, merge_color(merge_color(c_yellow, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_aqua, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.75 + lengthdir_y(0.25, dir * 1.73));
draw_rectangle_color(view_xview[0] - 60, view_yview[0] - 60, view_xview[0] + view_wview[0] + 60, view_yview[0] + view_hview[0] + 60, color1, color1, color2, color2, 0);
