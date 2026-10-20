d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
colorfinalpha1 = merge_color(c_black, c_gray, finalpha);
colorfinalpha2 = merge_color(c_black, c_white, finalpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (update == 0)
{
    draw_set_font(fntRestart);
}
else
{
    draw_set_font(fntRestart);
}
if (global.done && !instance_exists(objPlayerDead))
{
    if (finalpha < 1)
    {
        finalpha += 0.05;
    }
    if (finish_y < 96)
    {
        finish_y += 6;
    }
    finishstring = "PRESS ENTER TO PROCEED";
    if (global.interfaceon == 1)
    {
        draw_set_color(c_black);
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(0, 0, view_wview[0], view_hview[0], colorfinalpha1, colorfinalpha1, colorfinalpha2, colorfinalpha2, 0);
        draw_rectangle_color(0, room_width / 2, room_width + 16, view_hview[0], colorfinalpha2, colorfinalpha2, colorfinalpha1, colorfinalpha1, 0);
        draw_set_blend_mode(bm_normal);
        draw_set_color(c_black);
        draw_rectangle(104 + string_width(finishstring) + 8, (view_hview[0] + 32) - finish_y - 14, 96, ((view_hview[0] + 32) - finish_y) + 14, false);
        draw_set_font(fntRestart);
        draw_set_color(color1);
        if (global.hlm2hud == 0)
        {
            draw_text_transformed(104 + (string_width(finishstring) * 0.5), ((view_hview[0] + 31) - finish_y) + lengthdir_x(1, coldir * 7), finishstring, 1, 1, lengthdir_x(2, (coldir * 8) - 20));
        }
        else
        {
            draw_text_transformed(104 + (string_width(finishstring) * 0.5), ((view_hview[0] + 31) - finish_y) + lengthdir_x(1, coldir * 3), finishstring, 1, 1, lengthdir_x(2, (coldir * 4) - 20));
        }
        draw_set_color(color2);
        if (global.hlm2hud == 0)
        {
            draw_text_transformed(104 + (string_width(finishstring) * 0.5), ((view_hview[0] + 30) - finish_y) + lengthdir_x(1, coldir * 7), finishstring, 1, 1, lengthdir_x(2, coldir * 8));
        }
        else
        {
            draw_text_transformed(104 + (string_width(finishstring) * 0.5), ((view_hview[0] + 30) - finish_y) + lengthdir_x(1, coldir * 3), finishstring, 1, 1, lengthdir_x(2, coldir * 4));
        }
    }
}
