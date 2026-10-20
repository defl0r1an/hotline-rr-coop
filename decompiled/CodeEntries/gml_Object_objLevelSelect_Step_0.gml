if (global.xbox == 1)
{
    if (checkbutton(0, getid(5)))
    {
        if (presstart == 0)
        {
            presstart = 1;
            scrXboxLevelSelectStart();
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
            scrXboxLevelSelectBack();
        }
    }
    else
    {
        pressback = 0;
    }
    if (leftthumb_x(0) > 15000)
    {
        if (pressright == 0)
        {
            pressright = 1;
            scrXboxLevelSelectRight();
        }
    }
    else
    {
        pressright = 0;
    }
    if (leftthumb_x(0) < -15000)
    {
        if (pressleft == 0)
        {
            pressleft = 1;
            scrXboxLevelSelectLeft();
        }
    }
    else
    {
        pressleft = 0;
    }
    if (leftthumb_y(0) > 5000)
    {
        if (pressup == 0)
        {
            pressup = 1;
            scrXboxLevelSelectUp();
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
            scrXboxLevelSelectDown();
        }
    }
    else
    {
        pressdown = 0;
    }
}
if (wait > 0)
{
    wait -= 1;
}
if (keyboard_check_pressed(ord(global.upkey)))
{
    event_perform(ev_keypress, ord("W"));
}
if (keyboard_check_pressed(ord(global.downkey)))
{
    event_perform(ev_keypress, ord("S"));
}
if (keyboard_check_pressed(ord(global.leftkey)))
{
    event_perform(ev_keypress, ord("A"));
}
if (keyboard_check_pressed(ord(global.rightkey)))
{
    event_perform(ev_keypress, ord("D"));
}
if (!surface_exists(global.surf1))
{
    global.surf1 = surface_create(view_wview[0], view_hview[0]);
    surface_set_target(global.surf1);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
i = 0;
if (myrepeats < repeats)
{
    myrepeats += 0.25;
}
if (myrepeats > repeats)
{
    myrepeats -= 0.25;
}
dist = point_distance(x, y, mouse_x, mouse_y) * 0.01;
if (dist > 1)
{
    dist = 1;
}
if (state == 1)
{
    if (addx > -96)
    {
        addx -= 8;
        addy += 0.3125;
    }
}
else if (addx < 0)
{
    addx += 8;
    addy -= 0.3125;
}
repeat (myrepeats)
{
    if (title[select] == "LOCKED")
    {
        draw_sprite_ext(sprCoverLocked, 0, x + (addx * 0.75), (y * 0.6) + 48, image_xscale, image_yscale, image_angle + lengthdir_x(5, dir * 14), c_white, 1);
        i += 1;
    }
    else
    {
        if (state == 1 || addx < 0)
        {
            if (select != 22)
            {
                draw_sprite_ext(levelvinyl[select], 0, (x - 37 - lengthdir_x(0.3125, dir * 28)) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + lengthdir_x(1, dir * 14), c_white, 1);
                if (select != 12)
                {
                    draw_sprite_ext(vinylhighlight[select], 0, (x - 37 - lengthdir_x(0.3125, dir * 28)) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + lengthdir_x(1, dir * 14), c_white, 0.5);
                }
                if (select == 19)
                {
                    draw_sprite_ext(sprVinylBlood, 0, (x - 37 - lengthdir_x(0.3125, dir * 28)) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + lengthdir_x(1, dir * 14), c_white, 1);
                }
            }
        }
        if (select == 22)
        {
            draw_sprite_ext(levelvinyl[select], 0, (x - 39) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + lengthdir_x(1, dir * 14), c_white, 1);
            draw_sprite_ext(vinylhighlight[select], 0, (x - 39) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + lengthdir_x(1, dir * 14), c_white, 0.5);
        }
        draw_sprite_ext(sprite_index, 0, x + (addx * 0.75), (y * 0.6) + 48, image_xscale, image_yscale, image_angle + lengthdir_x(1, dir * 14), c_white, 1);
        i += 1;
    }
}
colorhighscoretext1 = merge_color(c_maroon, merge_color(c_orange, c_yellow, 0.25), 0.25 + lengthdir_x(0.25, dir * 5));
colorhighscoretext2 = merge_color(merge_color(c_orange, c_yellow, 0.25), c_white, 0.25 + lengthdir_x(0.25, dir * 5));
colorhighscorenum1 = merge_color(c_purple, c_fuchsia, 0.25 + lengthdir_x(0.25, dir * 5));
colorhighscorenum2 = merge_color(c_white, c_white, 0.25 + lengthdir_x(0.25, dir * 5));
colorhighscoreunrated1 = merge_color(c_maroon, c_black, 0.35 + lengthdir_x(0.35, dir * 5));
colorhighscoreunrated2 = merge_color(c_red, c_red, 0.35 + lengthdir_x(0.35, dir * 5));
colorgradetext1 = 65280;
colorgrade1 = merge_color(c_maroon, c_red, 0.5 + lengthdir_x(0.5, dir * 16.6));
colorgrade2 = merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, dir * 16.6));
colorgrade3 = merge_color(c_olive, c_yellow, 0.5 + lengthdir_x(0.5, dir * 16.6));
colorgrade4 = merge_color(c_yellow, c_olive, 0.5 + lengthdir_x(0.5, dir * 16.6));
if (addx < 0)
{
    if (global.hardmode == 0)
    {
        if (global.highscore[select] > 0)
        {
            draw_set_font(fntDate);
            draw_set_halign(fa_center);
            draw_set_valign(fa_top);
            draw_set_color(colorhighscoretext1);
            draw_text(580 + (addx * 3.3) + 1, 93, "HIGHSCORE:");
            draw_set_color(colorhighscoretext2);
            draw_text(580 + (addx * 3.3), 92, "HIGHSCORE:");
            draw_set_color(colorhighscorenum1);
            draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(string(global.highscore[select])) * 0.5) + 1, 93, string(global.highscore[select]));
            draw_set_color(colorhighscorenum2);
            draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(string(global.highscore[select])) * 0.5), 92, string(global.highscore[select]));
            draw_set_font(fntGradeMenu);
            draw_set_color(colorgradetext1);
            draw_text(580 + (addx * 3.3) + 16 + 1, 102, "GRADE:    ");
            draw_set_font(fntGradeSmall);
            if (global.grade[select] == 16)
            {
                draw_set_color(colorgrade3);
                draw_text(602 + (addx * 3.3) + 32 + 16 + 1, 89, scrNumberToGrade(global.grade[select]));
                draw_set_color(colorgrade4);
                draw_text(602 + (addx * 3.3) + 32 + 16, 88, scrNumberToGrade(global.grade[select]));
            }
            else
            {
                draw_set_color(colorgrade1);
                draw_text(602 + (addx * 3.3) + 32 + 16 + 1, 89, scrNumberToGrade(global.grade[select]));
                draw_set_color(colorgrade2);
                draw_text(602 + (addx * 3.3) + 32 + 16, 88, scrNumberToGrade(global.grade[select]));
            }
        }
        else
        {
            draw_set_font(fntDate);
            draw_set_halign(fa_center);
            draw_set_valign(fa_top);
            draw_set_color(colorhighscoretext1);
            draw_text(580 + (addx * 3.3) + 1, 93, "HIGHSCORE:");
            draw_set_color(colorhighscoretext2);
            draw_text(580 + (addx * 3.3), 92, "HIGHSCORE:");
            if (select == 12 || select == 15 || select == 18 || select == 19)
            {
                draw_set_color(colorhighscoreunrated1);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5) + 1, 93, unrated);
                draw_set_color(colorhighscoreunrated2);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5), 92, unrated);
            }
            else
            {
                draw_set_color(colorhighscorenum1);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5) + 1, 93, unrated);
                draw_set_color(colorhighscorenum2);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5), 92, unrated);
            }
            draw_set_font(fntGradeMenu);
            draw_set_color(colorgradetext1);
            draw_text(580 + (addx * 3.3) + 16 + 1, 102, "GRADE:    ");
            draw_set_font(fntGradeSmall);
            draw_set_color(colorgrade1);
            draw_text(602 + (addx * 3.3) + 32 + 16 + 1, 89, "-");
            draw_set_color(colorgrade2);
            draw_text(602 + (addx * 3.3) + 32 + 16, 88, "-");
            draw_set_font(fntDate);
            draw_set_halign(fa_center);
            draw_set_valign(fa_top);
            draw_set_color(colorhighscoretext1);
            draw_text(580 + (addx * 3.3) + 1, 93, "HIGHSCORE:");
            draw_set_color(colorhighscoretext2);
            draw_text(580 + (addx * 3.3), 92, "HIGHSCORE:");
            if (select == 12 || select == 15 || select == 18 || select == 19)
            {
                draw_set_color(colorhighscoreunrated1);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5) + 1, 93, unrated);
                draw_set_color(colorhighscoreunrated2);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5), 92, unrated);
            }
            else
            {
                draw_set_color(colorhighscorenum1);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5) + 1, 93, unrated);
                draw_set_color(colorhighscorenum2);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5), 92, unrated);
            }
            draw_set_font(fntGradeMenu);
            draw_set_color(colorgradetext1);
            draw_text(580 + (addx * 3.3) + 16 + 1, 102, "GRADE:    ");
            draw_set_font(fntGradeSmall);
            draw_set_color(colorgrade1);
            draw_text(602 + (addx * 3.3) + 32 + 16 + 1, 89, "-");
            draw_set_color(colorgrade2);
            draw_text(602 + (addx * 3.3) + 32 + 16, 88, "-");
        }
    }
    if (global.hardmode == 1)
    {
        if (global.hardmodehighscore[select] > 0)
        {
            draw_set_font(fntDate);
            draw_set_halign(fa_center);
            draw_set_valign(fa_top);
            draw_set_color(colorhighscoretext1);
            draw_text(580 + (addx * 3.3) + 1, 93, "HIGHSCORE:");
            draw_set_color(colorhighscoretext2);
            draw_text(580 + (addx * 3.3), 92, "HIGHSCORE:");
            draw_set_color(colorhighscorenum1);
            draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(string(global.hardmodehighscore[select])) * 0.5) + 1, 93, string(global.hardmodehighscore[select]));
            draw_set_color(colorhighscorenum2);
            draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(string(global.hardmodehighscore[select])) * 0.5), 92, string(global.hardmodehighscore[select]));
            draw_set_font(fntGradeMenu);
            draw_set_color(colorgradetext1);
            draw_text(580 + (addx * 3.3) + 16 + 1, 102, "GRADE:    ");
            draw_set_font(fntGradeSmall);
            if (global.hardmodegrade[select] == 16)
            {
                draw_set_color(colorgrade3);
                draw_text(602 + (addx * 3.3) + 32 + 16 + 1, 89, scrNumberToGrade(global.hardmodegrade[select]));
                draw_set_color(colorgrade4);
                draw_text(602 + (addx * 3.3) + 32 + 16, 88, scrNumberToGrade(global.hardmodegrade[select]));
            }
            else
            {
                draw_set_color(colorgrade1);
                draw_text(602 + (addx * 3.3) + 32 + 16 + 1, 89, scrNumberToGrade(global.hardmodegrade[select]));
                draw_set_color(colorgrade2);
                draw_text(602 + (addx * 3.3) + 32 + 16, 88, scrNumberToGrade(global.hardmodegrade[select]));
            }
        }
        else
        {
            draw_set_font(fntDate);
            draw_set_halign(fa_center);
            draw_set_valign(fa_top);
            draw_set_color(colorhighscoretext1);
            draw_text(580 + (addx * 3.3) + 1, 93, "HIGHSCORE:");
            draw_set_color(colorhighscoretext2);
            draw_text(580 + (addx * 3.3), 92, "HIGHSCORE:");
            if (select == 12 || select == 15 || select == 18 || select == 19)
            {
                draw_set_color(colorhighscoreunrated1);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5) + 1, 93, unrated);
                draw_set_color(colorhighscoreunrated2);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5), 92, unrated);
            }
            else
            {
                draw_set_color(colorhighscorenum1);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5) + 1, 93, unrated);
                draw_set_color(colorhighscorenum2);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5), 92, unrated);
            }
            draw_set_font(fntGradeMenu);
            draw_set_color(colorgradetext1);
            draw_text(580 + (addx * 3.3) + 16 + 1, 102, "GRADE:    ");
            draw_set_font(fntGradeSmall);
            draw_set_color(colorgrade1);
            draw_text(602 + (addx * 3.3) + 32 + 16 + 1, 89, "-");
            draw_set_color(colorgrade2);
            draw_text(602 + (addx * 3.3) + 32 + 16, 88, "-");
            draw_set_font(fntDate);
            draw_set_halign(fa_center);
            draw_set_valign(fa_top);
            draw_set_color(colorhighscoretext1);
            draw_text(580 + (addx * 3.3) + 1, 93, "HIGHSCORE:");
            draw_set_color(colorhighscoretext2);
            draw_text(580 + (addx * 3.3), 92, "HIGHSCORE:");
            if (select == 12 || select == 15 || select == 18 || select == 19)
            {
                draw_set_color(colorhighscoreunrated1);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5) + 1, 93, unrated);
                draw_set_color(colorhighscoreunrated2);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5), 92, unrated);
            }
            else
            {
                draw_set_color(colorhighscorenum1);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5) + 1, 93, unrated);
                draw_set_color(colorhighscorenum2);
                draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(unrated) * 0.5), 92, unrated);
            }
            draw_set_font(fntGradeMenu);
            draw_set_color(colorgradetext1);
            draw_text(580 + (addx * 3.3) + 16 + 1, 102, "GRADE:    ");
            draw_set_font(fntGradeSmall);
            draw_set_color(colorgrade1);
            draw_text(602 + (addx * 3.3) + 32 + 16 + 1, 89, "-");
            draw_set_color(colorgrade2);
            draw_text(602 + (addx * 3.3) + 32 + 16, 88, "-");
        }
    }
    if (select == 12 || select == 15 || select == 18 || select == 19)
    {
        unrated = "UNRATED";
    }
    else
    {
        unrated = "-";
    }
    draw_set_font(fntDate);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    if (select == 15)
    {
        skipintrotext = "TIME TO:";
        skipintroyes = "FINISH";
        skipintroyes1 = "FINISH/";
        skipintrono = "THIS";
    }
    else
    {
        skipintrotext = "SKIP INTRO?";
        skipintroyes = "YES";
        skipintroyes1 = "YES/";
        skipintrono = "NO";
    }
    if (!(select > 19))
    {
        draw_set_color(colorhighscoretext1);
        draw_text(((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5)) + 1, 141, skipintrotext);
        draw_set_color(colorhighscoretext2);
        draw_text((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5), 140, skipintrotext);
        draw_set_font(fntGradeMenu);
        if (intro == 0)
        {
            draw_set_color(c_fuchsia);
        }
        else
        {
            draw_set_color(c_purple);
        }
        draw_text(((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5)) + 1 + 16, 151, skipintroyes);
        if (intro == 0)
        {
            draw_set_color(c_aqua);
        }
        else
        {
            draw_set_color(c_teal);
        }
        draw_text(((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5)) + 16, 150, skipintroyes);
        draw_set_color(c_purple);
        draw_text(((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5)) + string_width(skipintroyes) + 1 + 16, 151, "/");
        draw_set_color(c_teal);
        draw_text(((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5)) + string_width(skipintroyes) + 16, 150, "/");
        if (intro == 1)
        {
            draw_set_color(c_fuchsia);
        }
        else
        {
            draw_set_color(c_purple);
        }
        draw_text(((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5)) + string_width(skipintroyes1) + 1 + 16, 151, skipintrono);
        if (intro == 1)
        {
            draw_set_color(c_aqua);
        }
        else
        {
            draw_set_color(c_teal);
        }
        draw_text(((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5)) + string_width(skipintroyes1) + 16, 150, skipintrono);
    }
}
if (global.hardmode == 0)
{
    draw_set_font(fntChapterNumber);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(merge_color(c_purple, c_fuchsia, 0.25 + lengthdir_x(0.25, dir * 5)));
    draw_text_transformed((room_width / 2) + 1, ((room_height * 0.28) - 5) + 1, chapter[select], 1, 1, 0);
    draw_set_color(merge_color(merge_color(c_orange, c_yellow, 0.25), c_maroon, 0.25 + lengthdir_x(0.25, dir * 5)));
    draw_text_transformed(room_width / 2, (room_height * 0.28) - 5, chapter[select], 1, 1, 0);
}
else
{
    draw_set_font(fntChapterNumber);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(merge_color(c_green, c_lime, 0.25 + lengthdir_x(0.25, dir * 5)));
    draw_text_transformed((room_width / 2) + 1, ((room_height * 0.28) - 5) + 1, chapter[select], 1, 1, 0);
    draw_set_color(merge_color(c_fuchsia, c_purple, 0.25 + lengthdir_x(0.25, dir * 5)));
    draw_text_transformed(room_width / 2, (room_height * 0.28) - 5, chapter[select], 1, 1, 0);
}
draw_set_font(fntChapterName);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (state == 1)
{
    if (texts < 20)
    {
        texts += 2;
    }
}
else if (texts > 2)
{
    texts -= 2;
}
else
{
    texts = 1;
}
i = 0;
repeat (texts)
{
    if (global.hardmode == 0)
    {
        draw_set_color(merge_color(merge_color(c_purple, make_colour_rgb(111, 102, 171), 0.5 + lengthdir_x(0.5, dir * 7)), merge_color(c_fuchsia, make_colour_rgb(255, 61, 177), 0.5 + lengthdir_x(0.5, dir * 16)), i * 0.047));
    }
    else
    {
        draw_set_color(merge_color(c_teal, c_aqua, i * 0.047));
    }
    draw_text_transformed(room_width / 2, (room_height - (room_height * 0.28)) + (i * 0.1), title[select], 1 + (i * 0.01), 1 + (i * 0.01), 0);
    i += 1;
}
if (!(title[select] == "LOCKED"))
{
    draw_set_font(fntDate);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(colorhighscorenum1);
    draw_text(view_wview[0] / 2, ((view_hview[0] - (view_hview[0] * 0.36 * 0.68)) + 16) - musictexty, band[select] + " - " + songname[select]);
    draw_set_colour(colorhighscorenum2);
    draw_text(view_wview[0] / 2, ((view_hview[0] - (view_hview[0] * 0.36 * 0.68)) + 16) - 1 - musictexty, band[select] + " - " + songname[select]);
}
if (state == 0)
{
    if (musictexty > -24)
    {
        musictexty -= 4;
    }
    else
    {
        musictexty = -24;
    }
}
else if (presstexty == 24)
{
    if (musictexty < 0)
    {
        musictexty += 4;
    }
    else
    {
        musictexty = 0;
    }
}
if (!(title[select] == "LOCKED"))
{
    draw_set_font(fntKeyDescription);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_text_transformed(view_wview[0] / 2, (view_hview[0] * 0.28) - 0.5 - 23, act[select], 1, 1, 0);
    draw_set_color(merge_color(merge_color(c_teal, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3.232)), c_white, 0.045454545454545456));
    draw_text_transformed((view_wview[0] / 2) + 1, ((view_hview[0] * 0.28) - 0.5 - 23) + 1, act[select], 1, 1, 0);
    draw_set_color(merge_color(merge_color(c_white, c_aqua, 0.5 + lengthdir_x(0.5, dir * 3.232)), c_white, 0.045454545454545456));
    draw_text_transformed(view_wview[0] / 2, (view_hview[0] * 0.28) - 0.5 - 23, act[select], 1, 1, 0);
}
scrHardModeText();
draw_set_font(fntScore);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
surface_alpha();
surface_reset_target();
sprite_index = level[select];
