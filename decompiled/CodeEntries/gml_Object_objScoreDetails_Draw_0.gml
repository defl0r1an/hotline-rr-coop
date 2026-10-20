dir2 += 0.25;
if (global.hardmode == 0)
{
    color3 = merge_color(merge_color(c_red, c_orange, 0.25), c_orange, 0.5 + lengthdir_x(0.5, dir2 * 3));
    color2 = make_colour_rgb(15, 0, 0);
    color1 = merge_color(c_orange, merge_color(merge_color(c_red, c_fuchsia, 0.25), c_orange, 0.25), 0.5 + lengthdir_y(0.5, dir2 * 3));
}
else
{
    color3 = merge_color(merge_color(c_fuchsia, c_aqua, 0.25), merge_color(c_blue, c_aqua, 0.5), 0.5 + lengthdir_x(0.5, dir2 * 3));
    color2 = make_colour_rgb(0, 0, 15);
    color1 = merge_color(merge_color(c_blue, c_aqua, 0.5), merge_color(merge_color(c_fuchsia, c_aqua, 0.25), c_blue, 0.25), 0.5 + lengthdir_y(0.5, dir2 * 3));
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_rectangle_color(view_xview[0], view_yview[0] + 40, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 40, color2, color2, color1, color1, 0);
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
draw_set_color(merge_color(color1, color3, 0.5));
draw_set_blend_mode(bm_add);
draw_set_alpha(0.2);
if (global.hardmode == 1)
{
    draw_rectangle_color(view_xview[0], (room_height * 0.6) - 80, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 100, c_black, c_black, c_white, c_white, 0);
}
draw_set_alpha(0.1);
draw_rectangle_color(view_xview[0], (room_height * 0.6) - 50, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 100, c_black, c_black, c_white, c_white, 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
draw_circle(room_width / 2, room_height * 0.6, 63, 0);
if (global.hardmode == 0)
{
    draw_circle_color(room_width / 2, room_height * 0.6, 60, merge_color(c_yellow, c_orange, 0.5 + lengthdir_y(0.5, dir2 * 3)), merge_color(c_orange, merge_color(c_red, c_orange, 0.25), 0.5 + lengthdir_y(0.5, dir2 * 3)), 0);
}
else
{
    draw_circle_color(room_width / 2, room_height * 0.6, 60, c_white, merge_color(merge_color(c_aqua, c_white, 0.5), merge_color(c_fuchsia, c_white, 0.5), 0.5 + lengthdir_y(0.5, dir2 * 3)), 0);
}
global.color = merge_color(color3, color1, 0.5);
if (housex > -144)
{
    housex -= 0.05;
}
else
{
    housex += 144;
}
i = 0;
repeat (11)
{
    draw_sprite_ext(sprHouseSilhouettes, 1, (housex * 0.666) + (i * 48), ((room_height * 0.6) - 2) + 2, 1, -1, 0, merge_color(c_black, global.color, 0.25), 1);
    draw_sprite_ext(sprHouseSilhouettes, 0, (housex * 0.333) + (i * 48), ((room_height * 0.6) - 1) + 2, 1, -1, 0, merge_color(c_black, global.color, 0.5), 1);
    draw_sprite_ext(sprHouseSilhouettes, 0, housex + (i * 48), (room_height * 0.6) + 2, 1, -1, 0, merge_color(c_black, global.color, 0.75), 1);
    draw_sprite_ext(sprHouseSilhouettes, 1, (housex * 0.666) + (i * 48), (room_height * 0.6) - 2, 1, 1, 0, merge_color(c_black, global.color, 0.25), 1);
    draw_sprite_ext(sprHouseSilhouettes, 0, (housex * 0.333) + (i * 48), (room_height * 0.6) - 1, 1, 1, 0, merge_color(c_black, global.color, 0.5), 1);
    draw_sprite_ext(sprHouseSilhouettes, 0, housex + (i * 48), room_height * 0.6, 1, 1, 0, merge_color(c_black, global.color, 0.75), 1);
    i += 1;
}
_inst = -4;
for (i_2 = 0; i_2 < instance_number(objScoreClouds); i_2 += 1)
{
    _inst[i_2] = instance_find(objScoreClouds, i_2);
    draw_sprite_ext(sprScoreClouds, _inst[i_2].image_index, _inst[i_2].x, _inst[i_2].y, 0.5, 0.5, image_angle, merge_color(color1, color3, 0.25), (1 * point_distance(room_width / 2, room_height * 0.6, _inst[i_2].x, _inst[i_2].y)) / 1000);
}
draw_set_alpha(0.7);
draw_rectangle_color(view_xview[0], room_height * 0.6, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 40, color1, color1, color2, color2, 0);
draw_set_alpha(1);
with (objWave)
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, merge_color(global.color, c_white, 0.5 + lengthdir_x(0.5, dir)), image_alpha);
}
draw_set_blend_mode(bm_subtract);
draw_rectangle_color(view_xview[0], room_height * 0.6, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 40, c_black, c_black, c_white, c_white, 0);
draw_set_blend_mode(bm_normal);
draw_rectangle_color(view_xview[0], view_hview[0] - 39, view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], c_black, c_black, c_black, c_black, 0);
draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
if (alpha > 0)
{
    draw_set_alpha(alpha);
    alpha -= 0.1;
    draw_set_color(c_white);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
view_angle[0] = lengthdir_y(2, dir * 2.33);
if (fade == 0)
{
    if (c_amount < 180)
    {
        c_amount += 10;
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
        {
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
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
        if ((global.myscore >= real(string_digits(parscore)) && global.masks[global.currentmask] == 0) || global.newguns > 0 || global.newmasks > 0)
        {
            nothing = 1;
        }
        else
        {
            sxeasy_setVolume(c_amount * 0.005555555555555556);
        }
        c_amount -= 5;
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
        {
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
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
        global.levels[scrGetCurrentLevel()] = 1;
        if ((global.myscore >= real(string_digits(parscore)) && global.masks[global.currentmask] == 0 && scrGradeToNumber(lastgrade) >= 7) || global.newmasks > 0)
        {
            next = 11;
        }
        else if (global.newguns > 0)
        {
            next = 18;
        }
        else
        {
            next = scrGetSequence(global.sequence);
        }
        ds_list_clear(global.bonuslist);
        global.NotSaved = 0;
        if (next == 11 || next == 18)
        {
            nothing = 1;
        }
        else
        {
            sxeasy_stop(1);
            sxeasy_setVolume(0);
            sxeasy_play(song);
            scrResetScore();
            scrSaveUnlocked();
            scrFreeSurfaces();
        }
        room_goto(next);
        scrFreeSurfaces();
    }
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_color(c_black);
draw_set_blend_mode(bm_subtract);
my_y = random(32);
draw_sprite_tiled(sprScanlines, 0, 0, my_y);
draw_set_blend_mode(bm_subtract);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 240 + random(24), c_black, merge_color(c_navy, c_aqua, 0.25 + random(0.25)), 0);
draw_set_blend_mode(bm_normal);
