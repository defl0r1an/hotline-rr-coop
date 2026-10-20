if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, image_index, x + 3, y + 3, 1, 1, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, image_alpha);
camangle = image_angle + angle + clamp(dir, -30, 30);
draw_sprite_ext(sprite, image_index, x + lengthdir_x(5, image_angle) + 3, y + lengthdir_y(5, image_angle) + 3, 1, 1, image_angle + angle + clamp(dir, -30, 30), c_black, alpha - 0.5);
lightdir = point_direction(0, 0, 4, 0) + image_angle;
dist = point_distance(0, 0, 4, 0);
lightx = lengthdir_x(dist, lightdir);
lighty = lengthdir_y(dist, lightdir);
draw_set_blend_mode(bm_add);
draw_triangle_color(x + lengthdir_x(5, camangle) + lightx, y + lengthdir_y(5, camangle) + lighty, x + lengthdir_x(32, camangle - radius), y + lengthdir_y(32, camangle - radius), x + lengthdir_x(32, camangle + radius), y + lengthdir_y(32, camangle + radius), merge_color(c_maroon, c_black, clamp(((0.75 - (observer / 2)) + random(0.1) + destroyed) - blinklight, 0, 1)), 0, 0, 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
draw_sprite_ext(sprite, image_index, x + lengthdir_x(5, image_angle), y + lengthdir_y(5, image_angle), 1, 1, image_angle + angle + clamp(dir, -30, 30), image_blend, alpha);
shader_reset();
