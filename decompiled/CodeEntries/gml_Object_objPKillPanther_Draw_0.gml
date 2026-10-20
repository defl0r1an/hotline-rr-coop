draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle + 90, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle + 90, image_blend, image_alpha);
maskdir = point_direction(0, 0, maskx[floor(image_index)], masky[floor(image_index)]) + image_angle + 90;
dist = point_distance(0, 0, maskx[floor(image_index)], masky[floor(image_index)]);
maddx = lengthdir_x(dist, maskdir);
maddy = lengthdir_y(dist, maskdir);
draw_sprite_ext(scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], "Mask"), global.maskindex, x + maddx + 1, y + maddy + 1, image_xscale, image_yscale, image_angle + 90 + maskangle[floor(image_index)], c_black, 0.25);
draw_sprite_ext(scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], "Mask"), global.maskindex, x + maddx, y + maddy, image_xscale, image_yscale, image_angle + 90 + maskangle[floor(image_index)], image_blend, image_alpha);
