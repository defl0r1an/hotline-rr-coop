draw_sprite_ext(sprEHeadStomp, image_index / 1.4, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprEHeadStomp, image_index / 1.4, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + 1 + lengthdir_x(10, image_angle), y + 1 + lengthdir_y(10, image_angle), image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(10, image_angle), y + lengthdir_y(10, image_angle), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
