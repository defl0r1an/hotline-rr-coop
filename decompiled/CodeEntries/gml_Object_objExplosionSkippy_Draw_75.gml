d3d_set_projection_ortho(0, 0, global.wview, global.hview, 0);
draw_set_blend_mode(bm_add);
draw_set_circle_precision(10 + random(10));
draw_circle_color(global.wview / 2, global.hview / 2, 380 + (circlescale * 4), c_black, merge_color(c_black, merge_color(c_orange, c_yellow, 0.5 - random(0.5)), circlealpha), 0);
draw_set_circle_precision(24);
draw_set_blend_mode(bm_normal);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
