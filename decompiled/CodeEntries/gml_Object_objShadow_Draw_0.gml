draw_set_blend_mode(bm_subtract);
draw_set_blend_mode_ext(bm_zero, bm_inv_src_color);
draw_set_colour(merge_color(merge_color(c_gray, make_colour_rgb(88, 75, 104), 0.35), c_black, alpha));
draw_rectangle(xshadow + 7 + xcrutches, yshadow + 7 + ycrutches, xshadow2, yshadow2, false);
if (instance_number(objShadow) == 1)
{
    draw_ellipse_colour((xshadow - 21) + xcrutches, (yshadow - 21) + ycrutches, xshadow2 + 28, yshadow2 + 28, merge_color(merge_color(c_gray, c_dkgray, 0.5), c_black, alpha), c_black, 0);
}
draw_set_blend_mode(bm_normal);
