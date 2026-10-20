dir += 0.15;
if (global.hardmode == 0)
{
    colormoon2 = merge_color(make_colour_rgb(227, 22, 39), make_colour_rgb(222, 118, 63), 0.5 + lengthdir_x(0.5, dir * 2));
    colormoon1 = merge_color(make_colour_rgb(114, 16, 29), make_colour_rgb(203, 35, 52), 0.5 + lengthdir_x(0.5, dir * 2));
    color5 = make_colour_rgb(249, 236, 142);
    color4 = make_colour_rgb(227, 154, 41);
    color3 = merge_color(make_colour_rgb(78, 16, 27), make_colour_rgb(34, 54, 42), 0.5 + lengthdir_x(0.5, dir * 2));
    color2 = merge_color(make_colour_rgb(181, 49, 34), make_colour_rgb(251, 236, 66), 0.5 + lengthdir_x(0.5, dir * 2));
    color1 = merge_color(make_colour_rgb(251, 237, 56), make_colour_rgb(186, 213, 48), 0.5 + lengthdir_x(0.5, dir * 2));
    colorwater1 = merge_color(make_colour_rgb(255, 62, 155), make_colour_rgb(107, 198, 249), 0.5 + lengthdir_x(0.5, dir * 2));
    colorwater0 = merge_color(make_colour_rgb(74, 12, 51), make_colour_rgb(31, 34, 73), 0.5 + lengthdir_x(0.5, dir * 2));
    color0 = make_colour_rgb(197, 131, 96);
}
else
{
    colormoon2 = merge_color(make_colour_rgb(253, 249, 211), make_colour_rgb(255, 255, 148), 0.5 + lengthdir_x(0.5, dir * 2));
    colormoon1 = merge_color(make_colour_rgb(242, 237, 83), make_colour_rgb(188, 254, 128), 0.5 + lengthdir_x(0.5, dir * 2));
    color5 = merge_color(make_colour_rgb(249, 236, 142), c_black, 0.5);
    color4 = merge_color(make_colour_rgb(227, 154, 41), c_black, 0.6);
    color3 = merge_color(make_colour_rgb(52, 34, 91), make_colour_rgb(34, 63, 90), 0.5 + lengthdir_x(0.5, dir * 2));
    color2 = merge_color(make_colour_rgb(30, 33, 74), make_colour_rgb(30, 61, 74), 0.5 + lengthdir_x(0.5, dir * 2));
    color1 = merge_color(color2, c_white, 0.25);
    colorwater1 = merge_color(make_colour_rgb(122, 80, 160), make_colour_rgb(80, 118, 160), 0.5 + lengthdir_x(0.5, dir * 2));
    colorwater0 = merge_color(make_colour_rgb(18, 12, 24), make_colour_rgb(12, 17, 24), 0.5 + lengthdir_x(0.5, dir * 2));
    color0 = merge_color(make_colour_rgb(246, 154, 62), c_black, 0.5);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_rectangle_color(view_xview[0], view_yview[0] + 35, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 34, color2, color2, color1, color1, 0);
draw_set_blend_mode(bm_add);
draw_rectangle_color(0, room_height - 79, room_width, room_height - 122, c_black, c_black, color0, color0, 0);
draw_set_alpha(0.4);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 100, 285, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 100, 285, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 75, color5, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 185, color5, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 95, color4, c_black, 0);
draw_set_alpha(1);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 115, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 50 + random(2), color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 50 + random(2), color4, c_black, 0);
draw_set_blend_mode(bm_normal);
draw_sprite_general(sprBigMoon, image_index, 0, 0, 160, 160, room_width / 2.47, room_height / 3.08, image_xscale / 1.8, image_yscale / 1.8, 0, colormoon2, colormoon2, colormoon1, colormoon1, 1);
draw_rectangle_color(0, room_height - 56, room_width, room_height - 110, colorwater1, colorwater1, colorwater0, colorwater0, 0);
draw_set_blend_mode(bm_add);
draw_set_alpha(0.8);
draw_rectangle_color(0, room_height - 109, room_width, (view_hview[0] / 2) - 38, c_black, c_black, c_dkgray, c_dkgray, 0);
draw_set_alpha(1);
with (objWave)
{
    image_xscale = 1 + (y * 0.02);
    if (y > 0)
    {
        image_yscale = y * 0.004;
    }
    else
    {
        image_yscale = 0;
    }
    if (y < 0)
    {
        colorwave = 0;
        image_blend = c_black;
    }
    else
    {
        colorwave = merge_color(c_black, c_white, y * (1 / ((room_height / 3) + 100)));
        image_blend = merge_color(c_white, c_black, y * (1 / (room_height - 52)));
    }
    draw_set_blend_mode(bm_add);
    draw_rectangle_color(0, (room_height / 2) + 22 + (y * 0.5), room_width, (room_height / 2) + 29 + (y * 0.5 * image_xscale), c_black, c_black, colorwave, colorwave, 0);
    draw_set_blend_mode(bm_normal);
    i = 0;
    repeat (6)
    {
        draw_sprite_ext(sprite_index, index[i], x + (i * (sprite_get_width(sprite_index) * 0.5) * image_xscale), (room_height / 2) + 30 + (y * 0.5 * image_xscale), image_xscale, image_yscale, image_angle, image_blend, 1);
        draw_sprite_ext(sprite_index, index[i], x - (i * (sprite_get_width(sprite_index) * 0.5) * image_xscale), (room_height / 2) + 30 + (y * 0.5 * image_xscale), image_xscale, image_yscale, image_angle, image_blend, 1);
        index[i] += 0.1;
        i += 1;
    }
    if (y < (room_height - 60))
    {
        y += 0.4;
    }
    else
    {
        y = -30;
    }
}
draw_rectangle_color(0, room_height, room_width, room_height - 57, c_black, c_black, c_black, c_black, 0);
draw_rectangle_color(0, room_height - 47, room_width, room_height - 57, color3, color3, c_black, c_black, 0);
if (global.hardmode == 0)
{
    var _inst = -4;
    for (var i_2 = 0; i_2 < instance_number(objScoreClouds); i_2 += 1)
    {
        _inst[i_2] = instance_find(objScoreClouds, i_2);
        draw_sprite_ext(sprScoreClouds, _inst[i_2].image_index, _inst[i_2].x, _inst[i_2].y, 0.5, 0.5, image_angle, merge_color(color5, color4, 0.5), 1 * (point_distance(room_width / 2, room_height * 0.6, _inst[i_2].x, _inst[i_2].y) / 200));
    }
}
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
    draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), c_black, merge_color(make_colour_rgb(0, 114, 156), make_colour_rgb(0, 77, 160), 0.5 + lengthdir_x(0.5, dir * 2)), 0);
}
else
{
    draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), c_black, merge_color(make_colour_rgb(121, 108, 185), make_colour_rgb(171, 0, 255), 0.5 + lengthdir_x(0.5, dir * 2)), 0);
    draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), c_black, c_white, 0);
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
    draw_sprite_ext(sprMasksIcon, currentmask, 556 + (addx * 3.3) + 1, 131, 1, 1, image_angle, c_black, 1);
    draw_sprite_ext(sprMasksIcon, currentmask, 556 + (addx * 3.3), 130, 1, 1, image_angle, color, 1);
}
else if (select == 12)
{
    draw_sprite_ext(sprHospitalIcon, 0, 556 + (addx * 3.3) + 1, 131, 1, 1, 0, c_black, 1);
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
        draw_sprite_ext(sprToken, 0, 556 + (addx * 3.3) + 11 + 1, 131, 1, 1, 0, c_black, 1);
        draw_sprite_ext(sprToken, 0, 556 + (addx * 3.3) + 11, 130, 1, 1, 0, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sprToken, 0, 556 + (addx * 3.3) + 11 + 1, 131, 1, 1, 0, c_black, 1);
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
                sxeasy_play(global.panic);
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
