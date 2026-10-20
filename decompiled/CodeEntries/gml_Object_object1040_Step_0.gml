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
if (global.hardmodeavailable == 1)
{
    if (global.hardmode == 0)
    {
        presstext = "Press [Space] for Hard Mode";
    }
    else
    {
        presstext = "Press [Space] for Normal Mode";
    }
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
    }
}
else if (addx < 0)
{
    addx += 8;
}
if (global.hardmode == 0)
{
    repeat (myrepeats)
    {
        if (title[select] == "LOCKED")
        {
            color = merge_color(c_dkgray, c_black, i * (1 / sprite_get_number(sprite_index)));
        }
        else
        {
            color = merge_color(merge_color(c_aqua, c_purple, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_white, i * (1 / sprite_get_number(sprite_index)));
        }
        draw_sprite_ext(levelvinyl[select], 0, x + (addx * 0.75) + 37, (y * 0.6) + 48, image_xscale, image_yscale, disc, c_white, 1);
        draw_sprite_ext(sprVinylHighlight, 0, x + (addx * 0.75) + 37, (y * 0.6) + 48, image_xscale, image_yscale, image_angle, c_white, 0.5);
        if (select == 19)
        {
            draw_sprite_ext(sprVinylBlood, 0, x + (addx * 0.75) + 37, (y * 0.6) + 48, image_xscale, image_yscale, disc, c_white, 1);
        }
        draw_sprite_ext(sprite_index, 0, x + (addx * 0.75), (y * 0.6) + 48, image_xscale, image_yscale, 0, c_white, 1);
        i += 1;
    }
    disc += 2;
}
else
{
    repeat (myrepeats)
    {
        if (title[select] == "LOCKED")
        {
            color = merge_color(c_dkgray, c_black, i * (1 / sprite_get_number(sprite_index)));
        }
        else
        {
            color = merge_color(merge_color(c_lime, c_yellow, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_white, i * (1 / sprite_get_number(sprite_index)));
        }
        draw_sprite_ext(levelvinyl[select], 0, x + (addx * 0.75) + 37, (y * 0.6) + 48, image_xscale, image_yscale, disc, c_white, 1);
        draw_sprite_ext(sprVinylHighlight, 0, x + (addx * 0.75) + 37, (y * 0.6) + 48, image_xscale, image_yscale, image_angle, c_white, 0.5);
        if (select == 19)
        {
            draw_sprite_ext(sprVinylBlood, 0, x + (addx * 0.75) + 37, (y * 0.6) + 48, image_xscale, image_yscale, disc, c_white, 1);
        }
        draw_sprite_ext(sprite_index, 0, x + (addx * 0.75), (y * 0.6) + 48, image_xscale, image_yscale, 0, c_white, 1);
        i += 1;
    }
    disc += 2;
}
if (addx < 0)
{
    if (global.highscore[select] > 0)
    {
        draw_set_font(fntDate);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_set_color(c_yellow);
        draw_text(580 + (addx * 3.3), 92, "HIGHSCORE:");
        draw_set_color(c_white);
        draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width(string(global.highscore[select])) * 0.5), 92, string(global.highscore[select]));
        draw_set_font(fntDate);
        draw_set_color(c_lime);
        draw_text(580 + (addx * 3.3), 106, "GRADE:    ");
        draw_set_font(fntGradeSmall);
        draw_set_color(c_red);
        draw_text(602 + (addx * 3.3), 93, scrNumberToGrade(global.grade[select]));
    }
    else
    {
        draw_set_font(fntDate);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_set_color(c_yellow);
        draw_text(580 + (addx * 3.3), 92, "HIGHSCORE:");
        draw_set_color(c_white);
        draw_text(580 + (addx * 3.3) + (string_width("HIGHSCORE: ") * 0.5) + (string_width("-") * 0.5), 92, "-");
        draw_set_font(fntDate);
        draw_set_color(c_lime);
        draw_text(580 + (addx * 3.3), 106, "GRADE:    ");
        draw_set_font(fntGradeSmall);
        draw_set_color(c_red);
        draw_text(602 + (addx * 3.3), 93, "-");
    }
    draw_set_font(fntDate);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_yellow);
    if (select == 12)
    {
        draw_text((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5), 140, "TIME TO:");
        if (intro == 1)
        {
            draw_set_color(c_white);
        }
        else
        {
            draw_set_color(c_gray);
        }
        draw_text((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5), 150, "WAKE");
        draw_set_color(c_gray);
        draw_text(((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5)) + string_width("WAKE"), 150, "/");
        if (intro == 0)
        {
            draw_set_color(c_white);
        }
        else
        {
            draw_set_color(c_gray);
        }
        draw_text(((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5)) + string_width("WAKE/"), 150, "UP");
    }
    else
    {
        draw_text((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5), 140, "START WITH INTRO:");
        if (intro == 1)
        {
            draw_set_color(c_white);
        }
        else
        {
            draw_set_color(c_gray);
        }
        draw_text((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5), 150, "YES");
        draw_set_color(c_gray);
        draw_text(((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5)) + string_width("YES"), 150, "/");
        if (intro == 0)
        {
            draw_set_color(c_white);
        }
        else
        {
            draw_set_color(c_gray);
        }
        draw_text(((580 + (addx * 3.3)) - (string_width("GRADE:    ") * 0.5)) + string_width("YES/"), 150, "NO");
    }
}
if (global.hardmode == 0)
{
    draw_set_font(fntMenu);
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
    i = 0;
    repeat (texts)
    {
        draw_set_color(merge_color(merge_color(c_lime, c_yellow, 0.5 + lengthdir_x(0.5, dir * 3.232)), c_white, i * 0.045454545454545456));
        draw_text_transformed(room_width / 2, (room_height * 0.28) - (i * 0.5), chapter[select], 1 + (i * 0.01), 1 + (i * 0.01), 0);
        i += 1;
    }
}
else
{
    draw_set_font(fntMenu);
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
    i = 0;
    repeat (texts)
    {
        draw_set_color(merge_color(merge_color(c_maroon, c_red, 0.5 + lengthdir_x(0.5, dir * 3.232)), c_aqua, i * 0.045454545454545456));
        draw_text_transformed(room_width / 2, (room_height * 0.28) - (i * 0.5), chapter[select], 1 + (i * 0.01), 1 + (i * 0.01), 0);
        i += 1;
    }
}
if (global.hardmode == 0)
{
    texts = 7 + lengthdir_x(15, (dir * 15) - 180);
    if (texts < 1)
    {
        texts = 1;
    }
    if (texts > 22)
    {
        texts = 22;
    }
    i = 0;
    repeat (texts)
    {
        draw_set_color(merge_color(merge_color(c_aqua, c_purple, 0.5 + lengthdir_x(0.5, dir * 3.232)), c_white, i * 0.045454545454545456));
        draw_text_transformed(room_width / 2, (room_height - (room_height * 0.28)) + (i * 0.5), title[select], 1 + (i * 0.01), 1 + (i * 0.01), 0);
        i += 1;
    }
}
else
{
    texts = 7 + lengthdir_x(15, (dir * 15) - 180);
    if (texts < 1)
    {
        texts = 1;
    }
    if (texts > 22)
    {
        texts = 22;
    }
    i = 0;
    repeat (texts)
    {
        draw_set_color(merge_color(merge_color(c_yellow, c_red, 0.5 + lengthdir_x(0.5, dir * 3.232)), c_orange, i * 0.045454545454545456));
        draw_text_transformed(room_width / 2, (room_height - (room_height * 0.28)) + (i * 0.5), title[select], 1 + (i * 0.01), 1 + (i * 0.01), 0);
        i += 1;
    }
}
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 44, false);
draw_rectangle_colour(0, 0, room_width, 44, c_black, c_black, c_dkgray, c_dkgray, 0);
draw_rectangle(0, room_height, room_width, room_height - 44, false);
draw_rectangle_colour(0, room_height, room_width, room_height - 44, c_dkgray, c_dkgray, c_black, c_black, 0);
draw_sprite_ext(sprPhoneLine, 0, 0, 47, 1, 2, 90, c_white, 1);
draw_sprite_ext(sprPhoneLine, 0, 0, room_height - 44 - 2, 1, 2, 90, c_white, 1);
draw_set_font(fntScore);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text_transformed(((room_width / 2) - lengthdir_x(0.5, global.dir * 4)) + 2, (room_height * 0.28) - 0.5 - 32 - lengthdir_x(0.5, global.dir * 4) - 5, act[select], 1.01, 1.01, 0);
draw_text_transformed((room_width / 2) - lengthdir_x(0.5, global.dir * 4), ((room_height * 0.28) - 0.5 - 32 - lengthdir_x(0.5, global.dir * 4) - 5) + 2, act[select], 1.01, 1.01, 0);
draw_text_transformed((room_width / 2) - lengthdir_x(0.5, global.dir * 4) - 1, (room_height * 0.28) - 0.5 - 32 - lengthdir_x(0.5, global.dir * 4) - 5, act[select], 1.01, 1.01, 0);
draw_text_transformed((room_width / 2) - lengthdir_x(0.5, global.dir * 4), (room_height * 0.28) - 0.5 - 32 - lengthdir_x(0.5, global.dir * 4) - 5 - 1, act[select], 1.01, 1.01, 0);
draw_set_color(merge_color(merge_color(c_teal, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3.232)), c_white, 0.045454545454545456));
draw_text_transformed(((room_width / 2) - lengthdir_x(0.5, global.dir * 4)) + 1, ((room_height * 0.28) - 0.5 - 32 - lengthdir_x(0.5, global.dir * 4) - 5) + 1, act[select], 1.01, 1.01, 0);
draw_set_color(merge_color(merge_color(c_white, c_aqua, 0.5 + lengthdir_x(0.5, dir * 3.232)), c_white, 0.045454545454545456));
draw_text_transformed((room_width / 2) - lengthdir_x(0.5, global.dir * 4), (room_height * 0.28) - 0.5 - 32 - lengthdir_x(0.5, global.dir * 4) - 5, act[select], 1.01, 1.01, 0);
scrHardModeText();
surface_alpha();
surface_reset_target();
