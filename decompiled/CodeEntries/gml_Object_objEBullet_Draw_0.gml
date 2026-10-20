if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
i = 0;
dist = point_distance(startx, starty, x, y);
dir = point_direction(startx, starty, x, y);
i = 0;
repeat (dist / 1)
{
    draw_sprite_ext(sprBulletTracer, image_index, startx + lengthdir_x(i, direction), starty + lengthdir_y(i, direction), image_xscale * 0.5, image_yscale, image_angle, merge_color(merge_color(c_gray, c_white, 0.5), merge_color(c_white, c_gray, 0.5), i / dist), (i / dist) * alpha * 0.5);
    i += 1;
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 0.8, image_yscale, image_angle, image_blend, 0.9);
shader_reset();
