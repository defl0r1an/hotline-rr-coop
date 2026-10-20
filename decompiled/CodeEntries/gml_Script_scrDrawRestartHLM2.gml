d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (update == 0)
{
    draw_set_font(restartfont);
}
else
{
    draw_set_font(restartfont);
}
if (instance_exists(objPlayerDead))
{
    if (text_y < 64)
    {
        text_y += 4;
    }
    if (global.language == 1)
    {
        if (global.xbox == 0)
        {
            restartstring = "НАЖМИ " + global.restartkey + " ДЛЯ ПОВТОРА";
        }
        else
        {
            restartstring = "НАЖМИ [START] ДЛЯ ПОВТОРА";
        }
    }
    else if (global.xbox == 0)
    {
        restartstring = "PRESS " + global.restartkey + " TO RESTART";
    }
    else
    {
        restartstring = "PRESS [START] TO RESTART";
    }
    if (global.interfaceon == 1)
    {
        draw_set_color(c_black);
        draw_rectangle(64 + string_width(restartstring) + 8, (global.viewhview + 32) - text_y - 14, 56, ((global.viewhview + 32) - text_y) + 14, false);
        draw_set_font(restartfont);
        draw_set_color(color1);
        if (global.hlm2hud == 0)
        {
            draw_text_transformed(64 + (string_width(restartstring) * 0.5), ((global.viewhview + 31) - text_y) + lengthdir_x(1, coldir * 7), restartstring, 1, 1, lengthdir_x(2, (coldir * 8) - 20));
        }
        else
        {
            draw_text_transformed(64 + (string_width(restartstring) * 0.5), ((global.viewhview + 31) - text_y) + lengthdir_x(1, coldir * 3), restartstring, 1, 1, lengthdir_x(2, (coldir * 4) - 20));
        }
        draw_set_color(color2);
        if (global.hlm2hud == 0)
        {
            draw_text_transformed(64 + (string_width(restartstring) * 0.5), ((global.viewhview + 30) - text_y) + lengthdir_x(1, coldir * 7), restartstring, 1, 1, lengthdir_x(2, coldir * 8));
        }
        else
        {
            draw_text_transformed(64 + (string_width(restartstring) * 0.5), ((global.viewhview + 30) - text_y) + lengthdir_x(1, coldir * 3), restartstring, 1, 1, lengthdir_x(2, coldir * 4));
        }
    }
}
