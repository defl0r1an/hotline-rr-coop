if (global.xbox == 1)
{
    fastforward = 0;
    if (checkbutton(0, getid(5)))
    {
        if (presstart == 0)
        {
            presstart = 1;
            scrXboxScoreStatsStart();
        }
        else
        {
            fastforward = 1;
        }
    }
    else
    {
        presstart = 0;
    }
}
else
{
    fastforward = mouse_check_button(mb_left);
}
SteamRunCallbacks();
if (!surface_exists(global.surf1))
{
    global.surf1 = surface_create(room_width, room_height);
    surface_set_target(global.surf1);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
draw_set_font(fntPointShow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
i = 0;
repeat (6)
{
    start_x = 60 + (string_width(type[i]) * 0.5);
    if (i < (current + 1))
    {
        ii = 0;
        repeat (1 + abs(lengthdir_y(15, amount[i])))
        {
            if (global.hardmode == 0)
            {
                color4 = merge_color(merge_color(c_white, c_fuchsia, 0.5 - lengthdir_y(0.5, (dir * 8) + (i * 25))), merge_color(c_aqua, c_teal, 0.25 - lengthdir_y(0.25, (dir * 12) + (i * 25))), 0.5 - lengthdir_x(0.5, ii * 11.25));
                color3 = merge_color(merge_color(c_teal, c_aqua, 0.5 - lengthdir_y(0.5, (dir * 8) + (i * 25))), merge_color(c_aqua, c_teal, 0.25 - lengthdir_y(0.25, (dir * 12) + (i * 25))), 0.5 - lengthdir_x(0.5, ii * 11.25));
                color2 = merge_color(merge_color(c_fuchsia, c_white, 0.5 - lengthdir_y(0.5, (dir * 8) + (i * 25))), merge_color(c_white, c_fuchsia, 0.25 - lengthdir_y(0.25, (dir * 12) + (i * 25))), 0.5 - lengthdir_x(0.5, ii * 11.25));
                color1 = merge_color(merge_color(c_purple, c_fuchsia, 0.5 - lengthdir_y(0.5, (dir * 8) + (i * 25))), merge_color(c_white, c_fuchsia, 0.25 - lengthdir_y(0.25, (dir * 12) + (i * 25))), 0.5 - lengthdir_x(0.5, ii * 11.25));
            }
            else
            {
                color4 = merge_color(merge_color(c_white, c_aqua, 0.5 - lengthdir_y(0.5, (dir * 8) + (i * 25))), merge_color(c_aqua, c_teal, 0.25 - lengthdir_y(0.25, (dir * 12) + (i * 25))), 0.5 - lengthdir_x(0.5, ii * 11.25));
                color3 = merge_color(merge_color(c_purple, c_fuchsia, 0.5 - lengthdir_y(0.5, (dir * 8) + (i * 25))), merge_color(c_aqua, c_teal, 0.25 - lengthdir_y(0.25, (dir * 12) + (i * 25))), 0.5 - lengthdir_x(0.5, ii * 11.25));
                color2 = merge_color(merge_color(c_aqua, c_white, 0.5 - lengthdir_y(0.5, (dir * 8) + (i * 25))), merge_color(c_white, c_aqua, 0.25 - lengthdir_y(0.25, (dir * 12) + (i * 25))), 0.5 - lengthdir_x(0.5, ii * 11.25));
                color1 = merge_color(merge_color(c_teal, c_aqua, 0.5 - lengthdir_y(0.5, (dir * 8) + (i * 25))), merge_color(c_white, c_aqua, 0.25 - lengthdir_y(0.25, (dir * 12) + (i * 25))), 0.5 - lengthdir_x(0.5, ii * 11.25));
            }
            dist = ((64 + (i * 16)) - (room_height / 2)) * 0.25;
            draw_text_transformed_color(start_x, (64 + (i * 16)) - lengthdir_y(dist, 45 - lengthdir_x(45, ii * 11.25)), type[i], 1 + abs(lengthdir_y(0.25, 45 - lengthdir_x(45, ii * 11.25))), 1 + abs(lengthdir_y(1, 45 - lengthdir_x(45, ii * 11.25))), 0, color2, color2, color1, color1, 1);
            ii += 1;
        }
        if (amount[i] < 180)
        {
            amount[i] += 4 + (fastforward * 6);
        }
        else
        {
            if (fastforward)
            {
                drawbonus[i] = bonus[i];
            }
            if (drawbonus[i] < (bonus[i] - 200))
            {
                drawbonus[i] += 100;
            }
            else if (drawbonus[i] < (bonus[i] - 100))
            {
                drawbonus[i] += 10;
            }
            else if (drawbonus[i] < (bonus[i] - 5))
            {
                drawbonus[i] += 5;
            }
            else
            {
                drawbonus[i] = bonus[i];
            }
            draw_set_halign(fa_right);
            draw_text_transformed_color(332, 64 + (i * 16), string(drawbonus[i]), 1, 1, 0, color4, color4, color3, color3, 1);
            draw_text_transformed_color(330, 64 + (i * 16), string(drawbonus[i]), 1, 1, 0, color2, color2, color1, color1, 1);
            draw_set_halign(fa_center);
            if (current == i && drawbonus[i] == bonus[i])
            {
                current += 1;
            }
            i += 1;
            _temp_local_var_1 = 5;
            _temp_local_var_1 = 5;
            _temp_local_var_1 = 5;
            _temp_local_var_1 = 5;
            continue;
        }
        break;
    }
    else
    {
        i += 1;
    }
}
if (drawbonus[5] == bonus[5])
{
    if (factor < 1)
    {
        factor += 0.025;
    }
    draw_set_halign(fa_center);
    draw_set_font(fntChapter);
    i = 0;
    times = lengthdir_x(11, dir * 15);
    if (times < 1)
    {
        times = 1;
    }
    if (global.myscore < real(string_digits(parscore)))
    {
        color1 = 255;
    }
    else
    {
        color1 = 65280;
    }
    repeat (times)
    {
        draw_set_color(merge_color(color1, c_white, 0.5 - lengthdir_x(0.5, i * 16)));
        draw_text_transformed(200, view_hview[0] - 64, string(global.myscore) + parscore, 0.65 + (i * 0.005), 1 + (i * 0.05), lengthdir_x(4, dir * 8));
        i += 1;
    }
}
surface_reset_target();
