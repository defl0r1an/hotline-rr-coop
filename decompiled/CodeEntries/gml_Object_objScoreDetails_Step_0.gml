if (global.xbox == 1)
{
    if (checkbutton(0, getid(5)))
    {
        if (presstart == 0)
        {
            presstart = 1;
            scrXboxScoreDetailsStart();
        }
    }
    else
    {
        presstart = 0;
    }
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
draw_set_font(fntLevelQueryDetails);
i = 0;
repeat (7)
{
    if (global.hardmode == 0)
    {
        draw_line_color(0, 12 + (i * 3), 400, 12 + (i * 3), merge_color(c_black, c_maroon, 0.25 + lengthdir_x(0.25, (dir2 * 4) + (i * 35))), merge_color(c_black, c_maroon, 0.25 + lengthdir_x(0.25, (dir2 * 4) + (i * 35)) + 180));
    }
    else
    {
        draw_line_color(0, 12 + (i * 3), 400, 12 + (i * 3), merge_color(c_black, c_purple, 0.25 + lengthdir_x(0.25, (dir2 * 4) + (i * 35))), merge_color(c_black, c_purple, 0.25 + lengthdir_x(0.25, (dir2 * 4) + (i * 35)) + 180));
    }
    i += 1;
}
if (mls < 10)
{
    mls = "00" + string(mls);
}
if (mls < 100)
{
    mls = "0" + string(mls);
}
if (sec < 10)
{
    sec = "0" + string(sec);
}
if (mnt < 10)
{
    mnt = "0" + string(mnt);
}
if (hrs == 0)
{
    scoretimer = string(mnt) + ":" + string(sec) + "." + string(mls);
}
else
{
    scoretimer = string(hrs) + ":" + string(mnt) + ":" + string(sec) + "." + string(mls);
}
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(merge_color(c_gray, c_dkgray, 0.5 + lengthdir_x(0.5, dir2 * 10)));
draw_text(12, 22, 'LEVEL: "' + level + '"' + "#TIME: " + scoretimer);
colorlevel1 = 8421504;
colorlevel2 = merge_color(c_white, c_gray, 0.5 + lengthdir_x(0.5, dir2 * 10));
draw_text_color(11, 22, 'LEVEL: "' + level + '"' + "#TIME: " + scoretimer, colorlevel2, colorlevel2, colorlevel1, colorlevel1, 1);
draw_set_halign(fa_right);
if (global.hardmode == 0)
{
    colorhgscore1 = 65535;
    colorhgscore2 = merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir2 * 10));
}
else
{
    colorhgscore1 = 65280;
    colorhgscore2 = merge_color(c_white, c_lime, 0.5 + lengthdir_x(0.5, dir2 * 10));
}
if (global.hardmode == 0)
{
    draw_set_color(merge_color(c_olive, merge_color(c_navy, c_aqua, 0.25), 0.5 + lengthdir_x(0.5, dir2 * 10)));
}
else
{
    draw_set_color(merge_color(c_green, c_purple, 0.5 + lengthdir_x(0.5, dir2 * 10)));
}
draw_text(387, 22, "HIGHSCORE: " + string(highscore) + "#SCORE: " + string(myscore));
draw_text_color(388, 22, "HIGHSCORE: " + string(highscore) + "#SCORE: " + string(myscore), colorhgscore2, colorhgscore2, colorhgscore1, colorhgscore1, 1);
draw_set_halign(fa_center);
if (global.hardmode == 0)
{
    colorstyle1 = 65280;
    colorstyle2 = merge_color(c_white, c_lime, 0.5 + lengthdir_x(0.5, dir2 * 10));
}
else
{
    colorstyle1 = 65535;
    colorstyle2 = merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir2 * 10));
}
if (gradeon == 1)
{
    if (global.hardmode == 0)
    {
        draw_set_color(merge_color(c_green, c_purple, 0.5 + lengthdir_x(0.5, dir2 * 10)));
    }
    else
    {
        draw_set_color(merge_color(c_olive, merge_color(c_navy, c_aqua, 0.25), 0.5 + lengthdir_x(0.5, dir2 * 10)));
    }
    draw_text(200, 22, 'PLAY STYLE:#"' + type + '"');
    draw_text_color(199, 22, 'PLAY STYLE:#"' + type + '"', colorstyle2, colorstyle2, colorstyle1, colorstyle1, 1);
}
draw_set_font(fntFeats);
if (dir < 180)
{
    dir += 18;
}
else
{
    if (current < ds_list_size(global.bonuslist))
    {
        current += 1;
    }
    dir = 0;
}
draw_y = 220;
i = current - 1;
cdir += 4;
times = current - 1;
if (times > 13)
{
    times = 13;
}
ii = 0;
repeat (times)
{
    if (global.hardmode == 0)
    {
        colorscore3 = merge_color(c_maroon, merge_color(c_maroon, c_black, 0.5), 0.5 + lengthdir_x(0.5, cdir + (i * 20)));
        colorscore4 = merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, cdir + (i * 20)));
        colorscore1 = merge_color(merge_color(c_white, c_teal, 0.5 + lengthdir_x(0.5, cdir + (i * 20))), merge_color(c_teal, c_black, 0.5), 0.5 + lengthdir_x(0.5, cdir + (i * 30)));
        colorscore2 = merge_color(merge_color(c_white, c_aqua, 0.5 + lengthdir_x(0.5, cdir + (i * 20))), c_teal, 0.5 + lengthdir_x(0.5, cdir + (i * 30)));
    }
    else
    {
        colorscore3 = merge_color(c_teal, merge_color(c_teal, c_black, 0.5), 0.5 + lengthdir_x(0.5, cdir + (i * 20)));
        colorscore4 = merge_color(c_aqua, c_teal, 0.5 + lengthdir_x(0.5, cdir + (i * 20)));
        colorscore1 = merge_color(merge_color(c_white, c_purple, 0.5 + lengthdir_x(0.5, cdir + (i * 20))), merge_color(c_purple, c_black, 0.5), 0.5 + lengthdir_x(0.5, cdir + (i * 30)));
        colorscore2 = merge_color(merge_color(c_white, c_fuchsia, 0.5 + lengthdir_x(0.5, cdir + (i * 20))), c_purple, 0.5 + lengthdir_x(0.5, cdir + (i * 30)));
    }
    mystring = ds_list_find_value(global.bonuslist, i);
    draw_text_color((350 - (string_width(mystring) * 0.5)) + lengthdir_x(3, cdir + (i * 40)) + 2, 190 - (ii * 12), mystring, colorscore4, colorscore4, colorscore3, colorscore3, 1);
    draw_text_color((350 - (string_width(mystring) * 0.5)) + lengthdir_x(3, cdir + (i * 40)), 190 - (ii * 12), mystring, colorscore2, colorscore2, colorscore1, colorscore1, 1);
    i -= 1;
    ii += 1;
}
if (current < ds_list_size(global.bonuslist))
{
    times = 1 + abs(lengthdir_y(19, dir));
    mystring = ds_list_find_value(global.bonuslist, current);
    i = 0;
    draw_set_font(fntChapter);
    repeat (times)
    {
        colorbl = merge_color(merge_color(c_olive, c_orange, 0.5 + lengthdir_x(0.5, cdir * 3)), merge_color(c_yellow, c_white, 0.75 + lengthdir_x(0.25, cdir * 2)), (1 * times) / 20);
        draw_text_transformed_color(350 - (string_width(mystring) * 0.325), 210 + (i * 0.1), mystring, 0.65 + (i * 0.005), 1 + (i * 0.025), 0, c_white, c_white, colorbl, colorbl, 1);
        i += 1;
    }
}
else
{
    if (gradex < 280)
    {
        gradex += 10;
    }
    else if (gradeon == 0)
    {
        gradeon = 1;
        if (grade == "A+")
        {
            scrAchievementSet("Aced It");
        }
        scrCheckGrades();
        alpha = 1;
    }
    draw_set_font(fntGrading);
    mystring = "GRADE:";
    if (global.hardmode == 0)
    {
        colorgrade3 = merge_color(merge_color(c_navy, c_black, 0.5), c_teal, 0.5 + lengthdir_x(0.5, cdir * 3));
        colorgrade4 = merge_color(c_navy, c_aqua, 0.5 + lengthdir_x(0.5, cdir * 3));
        colorgrade1 = merge_color(c_yellow, c_white, 0.5 + lengthdir_x(0.5, cdir * 3));
        colorgrade2 = 16777215;
    }
    else
    {
        colorgrade3 = merge_color(merge_color(c_purple, c_black, 0.5), c_purple, 0.5 + lengthdir_x(0.5, cdir * 3));
        colorgrade4 = merge_color(c_purple, c_fuchsia, 0.5 + lengthdir_x(0.5, cdir * 3));
        colorgrade1 = merge_color(c_lime, c_white, 0.5 + lengthdir_x(0.5, cdir * 3));
        colorgrade2 = 16777215;
    }
    draw_text_transformed_color((gradex - (string_width(mystring) * 0.5)) + 4, 220, mystring, 1, 1, 0, colorgrade4, colorgrade4, colorgrade3, colorgrade3, 1);
    draw_set_color(c_black);
    draw_text_transformed((gradex - (string_width(mystring) * 0.5)) + 1, 216, mystring, 1, 1, 0);
    draw_text_transformed_color(gradex - (string_width(mystring) * 0.5), 215, mystring, 1, 1, 0, colorgrade2, colorgrade2, colorgrade1, colorgrade1, 1);
    if (gradeon == 1)
    {
        soundeffect = 1;
        draw_set_font(fntGrade);
        amount = -1 + lengthdir_x(2, cdir);
        if (amount < 0)
        {
            amount = 0;
        }
        draw_set_halign(fa_left);
        draw_set_color(merge_color(c_maroon, c_red, amount));
        draw_text_transformed(293, 213, grade, 0.95 + (amount * 0.05), 0.9 + (amount * 0.1), 0);
        draw_set_color(c_black);
        draw_text_transformed(291, 211, grade, 0.95 + (amount * 0.05), 0.9 + (amount * 0.1), 0);
        draw_set_color(merge_color(c_red, c_white, amount));
        draw_text_transformed(290, 210, grade, 0.95 + (amount * 0.05), 0.9 + (amount * 0.1), 0);
        if (grade == "S")
        {
            draw_set_halign(fa_left);
            draw_set_color(merge_color(c_olive, c_dkgray, amount));
            draw_text_transformed(293, 213, grade, 0.95 + (amount * 0.05), 0.9 + (amount * 0.1), 0);
            draw_set_color(c_black);
            draw_text_transformed(291, 211, grade, 0.95 + (amount * 0.05), 0.9 + (amount * 0.1), 0);
            draw_set_color(merge_color(c_yellow, c_white, amount));
            draw_text_transformed(290, 210, grade, 0.95 + (amount * 0.05), 0.9 + (amount * 0.1), 0);
        }
        if (soundeffect == 1 && alpha == 1)
        {
            audio_play_sound(sndWeaponHit, 0, false);
        }
    }
}
surface_reset_target();
