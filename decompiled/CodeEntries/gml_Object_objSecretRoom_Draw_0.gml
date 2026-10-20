draw_set_blend_mode(bm_subtract);
draw_set_blend_mode_ext(bm_zero, bm_inv_src_color);
draw_set_colour(merge_color(merge_color(c_gray, make_colour_rgb(88, 75, 104), 0.35), c_black, alpha));
draw_rectangle(xdestroy + 7 + xcrutches, ydestroy + 7 + ycrutches, xdestroy2, ydestroy2, false);
if (instance_number(objSecretRoom) == 1)
{
    draw_ellipse_colour((xdestroy - 21) + xcrutches, (ydestroy - 21) + ycrutches, xdestroy2 + 28, ydestroy2 + 28, merge_color(merge_color(c_gray, c_dkgray, 0.5), c_black, alpha), c_black, 0);
}
draw_set_blend_mode(bm_normal);
