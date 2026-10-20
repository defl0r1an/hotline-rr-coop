if (on)
{
    draw_set_blend_mode(bm_add);
    draw_line_width_colour(x, y, laserx, lasery, 3, merge_color(merge_color(c_red, c_white, 0.2 + lengthdir_x(0.2, dir - 180)), c_black, random(0.2)), merge_color(merge_color(c_red, c_white, 0.2 + lengthdir_x(0.2, dir)), c_black, random(0.2)));
    draw_set_blend_mode(bm_normal);
    dir += 8;
}
