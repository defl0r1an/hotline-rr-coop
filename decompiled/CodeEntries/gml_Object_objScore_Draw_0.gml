if (visible == true)
{
    color2 = 16777215;
    if (global.hlm2hud == 0)
    {
        if (col == 1)
        {
            color1 = merge_color(c_aqua, c_white, blink);
            color2s = merge_color(c_red, c_aqua, 0.75 + lengthdir_x(0.25, dir * 3));
            color1s = merge_color(merge_color(c_maroon, c_teal, 0.75 + lengthdir_x(0.25, dir * 3)), color2s, blink);
        }
        if (col == 2)
        {
            color1 = merge_color(c_fuchsia, c_white, blink);
            color2s = merge_color(c_red, c_fuchsia, 0.75 + lengthdir_x(0.25, dir * 3));
            color1s = merge_color(merge_color(c_maroon, c_purple, 0.75 + lengthdir_x(0.25, dir * 3)), color2s, blink);
        }
        if (col == 3)
        {
            color1 = merge_color(c_blue, c_white, blink);
            color2s = merge_color(c_aqua, c_blue, 0.75 + lengthdir_x(0.25, dir * 3));
            color1s = merge_color(merge_color(c_aqua, c_purple, 0.75 + lengthdir_x(0.25, dir * 3)), color2s, blink);
        }
    }
    else
    {
        if (col == 1)
        {
            color1 = merge_color(c_aqua, c_white, blink);
        }
        if (col == 2)
        {
            color1 = merge_color(c_fuchsia, c_white, blink);
        }
        if (col == 3)
        {
            color1 = merge_color(c_blue, c_white, blink);
        }
        color2s = merge_color(c_orange, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.71));
        color1s = merge_color(merge_color(c_maroon, c_purple, 0.5 + lengthdir_x(0.5, dir * 2.71)), color2s, blink);
    }
    if (global.maskindex == 26 && global.maskon == 1)
    {
        if (global.hlm2hud == 0)
        {
            color2 = merge_color(c_red, c_white, blink);
            color1 = merge_color(c_maroon, c_white, blink);
            color2s = merge_color(c_red, c_maroon, 0.75 + lengthdir_x(0.25, dir * 3));
            color1s = merge_color(merge_color(c_maroon, c_red, 0.75 + lengthdir_x(0.25, dir * 3)), color2s, blink);
        }
        else
        {
            color2 = merge_color(c_red, c_white, blink);
            color1 = merge_color(c_maroon, c_white, blink);
            color2s = merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, dir * 2.71));
            color1s = merge_color(merge_color(c_maroon, c_red, 0.5 + lengthdir_x(0.5, dir * 2.71)), color2s, blink);
        }
    }
    if (global.interfaceon == 1)
    {
        draw_set_color(c_black);
        draw_set_font(fntPointShow);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        if (col == 1)
        {
            draw_set_color(merge_color(c_black, c_yellow, col2));
        }
        if (col == 2)
        {
            draw_set_color(merge_color(c_black, c_orange, col2));
        }
        if (col == 3)
        {
            draw_set_color(merge_color(c_black, c_aqua, col2));
        }
        if (global.maskindex == 26 && global.maskon == 1)
        {
            draw_set_color(merge_color(c_black, c_white, col2));
        }
        draw_text_transformed((x + lengthdir_x(len, dir * 4)) - 1, y + lengthdir_y(len, dir * 4), text, scale, scale, image_angle);
        draw_text_transformed(x + lengthdir_x(len, dir * 4) + 1, y + lengthdir_y(len, dir * 4), text, scale, scale, image_angle);
        draw_text_transformed(x + lengthdir_x(len, (dir * 4) - 180) + 1, y + lengthdir_y(len, (dir * 4) - 180), text, scale, scale, image_angle);
        draw_text_transformed((x + lengthdir_x(len, (dir * 4) - 180)) - 1, y + lengthdir_y(len, (dir * 4) - 180), text, scale, scale, image_angle);
        draw_text_transformed(x + lengthdir_x(len, dir * 4), (y + lengthdir_y(len, dir * 4)) - 1, text, scale, scale, image_angle);
        draw_text_transformed(x + lengthdir_x(len, dir * 4), y + lengthdir_y(len, dir * 4) + 1, text, scale, scale, image_angle);
        draw_text_transformed(x + lengthdir_x(len, (dir * 4) - 180), y + lengthdir_y(len, (dir * 4) - 180) + 1, text, scale, scale, image_angle);
        draw_text_transformed(x + lengthdir_x(len, (dir * 4) - 180), (y + lengthdir_y(len, (dir * 4) - 180)) - 1, text, scale, scale, image_angle);
        draw_text_transformed_colour(x + lengthdir_x(len, dir * 4), y + lengthdir_y(len, dir * 4), text, scale, scale, image_angle, color2s, color2s, color1s, color1s, 1);
        draw_text_transformed_colour(x + lengthdir_x(len, (dir * 4) - 180), y + lengthdir_y(len, (dir * 4) - 180), text, scale, scale, image_angle, color2, color2, color1, color1, 1);
    }
    if (done == 1)
    {
        switch (timer)
        {
            case 0:
                vspeed = 0;
                timer += 1;
                blink = 1;
                col2 = 1;
                break;
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
                timer += 1;
                break;
            case 24:
                instance_destroy();
                timer += 1;
                break;
        }
        if (len > 0)
        {
            len -= 0.05;
        }
        if (blink > 0)
        {
            blink -= 0.05;
        }
        else
        {
            blink = 0;
        }
        if (col2 > 0)
        {
            col2 -= 0.05;
        }
        else
        {
            col2 = 0;
        }
    }
    if (done == 0)
    {
        if (scale < 0.75)
        {
            scale += 0.015105;
        }
        else
        {
            done = 1;
        }
        if (col2 < 1)
        {
            col2 += 0.05;
        }
    }
    dir += 2;
}
