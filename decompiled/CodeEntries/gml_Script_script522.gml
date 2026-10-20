draw_set_blend_mode(bm_add);
draw_sprite_ext(HotWeapon, image_index, x, y, image_xscale, image_yscale * left, dir, merge_color(c_red, c_orange, 0.5), HotWeaponAlpha);
draw_sprite_ext(HotWeapon, image_index, x, y, image_xscale, image_yscale * left, dir, merge_color(c_white, c_ltgray, 0.5), HotWeaponAlpha / 9);
draw_set_blend_mode(bm_normal);
