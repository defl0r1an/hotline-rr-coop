if (wait > 0)
{
    wait -= 1;
}
if (global.xbox == 1)
{
    if (checkbutton(0, getid(5)))
    {
        if (presstart == 0)
        {
            presstart = 1;
            scrXboxPauseStart();
        }
    }
    else
    {
        presstart = 0;
    }
    if (checkbutton(0, getid(6)))
    {
        if (pressback == 0)
        {
            pressback = 1;
            scrXboxPauseBack();
        }
    }
    else
    {
        pressback = 0;
    }
    if (leftthumb_y(0) > 5000)
    {
        if (pressup == 0)
        {
            pressup = 1;
            scrXboxPauseUp();
        }
    }
    else
    {
        pressup = 0;
    }
    if (leftthumb_y(0) < -5000)
    {
        if (pressdown == 0)
        {
            pressdown = 1;
            scrXboxPauseDown();
        }
    }
    else
    {
        pressdown = 0;
    }
}
if (keyboard_check_pressed(ord(global.upkey)))
{
    event_perform(ev_keypress, ord("W"));
}
if (keyboard_check_pressed(ord(global.downkey)))
{
    event_perform(ev_keypress, ord("S"));
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
text = "PAUSE";
if (on == 1)
{
    if (textdir2 < 180)
    {
        textdir2 += 10;
    }
}
else
{
    textdir2 = blacky * 180;
}
if (on == 1)
{
    factor = 0.5 - lengthdir_x(0.5, textdir2);
}
else if (factor > 0)
{
    factor -= 0.05;
}
else if (on == 2)
{
    if (!instance_exists(objPuzzle))
    {
        instance_create(x, y, objPuzzle);
    }
}
else if (on == 3)
{
    if (!instance_exists(objOptionsPause))
    {
        instance_create(x, y, objOptionsPause);
    }
}
i = 0;
draw_set_font(fntUnlock);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
start_x = (view_wview[0] / 2) - (string_width(text) * 0.5);
repeat (string_length(text) * factor)
{
    letter = string_copy(text, 1 + i, 1);
    ii = 0;
    repeat (5 + lengthdir_x(4, textdir1 + (i * 60)))
    {
        draw_set_color(merge_color(merge_color(c_teal, merge_color(c_aqua, c_lime, random(0.5)), random(0.5)), c_white, ii * 0.1));
        draw_text_transformed(start_x, (room_height * 0.35) - (ii * 0.5) - 16, letter, 1 + (ii * 0.01), 1 + (ii * 0.01), 0);
        ii += 1;
    }
    start_x += string_width(letter);
    i += 1;
}
draw_set_font(fntMenu);
i = 0;
ii = 0;
repeat (5)
{
    if (select == i)
    {
        repeats = 4 + lengthdir_x(2.5, dir * 2);
        colornorm1 = merge_color(merge_color(c_fuchsia, c_red, 0.5), c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2));
        colornorm2 = merge_color(merge_color(c_fuchsia, c_red, 0.5), c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 2));
        if (on == 1)
        {
            if (frac(i * 0.5) > 0)
            {
                addx = 300 * (1 - factor);
            }
            else
            {
                addx = -300 * (1 - factor);
            }
        }
        else if (frac(i * 0.5) > 0)
        {
            addx = -300 * (1 - factor);
        }
        else
        {
            addx = 300 * (1 - factor);
        }
        repeat (repeats)
        {
            draw_set_color(c_purple);
            draw_text(((room_width / 2) - 56 - ii) + 1 + addx, ((((room_height / 2) + (i * 20)) - ii) + 1) - 16, choice[i]);
            draw_text_color(((room_width / 2) - 56 - ii) + addx, ((room_height / 2) + (i * 20)) - ii - 16, choice[i], c_white, c_white, colornorm1, colornorm1, 1);
            draw_text_color(((room_width / 2) - 56 - ii - 1) + addx, ((room_height / 2) + (i * 20)) - ii - 1 - 16, choice[i], c_white, c_white, colornorm2, colornorm2, 1);
            ii += 1;
        }
    }
    else
    {
        if (on == 1)
        {
            if (frac(i * 0.5) > 0)
            {
                addx = 300 * (1 - factor);
            }
            else
            {
                addx = -300 * (1 - factor);
            }
        }
        else if (frac(i * 0.5) > 0)
        {
            addx = -300 * (1 - factor);
        }
        else
        {
            addx = 300 * (1 - factor);
        }
        amount = 0.5 + lengthdir_x(0.5, dir * 2);
        if ((test == 1 && i == 1) || (test1 == 1 && i == 2))
        {
            colorhover1 = merge_color(c_white, c_dkgray, amount);
        }
        else
        {
            colorhover1 = merge_color(c_white, c_aqua, amount);
        }
        draw_text_color(((room_width / 2) - 56) + 1 + addx, ((room_height / 2) + (i * 20) + 1) - 16, choice[i], c_white, c_white, colorhover1, colorhover1, 1);
        amount = 0.5 - lengthdir_x(0.5, dir * 2);
        if ((test == 1 && i == 1) || (test1 == 1 && i == 2))
        {
            colorhover2 = merge_color(c_white, c_dkgray, amount);
        }
        else
        {
            colorhover2 = merge_color(c_white, c_aqua, amount);
        }
        draw_text_color(((room_width / 2) - 56) + addx, ((room_height / 2) + (i * 20)) - 16, choice[i], c_white, c_white, colorhover2, colorhover2, 1);
    }
    i += 1;
}
textdir1 -= 4;
surface_alpha();
surface_reset_target();
