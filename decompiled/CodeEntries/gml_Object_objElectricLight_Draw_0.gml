draw_set_blend_mode(bm_add);
if (global.maskindex == 26 && global.maskon == 1)
{
    draw_circle_color(x, y, r, merge_color(c_dkgray, c_white, random(1)), c_black, 0);
}
else
{
    draw_circle_color(x, y, r, merge_color(c_aqua, c_white, random(1)), c_black, 0);
}
draw_set_blend_mode(bm_normal);
if (r > 0)
{
    r -= 2;
}
else
{
    instance_destroy();
}
