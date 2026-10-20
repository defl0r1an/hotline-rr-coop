if (off == 1)
{
    if (textdir3 == 0)
    {
        surface_free(surf2);
        instance_destroy();
        objPause.on = 1;
        objPause.state = 0;
        objPause.textdir1 = 0;
        objPause.textdir2 = 0;
        exit;
    }
}
if (!surface_exists(surf2))
{
    surf2 = surface_create(room_width, room_height);
    surface_set_target(surf2);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
surface_set_target(surf2);
if (off == 0)
{
    if (textdir3 < 180)
    {
        textdir3 += 10;
    }
}
else if (textdir3 > 0)
{
    textdir3 -= 10;
}
if (off == 0)
{
    factor = 0.5 - lengthdir_x(0.5, textdir3);
}
else if (factor > 0)
{
    factor -= 0.05;
}
addx = -300 * (1 - factor);
draw_clear_alpha(c_black, 0);
i = 0;
index = pageoffset * 6;
ii = 0;
iii = 0;
repeat (6)
{
    if (index < array_length_1d(choicetext))
    {
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        draw_set_font(fntMenu);
        if (select == i)
        {
            repeats = 4 + lengthdir_x(2.5, dir * 2);
            colornorm1 = merge_color(merge_color(c_fuchsia, c_red, 0.5), c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2));
            colornorm2 = merge_color(merge_color(c_fuchsia, c_red, 0.5), c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 2));
            repeat (repeats)
            {
                draw_set_color(c_purple);
                draw_text(((room_width / 4) - 66 - ii) + 1 + addx, ((((room_height / 2) + (i * 20)) - ii) + 1) - 16, choicetext[index]);
                draw_text_color(((room_width / 4) - 66 - ii) + addx, ((room_height / 2) + (i * 20)) - ii - 16, choicetext[index], c_white, c_white, colornorm1, colornorm1, 1);
                draw_text_color(((room_width / 4) - 66 - ii - 1) + addx, ((room_height / 2) + (i * 20)) - ii - 1 - 16, choicetext[index], c_white, c_white, colornorm2, colornorm2, 1);
                ii += 1;
            }
            if (choicetext[index] != "Master" && choicetext[index] != "SFX" && choicetext[index] != "Music")
            {
                iii = 0;
                repeat (repeats)
                {
                    draw_set_color(c_purple);
                    draw_text(((room_width - 54 - iii) + 1) - addx, ((((room_height / 2) + (i * 20)) - iii) + 1) - 16, choice[index]);
                    draw_text_color(room_width - 54 - iii - addx, ((room_height / 2) + (i * 20)) - iii - 16, choice[index], c_white, c_white, colornorm1, colornorm1, 1);
                    draw_text_color(room_width - 54 - iii - 1 - addx, ((room_height / 2) + (i * 20)) - iii - 1 - 16, choice[index], c_white, c_white, colornorm2, colornorm2, 1);
                    iii += 1;
                }
            }
            else
            {
                draw_set_font(fntDate);
                draw_set_color(colornorm1);
                draw_line_width(((room_width / 2) + 46) - addx, ((room_height / 2) + (i * 20)) - 16, ((room_width / 2) + 46 + 126) - addx, ((room_height / 2) + (i * 20)) - 16, 8);
                draw_set_color(c_white);
                draw_line_width(((room_width / 2) + 46 + 2) - addx, ((room_height / 2) + (i * 20)) - 16, ((room_width / 2) + 46 + 2 + (choice[index] * 1.22)) - addx, ((room_height / 2) + (i * 20)) - 16, 4);
                draw_set_color(merge_color(colornorm1, c_black, 0.5));
                draw_text((((room_width / 2) + 44 + 1) - addx) + 140, ((room_height / 2) + (i * 20) + 2) - 16, string(choice[index]) + "%");
                draw_set_color(c_white);
                draw_text((((room_width / 2) + 44) - addx) + 140, ((room_height / 2) + (i * 20) + 1) - 16, string(choice[index]) + "%");
            }
        }
        else
        {
            colorhover1 = merge_color(c_white, c_aqua, 0.5 + lengthdir_x(0.5, dir * 2));
            colorhover2 = merge_color(c_white, c_aqua, 0.5 - lengthdir_x(0.5, dir * 2));
            draw_text_color(((room_width / 4) - 66) + 1 + addx, ((room_height / 2) + (i * 20) + 1) - 16, choicetext[index], c_white, c_white, colorhover1, colorhover1, 1);
            draw_text_color(((room_width / 4) - 66) + addx, ((room_height / 2) + (i * 20)) - 16, choicetext[index], c_white, c_white, colorhover2, colorhover2, 1);
            if (choicetext[index] != "Master" && choicetext[index] != "SFX" && choicetext[index] != "Music")
            {
                draw_text_color(((room_width - 54) + 1) - addx, ((room_height / 2) + (i * 20) + 1) - 16, choice[index], c_white, c_white, colorhover1, colorhover1, 1);
                draw_text_color(room_width - 54 - addx, ((room_height / 2) + (i * 20)) - 16, choice[index], c_white, c_white, colorhover2, colorhover2, 1);
            }
            else
            {
                draw_set_font(fntDate);
                draw_set_color(c_aqua);
                draw_line_width(((room_width / 2) + 46) - addx, ((room_height / 2) + (i * 20)) - 16, ((room_width / 2) + 46 + 126) - addx, ((room_height / 2) + (i * 20)) - 16, 8);
                draw_set_color(c_white);
                draw_line_width(((room_width / 2) + 46 + 2) - addx, ((room_height / 2) + (i * 20)) - 16, ((room_width / 2) + 46 + 2 + (choice[index] * 1.22)) - addx, ((room_height / 2) + (i * 20)) - 16, 4);
                draw_set_color(merge_color(c_aqua, c_black, 0.5));
                draw_text((((room_width / 2) + 44 + 1) - addx) + 140, ((room_height / 2) + (i * 20) + 2) - 16, string(choice[index]) + "%");
                draw_set_color(c_white);
                draw_text((((room_width / 2) + 44) - addx) + 140, ((room_height / 2) + (i * 20) + 1) - 16, string(choice[index]) + "%");
            }
        }
    }
    i += 1;
    index += 1;
}
surface_alpha();
surface_reset_target();
