bgcolor = merge_color(merge_color(c_blue, c_aqua, 0.5 + lengthdir_x(0.5, cdir)), c_black, 0.8);
color = merge_color(c_blue, c_aqua, 0.5 + lengthdir_x(0.5, cdir));
draw_rectangle_color(view_xview[0] - 60, view_yview[0] - 60, view_xview[0] + view_wview[0] + 60, view_yview[0] + view_hview[0] + 60, bgcolor, bgcolor, c_black, c_black, 0);
texture_set_interpolation(true);
draw_set_blend_mode(bm_add);
if (surface_exists(surf1))
{
    draw_surface_ext(surf1, view_xview[0] - 60, view_yview[0] - 60, 3, 3, 0, merge_color(merge_color(color, c_black, (0.95 - random(global.blink * 0.35)) + lengthdir_x(0.05, cdir * 0.5)), c_red, random(global.blink)), 1);
}
texture_set_interpolation(false);
draw_set_blend_mode(bm_normal);
cdir += 1;
if (global.blink > 0)
{
    global.blink -= 0.02;
}
if (global.comboflash > 0)
{
    global.comboflash -= 0.02;
    draw_set_blend_mode(bm_add);
    color1 = merge_color(c_yellow, c_black, 0.6 - random(global.comboflash) - lengthdir_x(0.02, cdir * 0.5));
    color2 = merge_color(c_orange, c_black, 0.6 - random(global.comboflash) - lengthdir_x(0.02, cdir * 0.5));
    draw_set_alpha(random(global.comboflash));
    draw_rectangle_color(view_xview[0] - 60, view_yview[0] - 60, view_xview[0] + view_wview[0] + 60, view_yview[0] + view_hview[0] + 60, color1, color1, color2, color2, 0);
    draw_set_alpha(1);
    draw_set_blend_mode(bm_normal);
}
draw_set_blend_mode(bm_subtract);
draw_rectangle_colour(view_xview[0] - 60, view_yview[0] - 60, view_xview[0] + view_wview[0] + 60, view_yview[0] + view_hview[0] + 60, merge_color(c_black, c_white, clamp(lengthdir_x(global.chargeSkippy, (global.flickerCharge / 2) - 100), 0, 1)), merge_color(c_black, c_white, clamp(lengthdir_x(global.chargeSkippy, (global.flickerCharge / 2) - 200), 0, 1)), merge_color(c_black, c_white, clamp(lengthdir_x(global.chargeSkippy, (global.flickerCharge / 2) - 300), 0, 1)), merge_color(c_black, c_white, clamp(lengthdir_x(global.chargeSkippy, (global.flickerCharge / 2) - 400), 0, 1)), 0);
draw_set_blend_mode(bm_normal);
