if (room == rmTutorial)
{
    exit;
}
d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
if (grade == lastgrade)
{
    stnothing = 1;
}
else
{
    stblink = 1;
}
lastgrade = grade;
if (stblink > 0)
{
    stblink -= 0.05;
}
if (grade == "S")
{
    colorgradestatswg3 = merge_color(merge_color(c_olive, c_yellow, 0.5), c_yellow, 0.5 + lengthdir_x(0.5, dir - 180));
    colorgradestatswg4 = merge_color(c_yellow, c_white, 0.5 + lengthdir_x(0.5, dir - 180));
    colorgradestatswg1 = merge_color(merge_color(merge_color(c_olive, c_yellow, 0.5), c_yellow, 0.5 + lengthdir_x(0.5, dir)), c_white, stblink);
    colorgradestatswg2 = merge_color(merge_color(c_yellow, c_white, 0.5 + lengthdir_x(0.5, dir)), c_white, stblink);
}
else
{
    colorgradestatswg3 = merge_color(merge_color(c_maroon, c_red, 0.5), c_red, 0.5 + lengthdir_x(0.5, dir - 180));
    colorgradestatswg4 = merge_color(c_red, c_fuchsia, 0.5 + lengthdir_x(0.5, dir - 180));
    colorgradestatswg1 = merge_color(merge_color(merge_color(c_maroon, c_red, 0.5), c_red, 0.5 + lengthdir_x(0.5, dir)), c_white, stblink);
    colorgradestatswg2 = merge_color(merge_color(c_red, c_fuchsia, 0.5 + lengthdir_x(0.5, dir)), c_white, stblink);
}
scrDrawTimer(global.time, 0);
draw_set_blend_mode(bm_subtract);
i = 0;
repeat (10)
{
    draw_rectangle_color(0, (((global.viewhview / 6) - 27) + (i * 5)) - stats_y, (120 + lengthdir_x(8, dir + (i * 45))) - stats_x, (((global.viewhview / 6) - 27 - 4) + (i * 5)) - stats_y, c_dkgray, c_black, c_black, c_dkgray, 0);
    i += 1;
}
draw_set_blend_mode(bm_normal);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(fntDate);
draw_set_color(c_black);
draw_text_transformed(20 - stats_x, 52 - stats_y, scoretimer, 1, 1, 0);
draw_text_transformed(20 - stats_x, 54 - stats_y, scoretimer, 1, 1, 0);
draw_text_transformed(21 - stats_x, 53 - stats_y, scoretimer, 1, 1, 0);
draw_text_transformed(19 - stats_x, 51 - stats_y, scoretimer, 1, 1, 0);
draw_text_transformed(19 - stats_x, 53 - stats_y, scoretimer, 1, 1, 0);
draw_text_transformed(18 - stats_x, 52 - stats_y, scoretimer, 1, 1, 0);
draw_set_color(merge_color(c_maroon, c_orange, 0.25 + lengthdir_x(0.25, dir)));
if (global.done == 1 || global.maskindex == 26)
{
    draw_set_color(merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, dir)));
}
draw_text_transformed(20 - stats_x, 53 - stats_y, scoretimer, 1, 1, 0);
draw_set_color(c_white);
draw_text_transformed(19 - stats_x, 52 - stats_y, scoretimer, 1, 1, 0);
draw_set_halign(fa_center);
draw_set_font(fntGrade);
draw_set_color(c_black);
draw_text_transformed(41 - stats_x, 25 - stats_y, grade, 0.5, 0.5, 0);
draw_text_transformed(42 - stats_x, 24 - stats_y, grade, 0.5, 0.5, 0);
draw_text_transformed(40 - stats_x, 22 - stats_y, grade, 0.5, 0.5, 0);
draw_text_transformed(40 - stats_x, 24 - stats_y, grade, 0.5, 0.5, 0);
draw_text_transformed(41 - stats_x, 23 - stats_y, grade, 0.5, 0.5, 0);
draw_text_transformed(39 - stats_x, 23 - stats_y, grade, 0.5, 0.5, 0);
draw_text_transformed_color(41 - stats_x, 24 - stats_y, grade, 0.5, 0.5, 0, colorgradestatswg4, colorgradestatswg4, colorgradestatswg3, colorgradestatswg3, 1);
draw_text_transformed_color(40 - stats_x, 23 - stats_y, grade, 0.5, 0.5, 0, colorgradestatswg2, colorgradestatswg2, colorgradestatswg1, colorgradestatswg1, 1);
yskeleton = 46;
if (global.NotDead == 1)
{
    xskeleton = 7;
}
else
{
    xskeleton = lerp(xskeleton, -16, 0.125);
    skeletonbroken = lerp(skeletonbroken, 1, 0.15);
}
draw_sprite_ext(sprrSkeletonNoDead, 0, xskeleton - stats_x, yskeleton - stats_y - 1, 1, 1, 0, c_black, 1 - skeletonbroken);
draw_sprite_ext(sprrSkeletonNoDead, 0, xskeleton - stats_x, (yskeleton - stats_y) + 1, 1, 1, 0, c_black, 1 - skeletonbroken);
draw_sprite_ext(sprrSkeletonNoDead, 0, (xskeleton - stats_x) + 1, yskeleton - stats_y, 1, 1, 0, c_black, 1 - skeletonbroken);
draw_sprite_ext(sprrSkeletonNoDead, 0, xskeleton - stats_x - 1, yskeleton - stats_y - 2, 1, 1, 0, c_black, 1 - skeletonbroken);
draw_sprite_ext(sprrSkeletonNoDead, 0, xskeleton - stats_x - 1, yskeleton - stats_y, 1, 1, 0, c_black, 1 - skeletonbroken);
draw_sprite_ext(sprrSkeletonNoDead, 0, xskeleton - stats_x - 2, yskeleton - stats_y - 1, 1, 1, 0, c_black, 1 - skeletonbroken);
draw_sprite_ext(sprrSkeletonNoDead, 0, xskeleton - stats_x, yskeleton - stats_y, 1, 1, 0, merge_color(merge_color(c_red, c_purple, 0.15), c_maroon, 0.5 + lengthdir_x(0.5, dir)), 1 - (skeletonbroken / 2));
draw_sprite_ext(sprrSkeletonNoDead, 0, xskeleton - stats_x - 1, yskeleton - stats_y - 1, 1, 1, 0, merge_color(c_white, c_red, skeletonbroken), 1);
