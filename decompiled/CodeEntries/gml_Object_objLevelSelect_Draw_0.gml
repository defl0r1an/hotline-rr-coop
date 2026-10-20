dir += 0.15;
if (global.hardmode == 0)
{
    colormoon2 = 16777215;
    colormoon1 = make_colour_rgb(255, 174, 1);
    color5 = make_colour_rgb(253, 59, 0);
    color4 = make_colour_rgb(227, 154, 41);
    color3 = merge_color(make_colour_rgb(204, 132, 108), make_colour_rgb(204, 171, 108), 0.5 + lengthdir_x(0.5, dir * 2));
    color2 = merge_color(make_colour_rgb(245, 98, 0), make_colour_rgb(245, 180, 0), 0.5 + lengthdir_x(0.5, dir * 2));
    color1 = make_colour_rgb(245, 208, 130);
    colorwater1 = merge_color(make_colour_rgb(255, 206, 176), make_colour_rgb(222, 255, 176), 0.5 + lengthdir_x(0.5, dir * 2));
    colorwater0 = merge_color(make_colour_rgb(176, 65, 106), make_colour_rgb(65, 161, 151), 0.5 + lengthdir_x(0.5, dir * 2));
    color0 = make_colour_rgb(197, 131, 96);
}
else
{
    colormoon2 = merge_color(c_white, c_black, 0.25);
    colormoon1 = merge_color(make_colour_rgb(255, 1, 250), c_black, 0.45);
    color5 = merge_color(make_colour_rgb(253, 59, 0), c_black, 0.25);
    color4 = merge_color(make_colour_rgb(207, 137, 224), c_black, 0.6);
    color3 = merge_color(make_colour_rgb(185, 71, 240), c_black, 0.25);
    color2 = make_colour_rgb(26, 22, 21);
    color1 = make_colour_rgb(44, 53, 118);
    colorwater1 = merge_color(make_colour_rgb(217, 89, 255), c_black, 0.25);
    colorwater0 = make_colour_rgb(28, 52, 84);
    color0 = merge_color(make_colour_rgb(246, 154, 62), c_black, 0.5);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_rectangle_color(view_xview[0], view_yview[0] + 35, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 34, color2, color2, color1, color1, 0);
draw_set_blend_mode(bm_add);
draw_rectangle_color(0, room_height - 79, room_width, room_height - 122, c_black, c_black, color0, color0, 0);
draw_set_alpha(0.4);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 100, 185, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 100, 185, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 105, color5, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 85, color5, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 75, color4, c_black, 0);
draw_set_alpha(1);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 50, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 50 + random(2), color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 50 + random(2), color4, c_black, 0);
draw_set_blend_mode(bm_normal);
draw_sprite_general(sprBigMoon, image_index, 0, 0, 160, 160, room_width / 2.47, room_height / 3.08, image_xscale / 1.8, image_yscale / 1.8, 0, colormoon2, colormoon2, colormoon1, colormoon1, 1);
draw_rectangle_color(0, room_height - 56, room_width, room_height - 110, colorwater1, colorwater1, colorwater0, colorwater0, 0);
draw_set_blend_mode(bm_add);
draw_set_alpha(0.8);
draw_rectangle_color(0, room_height - 109, room_width, (view_hview[0] / 2) - 38, c_black, c_black, c_dkgray, c_dkgray, 0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
draw_rectangle_color(0, room_height, room_width, room_height - 57, c_black, c_black, c_black, c_black, 0);
draw_rectangle_color(0, room_height - 47, room_width, room_height - 57, color3, color3, c_black, c_black, 0);
global.color = 0;
i = 0;
repeat (12)
{
    draw_sprite_ext(sprPalmTrees, palmindex[i], palmx[i], room_height - 33, 0.6, 0.6, 0, c_black, 1);
    palmx[i] -= 3 - (global.revisit * 16);
    if (global.revisit == 1)
    {
        if (palmx[i] >= (room_width + 435))
        {
            palmx[i] = -450;
            palmindex[i] = floor(random(12));
        }
    }
    else if (palmx[i] <= -450)
    {
        palmx[i] = room_width + 435;
        palmindex[i] = floor(random(12));
    }
    i += 1;
}
draw_set_blend_mode(bm_subtract);
if (global.hardmode == 0)
{
    draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), merge_color(make_colour_rgb(0, 43, 156), c_black, 0.9), merge_color(make_colour_rgb(47, 253, 136), make_colour_rgb(189, 194, 40), 0.5 + lengthdir_x(0.5, dir * 2)), 0);
}
else
{
    draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), c_black, merge_color(c_yellow, c_orange, 0.5 + lengthdir_x(0.5, dir * 2)), 0);
    draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), c_black, c_dkgray, 0);
}
draw_set_blend_mode(bm_normal);
if (global.hardmode == 1)
{
    draw_set_color(merge_color(c_white, c_dkgray, random(0.5)));
    draw_set_alpha(0.3);
    draw_rectangle((view_wview[0] / 20) - 7, (view_hview[0] / 3) + 10, ((view_wview[0] / 20) - 7) + 0.2, (view_hview[0] / 3) + 10 + 0.2, false);
    draw_rectangle(view_wview[0] / 17, (view_hview[0] / 6) + 4, (view_wview[0] / 17) + 0.2, (view_hview[0] / 6) + 4 + 0.2, false);
    draw_rectangle((view_wview[0] / 17) + 5, view_hview[0] / 2, (view_wview[0] / 17) + 5 + 0.2, (view_hview[0] / 2) + 0.2, false);
    draw_rectangle((view_wview[0] / 17) + 24, (view_hview[0] / 2) - 18, (view_wview[0] / 17) + 24 + 0.2, ((view_hview[0] / 2) - 18) + 0.2, false);
    draw_rectangle((view_wview[0] / 8) + 9, (view_hview[0] / 6) + 1, (view_wview[0] / 8) + 9 + 0.2, (view_hview[0] / 6) + 1 + 0.2, false);
    draw_rectangle((view_wview[0] / 8) + 20, (view_hview[0] / 4) + 7, (view_wview[0] / 8) + 20 + 0.2, (view_hview[0] / 4) + 7 + 0.2, false);
    draw_rectangle((view_wview[0] / 6) + 11, (view_hview[0] / 2) - 6, (view_wview[0] / 6) + 11 + 0.2, ((view_hview[0] / 2) - 6) + 0.2, false);
    draw_rectangle((view_wview[0] / 4) + 5, (view_hview[0] / 3) + 9, (view_wview[0] / 4) + 5 + 0.2, (view_hview[0] / 3) + 9 + 0.2, false);
    draw_rectangle((view_wview[0] / 3) - 6, (view_hview[0] / 2) - 7, ((view_wview[0] / 3) - 6) + 0.2, ((view_hview[0] / 2) - 7) + 0.2, false);
    draw_rectangle((view_wview[0] / 3) + 6, (view_hview[0] / 6) + 5, (view_wview[0] / 3) + 6 + 0.2, (view_hview[0] / 6) + 5 + 0.2, false);
    draw_rectangle((view_wview[0] / 1.5) - 2, (view_hview[0] / 2) - 1, ((view_wview[0] / 1.5) - 2) + 0.2, ((view_hview[0] / 2) - 1) + 0.2, false);
    draw_rectangle((view_wview[0] / 1.5) + 2, (view_hview[0] / 6) + 7, (view_wview[0] / 1.5) + 2 + 0.2, (view_hview[0] / 6) + 7 + 0.2, false);
    draw_rectangle((view_wview[0] / 1.45) + 4, (view_hview[0] / 3) + 18, (view_wview[0] / 1.45) + 4 + 0.2, (view_hview[0] / 3) + 18 + 0.2, false);
    draw_rectangle((view_wview[0] / 1.4) + 7, (view_hview[0] / 4) + 3, (view_wview[0] / 1.4) + 7 + 0.2, (view_hview[0] / 4) + 3 + 0.2, false);
    draw_rectangle((view_wview[0] / 1.3) + 15, (view_hview[0] / 3) + 3, (view_wview[0] / 1.3) + 15 + 0.2, (view_hview[0] / 3) + 3 + 0.2, false);
    draw_rectangle((view_wview[0] / 1.25) + 14, (view_hview[0] / 2) - 10, (view_wview[0] / 1.25) + 14 + 0.2, ((view_hview[0] / 2) - 10) + 0.2, false);
    draw_rectangle((view_wview[0] / 1.2) + 9, (view_hview[0] / 4) - 1, (view_wview[0] / 1.2) + 9 + 0.2, ((view_hview[0] / 4) - 1) + 0.2, false);
    draw_rectangle((view_wview[0] / 1.1) + 9, (view_hview[0] / 6) + 2, (view_wview[0] / 1.1) + 9 + 0.2, (view_hview[0] / 6) + 2 + 0.2, false);
    draw_rectangle((view_wview[0] / 1.1) + 18, (view_hview[0] / 2) - 6, (view_wview[0] / 1.1) + 18 + 0.2, ((view_hview[0] / 2) - 6) + 0.2, false);
    draw_rectangle((view_wview[0] / 1.05) + 5, (view_hview[0] / 3) + 10, (view_wview[0] / 1.05) + 5 + 0.2, (view_hview[0] / 3) + 10 + 0.2, false);
}
draw_set_alpha(1);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], view_angle[0]);
i = 0;
repeat (6)
{
    draw_set_blend_mode(bm_subtract);
    draw_rectangle_color(0, (view_hview[0] / 5) + 7 + (i * 4), view_wview[0], ((view_hview[0] / 5) + 7 + (i * 4)) - 3, c_black, c_dkgray, c_dkgray, c_black, 0);
    i += 1;
    draw_set_blend_mode(bm_normal);
}
i = 0;
repeat (8)
{
    draw_set_blend_mode(bm_subtract);
    draw_rectangle_color(0, (view_hview[0] / 2) + 46 + (i * 4), view_wview[0], ((view_hview[0] / 2) + 46 + (i * 4)) - 3, c_black, c_dkgray, c_dkgray, c_black, 0);
    i += 1;
    draw_set_blend_mode(bm_normal);
}
if (surface_exists(global.surf1))
{
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
}
currentmask = scrLevelGetMask(select);
if (currentmask >= 0)
{
    if (global.masks[currentmask] == 0)
    {
        color = 0;
    }
    else
    {
        color = 16777215;
    }
    draw_sprite_ext(sprMasksIcon, currentmask, 556 + (addx * 3.3), 130, 1, 1, image_angle, color, 1);
}
else if (select == 12)
{
    draw_sprite_ext(sprHospitalIcon, 0, 556 + (addx * 3.3), 130, 1, 1, 0, c_white, 1);
}
else
{
    draw_sprite_ext(sprMasksIconNoMask, 0, 556 + (addx * 3.3), 130, 1, 1, 0, c_white, 1);
}
if (select <= 15)
{
    if (global.letter[scrLevelGetPuzzle(select)] == 1)
    {
        draw_sprite_ext(sprToken, 0, 556 + (addx * 3.3) + 11, 130, 1, 1, 0, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sprToken, 0, 556 + (addx * 3.3) + 11, 130, 1, 1, 0, c_black, 1);
    }
}
if (alpha == 0)
{
    if (c_amount1 < 180)
    {
        c_amount1 += 10;
        color3 = merge_color(c_black, merge_color(c_navy, c_aqua, 0.25 + random(0.25)), 0.5 + lengthdir_x(0.5, c_amount1));
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount1)), 0.5 + lengthdir_x(0.5, c_amount1));
        if (c_amount1 > 90)
        {
            color2 = merge_color(c_black, merge_color(c_purple, c_white, abs(lengthdir_y(1, c_amount1))), abs(lengthdir_y(1, c_amount1)));
        }
        else
        {
            color2 = 16777215;
        }
        draw_set_blend_mode(bm_add);
        draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + view_wview[0] + 10, view_yview[0] + view_hview[0] + 10, color2, color2, color1, color1, 0);
        draw_set_blend_mode(bm_subtract);
        draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 268 + random(24), c_black, color3, 0);
        draw_set_blend_mode(bm_normal);
    }
}
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 35, false);
draw_rectangle(0, room_height, room_width, room_height - 35, false);
if (fade == 0)
{
    if (c_amount < 180)
    {
        c_amount += 5;
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
        {
            color2 = merge_color(c_black, merge_color(c_purple, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        }
        else
        {
            color2 = 16777215;
        }
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + view_wview[0] + 10, view_yview[0] + view_hview[0] + 10, color1, color2, color2, color1, 0);
        draw_set_blend_mode(bm_normal);
    }
}
if (fade == 1)
{
    if (c_amount > 0)
    {
        c_amount -= 5;
        if (restart == 0)
        {
            sxeasy_setVolume(c_amount * 0.005555555555555556);
        }
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
        {
            color2 = merge_color(c_black, merge_color(c_purple, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        }
        else
        {
            color2 = 16777215;
        }
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + view_wview[0] + 10, view_yview[0] + view_hview[0] + 10, color2, color1, color1, color2, 0);
        draw_set_blend_mode(bm_normal);
    }
    else if (restart == 0)
    {
        sxeasy_stop();
        sxeasy_setVolume(1);
        if (newsong == 1)
        {
            if (global.strah == 1)
            {
                sxeasy_play(working_directory + global.panic);
            }
            else
            {
                sxeasy_play(song);
            }
        }
        if (global.level == 14)
        {
            room_goto(rmHospitalTitle);
        }
        else if (intro == 1)
        {
            room_goto(mylevel);
        }
        else if (select <= 15 || select >= 20)
        {
            room_goto(rmChapter);
        }
        else
        {
            room_goto(rmMCChapter);
        }
    }
    else
    {
        room = rmMenu;
    }
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_blend_mode(bm_subtract);
my_y = random(32);
draw_sprite_tiled(sprScanlines, 0, 0, my_y);
draw_set_blend_mode(bm_normal);
