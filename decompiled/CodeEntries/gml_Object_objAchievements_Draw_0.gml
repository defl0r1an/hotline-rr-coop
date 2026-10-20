dir += 0.15;
colormoon2 = 16777215;
colormoon1 = make_colour_rgb(255, 124, 1);
color5 = make_colour_rgb(253, 59, 0);
color4 = make_colour_rgb(227, 109, 41);
color3 = merge_color(make_colour_rgb(204, 132, 108), make_colour_rgb(204, 171, 108), 0.5 + lengthdir_x(0.5, dir * 3));
color2 = merge_color(make_colour_rgb(245, 98, 0), make_colour_rgb(245, 180, 0), 0.5 + lengthdir_x(0.5, dir * 2));
color1 = make_colour_rgb(245, 208, 130);
colorwater1 = merge_color(make_colour_rgb(255, 206, 176), make_colour_rgb(222, 255, 176), 0.5 + lengthdir_x(0.5, dir * 2));
colorwater0 = merge_color(make_colour_rgb(204, 103, 53), make_colour_rgb(65, 161, 151), 0.5 + lengthdir_x(0.5, dir * 2));
color0 = make_colour_rgb(197, 131, 96);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_rectangle_color(view_xview[0], view_yview[0] + 35, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 34, color2, color2, color1, color1, 0);
draw_set_blend_mode(bm_add);
draw_rectangle_color(0, room_height - 79, room_width, room_height, c_black, c_black, color0, color0, 0);
draw_set_alpha(0.4);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 100, 175, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 100, 175, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 118.99999999999999, color5, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 101.5, color5, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 101.5, color5, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 94.5, color4, c_black, 0);
draw_set_alpha(1);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 75, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 82 + random(4), color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 82 + random(4), color4, c_black, 0);
draw_set_blend_mode(bm_normal);
draw_sprite_general(sprBigMoon, image_index, 0, 0, 160, 160, (room_width / 2) - 55.3, (room_height / 2) - 56, 0.7, 0.7, 0, colormoon2, colormoon2, colormoon1, colormoon1, 1);
draw_rectangle_color(0, room_height - 56, room_width, room_height - 90, colorwater1, colorwater1, colorwater0, colorwater0, 0);
draw_set_blend_mode(bm_add);
draw_circle_color(view_wview[0] / 3, view_hview[0] / 4, 200, color5, c_black, 0);
draw_set_blend_mode(bm_add);
draw_set_alpha(0.8);
draw_rectangle_color(0, room_height - 109, room_width, room_height - 90, c_black, c_black, c_dkgray, c_dkgray, 0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
draw_rectangle_color(0, room_height, room_width, room_height - 57, c_black, c_black, c_black, c_black, 0);
draw_rectangle_color(0, room_height - 47, room_width, room_height - 67, color3, color3, c_black, c_black, 0);
global.color = 0;
i = 0;
repeat (6)
{
    draw_sprite_ext(sprScoreClouds, cloudindex[i], cloudx[i], cloudy[i], 0.6, 0.6, 0, merge_colour(c_white, color1, 0.8), 0.7);
    cloudx[i] -= 0.2;
    if (global.revisit == 1)
    {
        if (cloudx[i] >= (room_width + 105))
        {
            cloudx[i] = -105;
            cloudindex[i] = round(random(1));
        }
    }
    else if (cloudx[i] <= -105)
    {
        cloudx[i] = room_width + 105;
        cloudindex[i] = round(random(1));
    }
    i += 1;
}
i = 0;
repeat (6)
{
    draw_sprite_ext(sprPalmTrees, palmindex[i], palmx[i], room_height, 0.9, 0.9, 0, c_black, 1);
    palmx[i] -= 2 - (global.revisit * 16);
    if (global.revisit == 1)
    {
        if (palmx[i] >= (room_width + 105))
        {
            palmx[i] = -105;
            palmindex[i] = floor(random(12));
        }
    }
    else if (palmx[i] <= -105)
    {
        palmx[i] = room_width + 105;
        palmindex[i] = floor(random(12));
    }
    i += 1;
}
draw_set_blend_mode(bm_subtract);
draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), merge_color(make_colour_rgb(0, 43, 156), c_black, 0.9), merge_color(make_colour_rgb(47, 253, 136), make_colour_rgb(189, 194, 40), 0.5 + lengthdir_x(0.5, dir * 2)), 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], view_angle[0]);
i = 0;
ii = 0;
repeat (array_length_1d(global.ach_title))
{
    draw_set_blend_mode(bm_subtract);
    ii = 0;
    repeat (6)
    {
        draw_rectangle_color(0, ((45 + (i * 35)) - scroll) + (ii * 4), view_wview[0], ((42 + (i * 35)) - scroll) + (ii * 4), c_black, c_dkgray, c_dkgray, c_black, 0);
        ii += 1;
    }
    draw_set_blend_mode(bm_normal);
    i += 1;
}
if (surface_exists(global.surf_ach))
{
    draw_surface_ext(global.surf_ach, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf_ach, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf_ach, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf_ach, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf_ach, 0, 0, 1, 1, 0, c_white, 1);
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
    else
    {
        room = rmOptions;
    }
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_blend_mode(bm_subtract);
my_y = random(32);
draw_sprite_tiled(sprScanlines, 0, 0, my_y);
draw_set_blend_mode(bm_normal);
