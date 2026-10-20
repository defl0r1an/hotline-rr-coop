if (!surface_exists(global.surf1))
{
    global.surf1 = surface_create(room_width, room_height);
    surface_set_target(global.surf1);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
draw_set_font(fntFont1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(merge_color(c_fuchsia, c_white, 0.5 + lengthdir_x(0.5, pointx * 0.7)));
draw_text_transformed(x + 1, y - 35, global.pretitle, 1, 1, -lengthdir_x(2, dir * 7.8));
draw_set_color(merge_color(c_white, c_fuchsia, 0.5 + lengthdir_x(0.5, pointx * 0.7)));
draw_text_transformed(x, y - 36, global.pretitle, 1, 1, -lengthdir_x(2, dir * 7.8));
draw_set_font(fntFont2);
i = 0;
pointx += 3;
start_x = -string_width(global.title) * 0.5;
draw_set_halign(fa_left);
repeat (string_length(global.title))
{
    str = string_copy(global.title, 1 + i, 1);
    darkcolor2 = merge_color(merge_color(merge_color(c_black, c_maroon, random(1)), merge_color(c_white, c_red, random(1)), 0.25), merge_color(merge_color(c_red, c_orange, random(1)), c_white, 0.5), 0.5 - lengthdir_x(0.5, (start_x * 0.25) - (pointx * 1.5)));
    darkcolor1 = merge_color(merge_color(c_black, c_maroon, random(1)), merge_color(c_red, c_orange, random(1)), 0.5 - lengthdir_x(0.5, (start_x * 0.25) - (pointx * 1.5)));
    darkcolor2back = merge_color(c_black, c_red, 0.2 + lengthdir_y(0.2, dir * 1.4));
    darkcolor1back = merge_color(c_black, c_maroon, 0.2 + lengthdir_y(0.2, dir * 1.4));
    dist = round(15 - (point_distance(pointx, y, x + start_x, y) * 0.1));
    if (dist < 1)
    {
        dist = 1;
        if (amount[i] < 1)
        {
            amount[i] += 0.025;
        }
    }
    else
    {
        amount[i] = 0;
        on[i] = 1;
    }
    tempdir = point_direction(pointx, y + 64, x + start_x, y);
    if (on[i] == 1)
    {
        ii = 0;
        repeat (dist)
        {
            if (dist > 1)
            {
                color2 = 16777215;
                color1 = merge_color(c_orange, c_white, ii * (1/15));
            }
            else
            {
                color2 = merge_color(c_white, darkcolor2, amount[i]);
                color1 = merge_color(merge_color(c_orange, c_maroon, random(1)), darkcolor1, amount[i]);
                draw_text_colour(x + start_x + 2, y + 2, str, darkcolor2back, darkcolor2back, darkcolor1back, darkcolor1back, 1);
            }
            draw_text_colour(x + start_x + lengthdir_x(ii, tempdir), y + lengthdir_y(ii, tempdir), str, color2, color2, color1, color1, 1);
            ii += 1;
        }
    }
    start_x += string_width(str);
    i += 1;
}
surface_reset_target();
