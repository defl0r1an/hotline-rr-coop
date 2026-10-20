d3d_set_projection_ortho(0, 0, global.wview, global.hview, 0);
if (wait > 0)
{
    wait -= 1;
}
if (global.achtext == "Achievement Whore")
{
    if (wait == 0)
    {
        AchievementWhorePlastin = clamp(floor(random(array_length_1d(global.ach_title))) - 1, 1, array_length_1d(global.ach_title) - 1);
        if (AchievementWhorePlastin == AchievementWhorePlastinlast)
        {
            AchievementWhorePlastin = clamp(floor(random(array_length_1d(global.ach_title))) - 1, 1, array_length_1d(global.ach_title) - 1);
        }
        AchievementWhorePlastinlast = AchievementWhorePlastin;
        global.ach_disk_hud = global.ach_disk[AchievementWhorePlastin];
        global.ach_grade_hud = global.ach_grade[AchievementWhorePlastin];
        AWx = random_range(-5, 5);
        wait = 30;
    }
}
AWx = lerp(AWx, 0, 0.25);
dirvin -= 1;
dirvinimpact = lerp(dirvinimpact, dirvinimpactswitch, 0.05);
alpha = lerp(alpha, 1, 0.05);
if (dirvinimpact <= 0.25)
{
    ranky = lerp(ranky, 15, 0.15);
    rankshadow = lerp(rankshadow, 1, 0.15);
}
if (global.maskindex == 26 && global.maskon == 1)
{
    if (global.hlm2hud == 0)
    {
        color = merge_color(merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, abs(dirvin) * 2.32)), c_white, 0.5 + lengthdir_x(0.5, abs(dirvin) * 3));
    }
    else
    {
        color = merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, abs(dirvin) * 3.21));
    }
    achtextcolor0 = 128;
    achtextcolor1 = 255;
    achtextdescrcolor0 = 8421504;
    achtextdescrcolor1 = 16777215;
    colorframework = make_color_hsv((current_time / 12) % 255, 0, 255);
}
else
{
    if (global.hlm2hud == 0)
    {
        color = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, abs(dirvin) * 2.32)), c_white, 0.5 + lengthdir_x(0.5, abs(dirvin) * 3));
    }
    else
    {
        color = merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, abs(dirvin) * 3.21));
    }
    achtextcolor0 = 16711935;
    achtextcolor1 = 16776960;
    achtextdescrcolor0 = 8388736;
    achtextdescrcolor1 = merge_color(c_white, c_yellow, 0.5);
    colorframework = merge_color(make_colour_rgb(122, 150, 215), make_color_hsv((current_time / 12) % 255, 255, 255), 0.15);
}
myy = 230;
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(color);
draw_rectangle(achline - 1.5, myy - 10, global.wview + 6.5, 300, false);
draw_set_colour(c_black);
draw_rectangle(achline, myy - 10, global.wview + 6.5, 300, false);
if (!ds_list_empty(global.achqueue) && global.getachievement)
{
    if (alphaswitch == 0)
    {
        alpha = 0;
        alphaswitch = 1;
    }
    dirvinimpactswitch = 0;
    if (achline > (global.wview - 135))
    {
        achline -= 6.5;
    }
    if (alarm_get(0) == -1)
    {
        if (ds_list_find_value(global.achqueue, 0) == 0)
        {
            alarm[0] = 380;
        }
        else
        {
            alarm[0] = 210;
        }
    }
    format = 0;
}
else if (achline < (global.wview + 6.5))
{
    achline += 3.5;
}
else if (!ds_list_empty(global.achqueue))
{
    global.getachievement = 1;
    i = ds_list_find_value(global.achqueue, 0);
    if (i == 0)
    {
        audio_play_sound(sndGetAchievementWhore, 0, false);
    }
    else
    {
        audio_play_sound(sndGetAchievement, 0, false);
    }
    if (i != -1)
    {
        global.achtext = global.ach_title[i];
        global.achtextdescr = global.ach_descr[i];
        global.ach_grade_hud = global.ach_grade[i];
        global.ach_disk_hud = global.ach_disk[i];
        global.ach_rank_hud = global.ach_rank[i];
    }
}
if (achline > (global.wview + 6.5))
{
    dirvinimpact = 180;
    dirvinimpactswitch = 180;
    ranky = 45;
    rankshadow = -1;
    alphaswitch = 0;
}
if (string_length(global.achtextdescr) > 24 && format == 0)
{
    array = string_split(global.achtextdescr, " ");
    achtextdescr1 = "";
    achtextdescr2 = "";
    achtextdescr = "";
    nextline = 0;
    i = 0;
    repeat (array_length_1d(array))
    {
        if (string_length(achtextdescr1 + array[i]) <= 24 && !nextline)
        {
            achtextdescr1 += (array[i] + " ");
        }
        else
        {
            achtextdescr2 += (array[i] + " ");
            nextline = 1;
        }
        i++;
    }
    achtextdescr = achtextdescr1 + "#" + achtextdescr2;
    format = 1;
}
else if (format == 0)
{
    achtextdescr = global.achtextdescr;
    format = 1;
}
draw_set_alpha(0.5 + (alpha / 2));
draw_set_font(fntDate);
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_set_color(achtextcolor0);
draw_text_transformed(achline + 39, myy - 6, global.achtext, 1, 1, 0);
draw_set_color(achtextcolor1);
draw_text_transformed(achline + 38, myy - 7, global.achtext, 1, 1, 0);
draw_set_font(fntKeyDescription);
draw_set_colour(achtextdescrcolor0);
draw_text_transformed(achline + 44, myy + 7, string_upper(achtextdescr), 1, 1, 0);
draw_set_colour(achtextdescrcolor1);
draw_text_transformed(achline + 43, myy + 6, string_upper(achtextdescr), 1, 1, 0);
draw_sprite_ext(sprDiskAchievement, global.ach_disk_hud, (achline + 20) - AWx, myy + 8, 1, 1, (dirvin - (dirvinimpact / 2)) + (AWx * 2), merge_color(c_white, c_black, clamp(abs(AWx / 2), 0, 1)), alpha);
draw_sprite_ext(sprDiskCoverAchievement, global.ach_grade_hud, (achline + 20) - AWx, myy + 8, 1, 1, (lengthdir_x(5, dirvin * 3) + lengthdir_x(dirvinimpact, dirvin * 3)) - (AWx * 2), merge_color(c_white, c_black, clamp(abs(AWx / 2), 0, 1)), alpha);
draw_sprite_ext(sprRankCupMini, global.ach_rank_hud, achline + 31, myy + ranky, 1, 1, 0, merge_color(c_black, c_white, clamp(rankshadow, 0, 1)), alpha);
if (global.ach_rank_hud == 4)
{
    draw_set_blend_mode(bm_add);
    draw_circle_color(achline + 31, myy + ranky, 13, merge_color(colorframework, c_black, 0.65), c_black, 0);
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(sprRankCupMini, 5, achline + 31, myy + ranky, 1, 1, 0, merge_color(c_white, colorframework, 0.35), alpha);
}
shader_reset();
draw_set_alpha(1);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
