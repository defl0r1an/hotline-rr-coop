d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_blend_mode(bm_subtract);
if (global.hardmode == 0)
{
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 890 + random(24), c_black, make_colour_rgb(77, 250, 163), 0);
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 840 + random(24), make_colour_rgb(0, 28, 32), merge_color(c_ltgray, make_colour_rgb(0, 32, 47), 0.98), 0);
}
else
{
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 520 + random(24), merge_color(make_colour_rgb(64, 255, 207), merge_color(c_black, c_ltgray, 0.02), 0.98), make_colour_rgb(64, 255, 207), 0);
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 880 + random(24), merge_color(c_black, c_ltgray, 0.12), c_ltgray, 0);
}
draw_set_blend_mode(bm_normal);
