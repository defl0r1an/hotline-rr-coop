if (collision == 0)
{
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, 1, 1, image_angle + lengthdir_y(10, AngleImpact), c_black, 0.5);
    dist = point_distance(startx, starty, x, y);
    dir = point_direction(startx, starty, x, y);
    i = 0;
    repeat (dist / 1)
    {
        draw_sprite_ext(sprite_index, image_index, startx + lengthdir_x(i, direction), starty + lengthdir_y(i, direction), 0.5, 1, image_angle, merge_color(merge_color(c_gray, c_white, 0.5), merge_color(c_white, c_gray, 0.5), i / dist), (i / dist) * 0.25 * 0.5);
        i += 1;
    }
}
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle + lengthdir_y(10, AngleImpact), image_blend, 1);
