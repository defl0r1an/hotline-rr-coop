texture_set_interpolation(true);
draw_set_blend_mode(bm_subtract);
draw_surface(global.surf1, view_xview[0] - 16, view_yview[0] - 16);
draw_set_blend_mode(bm_normal);
texture_set_interpolation(false);
