draw_set_blend_mode(bm_subtract);
image_xscale = 4;
image_yscale = 4;
draw_sprite_tiled(sprite_index, toogle, 0, my_y);
my_y = random(32);
draw_set_blend_mode(bm_normal);
