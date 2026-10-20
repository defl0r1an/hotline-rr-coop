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
anglevinyl = lengthdir_x(1, dir * 14);
if (state == 1)
{
    if (addx > -96)
    {
        addx -= 8;
        addy += 0.0625;
    }
}
else if (addx < 0)
{
    addx += 8;
    addy -= 0.0625;
}
if (state == 2)
{
    anglevinyl = 0;
    addy = 0;
    if (add2x > -96)
    {
        add2x -= 8;
    }
}
else if (add2x < 0)
{
    add2x += 8;
}
repeat (myrepeats)
{
    if (title[select] == "LOCKED")
    {
        draw_sprite_ext(sprCoverLocked, 0, x + (addx * 0.75) + 1, (y * 0.6) + 48 + 1, image_xscale, image_yscale, image_angle + anglevinyl, c_black, 1);
        draw_sprite_ext(sprCoverLocked, 0, x + (addx * 0.75), (y * 0.6) + 48, image_xscale, image_yscale, image_angle + anglevinyl, c_white, 1);
        i += 1;
    }
    else
    {
        draw_sprite_ext(sprite_index, 0, x + (addx * 0.75) + (add2x * 3.3) + 1, (y * 0.6) + 48 + 1, image_xscale, image_yscale, image_angle + anglevinyl, c_black, 1);
        if (state == 1 || addx < 0)
        {
            if (select != 22)
            {
                draw_sprite_ext(levelvinyl[select], 0, (x - 37 - lengthdir_x(0.3125, dir * 28)) + (addx * 0.36) + 37 + 1, (((y * 0.6) + 48) - lengthdir_x(addy, dir * 14)) + 1, image_xscale, image_yscale, image_angle + anglevinyl, c_black, 1);
                draw_sprite_ext(levelvinyl[select], 0, (x - 37 - lengthdir_x(0.3125, dir * 28)) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + anglevinyl, c_white, 1);
                if (select != 12)
                {
                    draw_sprite_ext(vinylhighlight[select], 0, (x - 37 - lengthdir_x(0.3125, dir * 28)) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + anglevinyl, c_white, 0.5);
                }
                if (select == 19)
                {
                    draw_sprite_ext(sprVinylBlood, 0, (x - 37 - lengthdir_x(0.3125, dir * 28)) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + anglevinyl, c_white, 1);
                }
                draw_sprite_ext(sprite_index, 0, x + (addx * 0.75) + (add2x * 3.3) + 1, (y * 0.6) + 48 + 1, image_xscale, image_yscale, image_angle + anglevinyl, c_black, 1);
            }
        }
        if (state == 2)
        {
            draw_sprite_ext(levelvinyl[select], 0, (x - 37) + (addx * 0.36) + 37 + 1, (((y * 0.6) + 48) - lengthdir_x(addy, dir * 14)) + 1, image_xscale, image_yscale, image_angle + anglevinyl, c_black, 1);
            draw_sprite_ext(levelvinyl[select], 0, (x - 37) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + anglevinyl, c_white, 1);
            if (select != 12)
            {
                draw_sprite_ext(vinylhighlight[select], 0, (x - 37) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + anglevinyl, c_white, 0.5);
            }
            if (select == 19)
            {
                draw_sprite_ext(sprVinylBlood, 0, (x - 37) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + anglevinyl, c_white, 1);
            }
        }
        if (select == 22)
        {
            draw_sprite_ext(levelvinyl[select], 0, (x - 39) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + anglevinyl, c_white, 1);
            draw_sprite_ext(vinylhighlight[select], 0, (x - 39) + (addx * 0.36) + 37, ((y * 0.6) + 48) - lengthdir_x(addy, dir * 14), image_xscale, image_yscale, image_angle + anglevinyl, c_white, 0.5);
            draw_sprite_ext(sprite_index, 0, x + (addx * 0.75) + (add2x * 3.3) + 1, (y * 0.6) + 48 + 1, image_xscale, image_yscale, image_angle + anglevinyl, c_black, 1);
        }
        draw_sprite_ext(sprite_index, 0, x + (addx * 0.75) + (add2x * 3.3), (y * 0.6) + 48, image_xscale, image_yscale, image_angle + anglevinyl, c_white, 1);
        i += 1;
    }
}
colorhighscoretext1 = merge_color(c_maroon, merge_color(c_orange, c_yellow, 0.25), 0.25 + lengthdir_x(0.25, dir * 5));
colorhighscoretext2 = merge_color(merge_color(c_orange, c_yellow, 0.25), c_white, 0.25 + lengthdir_x(0.25, dir * 5));
colorhighscorenum1 = merge_color(c_purple, c_fuchsia, 0.25 + lengthdir_x(0.25, dir * 5));
colorhighscorenum2 = merge_color(c_white, c_white, 0.25 + lengthdir_x(0.25, dir * 5));
colorhighscoreunrated1 = merge_color(c_maroon, c_red, 0.35 + lengthdir_x(0.35, dir * 5));
colorhighscoreunrated2 = merge_color(c_red, c_white, 0.35 + lengthdir_x(0.35, dir * 5));
colorgradetext1 = merge_color(c_green, c_lime, 0.35 + lengthdir_x(0.35, dir * 8.3));
colorgradetext2 = merge_color(c_lime, c_white, 0.35 + lengthdir_x(0.35, dir * 8.3));
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
            draw_text(580 + (addx * 3.3) + 16 + 2, 103, "GRADE:    ");
            draw_set_color(colorgradetext2);
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
            if (select == 12 || select == 15 || select > 17)
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
            draw_text(580 + (addx * 3.3) + 16 + 2, 103, "GRADE:    ");
            draw_set_color(colorgradetext2);
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
            if (select == 12 || select == 15 || select > 17)
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
            draw_text(580 + (addx * 3.3) + 16 + 2, 103, "GRADE:    ");
            draw_set_color(colorgradetext2);
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
            draw_text(580 + (addx * 3.3) + 16 + 2, 103, "GRADE:    ");
            draw_set_color(colorgradetext2);
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
            if (select == 12 || select == 15 || select > 17)
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
            draw_text(580 + (addx * 3.3) + 16 + 2, 103, "GRADE:    ");
            draw_set_color(colorgradetext2);
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
            if (select == 12 || select == 15 || select > 17)
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
            draw_text(580 + (addx * 3.3) + 16 + 2, 103, "GRADE:    ");
            draw_set_color(colorgradetext2);
            draw_text(580 + (addx * 3.3) + 16 + 1, 102, "GRADE:    ");
            draw_set_font(fntGradeSmall);
            draw_set_color(colorgrade1);
            draw_text(602 + (addx * 3.3) + 32 + 16 + 1, 89, "-");
            draw_set_color(colorgrade2);
            draw_text(602 + (addx * 3.3) + 32 + 16, 88, "-");
        }
    }
    if (select == 12 || select == 15 || select > 17)
    {
        unrated = "UNRATED";
    }
    else
    {
        unrated = "-";
    }
}
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
if (global.hardmode == 0)
{
    colorchapter1 = merge_color(make_colour_rgb(1, 254, 183), make_colour_rgb(248, 25, 121), 0.5 + lengthdir_x(0.5, dir * 2));
    colorchapter2 = merge_color(make_colour_rgb(1, 240, 255), make_colour_rgb(248, 25, 46), 0.5 + lengthdir_x(0.5, dir * 2));
    draw_set_color(merge_color(make_colour_rgb(72, 113, 117), make_colour_rgb(117, 72, 113), 0.5 + lengthdir_x(0.5, dir * 2)));
}
else
{
    colorchapter1 = merge_color(make_colour_rgb(46, 254, 82), make_colour_rgb(254, 235, 47), 0.5 + lengthdir_x(0.5, dir * 2));
    colorchapter2 = merge_color(make_colour_rgb(42, 255, 197), make_colour_rgb(196, 255, 47), 0.5 + lengthdir_x(0.5, dir * 2));
    draw_set_color(merge_color(make_colour_rgb(16, 112, 196), make_colour_rgb(64, 140, 27), 0.5 + lengthdir_x(0.5, dir * 2)));
}
draw_set_font(fntChapterNumber);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed((room_width / 2) + (add2x * 4.3) + 1, ((room_height * 0.28) - 5) + 1, chapter[select], 1, 1, 0);
draw_text_transformed_color((room_width / 2) + (add2x * 4.3), (room_height * 0.28) - 5, chapter[select], 1, 1, 0, colorchapter1, colorchapter1, colorchapter2, colorchapter2, 1);
if (add2x < 0)
{
    draw_text_transformed(room_width + 96 + (add2x * 3.35) + 1, ((room_height * 0.28) - 5) + 1, skipintrotext, 1, 1, 0);
    draw_text_transformed_color(room_width + 96 + (add2x * 3.35), (room_height * 0.28) - 5, skipintrotext, 1, 1, 0, colorchapter1, colorchapter1, colorchapter2, colorchapter2, 1);
}
draw_set_font(fntChapterName);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
texts = 7 + lengthdir_x(15, dir * 15);
if (texts < 1)
{
    texts = 1;
}
if (texts > 22)
{
    texts = 22;
}
texts2 = 22;
i = 0;
ii = 0;
if (global.hardmode == 0)
{
    colortitle1 = merge_color(make_colour_rgb(248, 25, 131), make_colour_rgb(1, 255, 178), 0.5 + lengthdir_x(0.5, dir * 2));
    colortitle2 = merge_color(merge_color(make_colour_rgb(248, 25, 46), make_colour_rgb(1, 240, 255), 0.5 + lengthdir_x(0.5, dir * 2)), colortitle1, i * 0.047);
}
else
{
    colortitle1 = merge_color(make_colour_rgb(254, 235, 47), make_colour_rgb(46, 254, 82), 0.5 + lengthdir_x(0.5, dir * 2));
    colortitle2 = merge_color(merge_color(make_colour_rgb(196, 255, 47), make_colour_rgb(42, 255, 197), 0.5 + lengthdir_x(0.5, dir * 2)), colortitle1, i * 0.047);
}
if (global.hardmode == 0)
{
    colortitle1i = merge_color(make_colour_rgb(248, 25, 131), make_colour_rgb(1, 255, 178), 0.5 + lengthdir_x(0.5, dir * 2));
    colortitle2i = merge_color(merge_color(make_colour_rgb(248, 25, 46), make_colour_rgb(1, 240, 255), 0.5 + lengthdir_x(0.5, dir * 2)), colortitle1i, ii * 0.047);
}
else
{
    colortitle1i = merge_color(make_colour_rgb(254, 235, 47), make_colour_rgb(46, 254, 82), 0.5 + lengthdir_x(0.5, dir * 2));
    colortitle2i = merge_color(merge_color(make_colour_rgb(196, 255, 47), make_colour_rgb(42, 255, 197), 0.5 + lengthdir_x(0.5, dir * 2)), colortitle1i, ii * 0.047);
}
colortitle3 = merge_color(colortitle2, c_black, 0.35);
colortitle3i = merge_color(colortitle2i, c_black, 0.35);
repeat (texts)
{
    draw_text_transformed_color(((room_width / 2) + 0.21) - (add2x * 4.3) - (i * 0.21), room_height - (room_height * 0.265) - 0.21 - (i * 0.21), title[select], (1 + (i * 0.01)) - 0.01, (1 + (i * 0.01)) - 0.01, 0, colortitle3, colortitle3, colortitle3, colortitle3, 1);
    draw_text_transformed_color((room_width / 2) - (add2x * 4.3) - (i * 0.21), room_height - (room_height * 0.265) - (i * 0.21), title[select], 1 + (i * 0.01), 1 + (i * 0.01), 0, merge_color(colortitle1, c_white, i * 0.047), merge_color(colortitle1, c_white, i * 0.047), colortitle2, colortitle2, 1);
    i += 1;
}
p = 1;
if (add2x < 0)
{
    repeat (texts2)
    {
        if (intro == 0)
        {
            draw_text_transformed_color(-140.9 - (add2x * 3.5) - (ii * 0.21), room_height - (room_height * 0.265) - 0.21 - (ii * 0.21), skipintroyes, (1 + (ii * 0.01)) - 0.01, (1 + (ii * 0.01)) - 0.01, 0, colortitle3i, colortitle3i, colortitle3i, colortitle3i, 1);
            draw_text_transformed_color(-140.9 - (add2x * 3.5) - (ii * 0.21), room_height - (room_height * 0.265) - 0.21 - (ii * 0.21), skipintroyes, (1 + (ii * 0.01)) - 0.01, (1 + (ii * 0.01)) - 0.01, 0, merge_color(colortitle1i, c_white, ii * 0.047), merge_color(colortitle1i, c_white, ii * 0.047), colortitle2i, colortitle2i, 1);
        }
        else
        {
            draw_text_transformed_color(-140.90640000000002 - (add2x * 3.5), room_height - (room_height * 0.265) - 0.21, skipintroyes, 0.99, 0.99, 0, colortitle3i, colortitle3i, colortitle3i, colortitle3i, 1);
            draw_text_transformed_color(-140.9 - (add2x * 3.5), room_height - (room_height * 0.265) - 0.21, skipintroyes, 0.99, 0.99, 0, colortitle1i, colortitle1i, colortitle2i, colortitle2i, 1);
        }
        draw_text_transformed_color((-140.9 - (add2x * 3.5)) + (string_width(skipintroyes) * 0.5) + 11, room_height - (room_height * 0.265) - 0.21, "/", 0.99, 0.99, 0, colortitle3i, colortitle3i, colortitle3i, colortitle3i, 1);
        draw_text_transformed_color((-140.9 - (add2x * 3.5)) + (string_width(skipintroyes) * 0.5) + 11, room_height - (room_height * 0.265) - 0.21, "/", 0.99, 0.99, 0, colortitle1i, colortitle1i, colortitle2i, colortitle2i, 1);
        if (intro == 1)
        {
            draw_text_transformed_color(((-140.90640000000002 - (add2x * 3.5)) + string_width(skipintroyes1)) - (ii * 0.21), room_height - (room_height * 0.265) - 0.21 - (ii * 0.21), skipintrono, (1 + (ii * 0.01)) - 0.01, (1 + (ii * 0.01)) - 0.01, 0, colortitle3i, colortitle3i, colortitle3i, colortitle3i, 1);
            draw_text_transformed_color(((-140.90640000000002 - (add2x * 3.5)) + string_width(skipintroyes1)) - (ii * 0.21), room_height - (room_height * 0.265) - 0.21 - (ii * 0.21), skipintrono, (1 + (ii * 0.01)) - 0.01, (1 + (ii * 0.01)) - 0.01, 0, merge_color(colortitle1i, c_white, ii * 0.047), merge_color(colortitle1i, c_white, ii * 0.047), colortitle2i, colortitle2i, 1);
        }
        else
        {
            draw_text_transformed_color((-140.9 - (add2x * 3.5)) + string_width(skipintroyes1), room_height - (room_height * 0.265) - 0.21, skipintrono, 0.99, 0.99, 0, colortitle3i, colortitle3i, colortitle3i, colortitle3i, 1);
            draw_text_transformed_color((-140.9 - (add2x * 3.5)) + string_width(skipintroyes1), room_height - (room_height * 0.265) - 0.21, skipintrono, 0.99, 0.99, 0, colortitle1i, colortitle1i, colortitle2i, colortitle2i, 1);
        }
        ii++;
    }
}
if (!(title[select] == "LOCKED"))
{
    draw_set_font(fntDate);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(colorhighscorenum1);
    draw_text((view_wview[0] / 2) + 10, ((view_hview[0] - (view_hview[0] * 0.36 * 0.68)) + 16) - musictexty, band[select] + " - " + songname[select]);
    draw_set_colour(colorhighscorenum2);
    draw_text((view_wview[0] / 2) + 10, ((view_hview[0] - (view_hview[0] * 0.36 * 0.68)) + 16) - 1 - musictexty, band[select] + " - " + songname[select]);
    draw_sprite_ext(sprMusicNote, 0, ((view_wview[0] / 2) + 10) - (string_width(band[select] + " - " + songname[select]) * 0.5) - 20, ((view_hview[0] - (view_hview[0] * 0.36 * 0.68)) + 22) - musictexty, 1, 1, image_angle, c_white, 1);
}
if (state == 0 || state == 2)
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
if (!(title[select] == "LOCKED" || state == 2))
{
    draw_set_font(fntKeyDescription);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_text_transformed(view_wview[0] / 2, (view_hview[0] * 0.28) - 0.5 - 23, act[select], 1, 1, 0);
    draw_set_color(merge_color(merge_color(c_teal, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3.232)), c_white, 0.045));
    draw_text_transformed((view_wview[0] / 2) + 1, ((view_hview[0] * 0.28) - 0.5 - 23) + 1, act[select], 1, 1, 0);
    draw_set_color(merge_color(merge_color(c_white, c_aqua, 0.5 + lengthdir_x(0.5, dir * 3.232)), c_white, 0.045));
    draw_text_transformed(view_wview[0] / 2, (view_hview[0] * 0.28) - 0.5 - 23, act[select], 1, 1, 0);
}
scrHardModeText();
draw_set_font(fntScore);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
surface_alpha();
surface_reset_target();
