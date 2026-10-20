dir += 0.25;
if (global.hardmode == 0)
{
    color2 = merge_color(c_black, merge_color(c_aqua, c_purple, 0.5 + lengthdir_x(0.5, dir * 3.12)), 0.5 + lengthdir_x(0.25, dir * 1.13));
    color1 = merge_color(c_black, merge_color(merge_color(c_lime, c_yellow, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_maroon, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.35 + lengthdir_y(0.25, dir * 1.73));
}
else
{
    color2 = merge_color(c_black, merge_color(c_navy, c_red, 0.5 + lengthdir_x(0.5, dir * 3.12)), 0.5 + lengthdir_x(0.25, dir * 1.13));
    color1 = merge_color(c_black, merge_color(merge_color(c_red, c_purple, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_orange, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.35 + lengthdir_y(0.25, dir * 1.73));
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_rectangle_color(view_xview[0], view_yview[0] + 44, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 43, color1, color1, color2, color2, 0);
if (global.hardmode == 0)
{
    global.color3 = merge_color(merge_color(merge_color(c_blue, c_red, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_yellow, 0.125 + lengthdir_y(0.125, dir * 1.73)), merge_color(c_white, c_purple, 0.5 + lengthdir_x(0.3, dir)), 0.5 + lengthdir_x(0.5, dir * 2.33));
}
else
{
    global.color3 = merge_color(merge_color(merge_color(c_teal, c_maroon, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_orange, 0.125 + lengthdir_y(0.125, dir * 1.73)), merge_color(c_white, c_purple, 0.5 + lengthdir_x(0.3, dir)), 0.5 + lengthdir_x(0.5, dir * 2.33));
}
draw_set_blend_mode(bm_add);
if (global.hardmode == 0)
{
    with (objPalmTree)
    {
        draw_sprite_general(sprPalmTrees, image_index, 0, 0, 127, 277, (room_width / 2) + amount, (room_height * 0.5) - (250 * (amount / 240)), amount / 240, amount / 120, 0, global.color3, global.color3, c_black, c_black, 1);
        draw_sprite_general(sprPalmTrees, image_index, 0, 0, 127, 277, (room_width / 2) - amount - ((amount / 240) * 82), (room_height * 0.5) - (250 * (amount / 240)), -amount / 240, amount / 120, 0, global.color3, global.color3, c_black, c_black, 1);
    }
}
else
{
    with (objPalmTree)
    {
        draw_sprite_general(sprPalmTreesBroken, image_index, 0, 0, 82, 256, (room_width / 2) + amount, (room_height * 0.5) - (250 * (amount / 240)), amount / 240, amount / 120, 0, global.color3, global.color3, c_black, c_black, 1);
        draw_sprite_general(sprPalmTreesBroken, image_index, 0, 0, 82, 256, (room_width / 2) - amount - ((amount / 240) * 82), (room_height * 0.5) - (250 * (amount / 240)), -amount / 240, amount / 120, 0, global.color3, global.color3, c_black, c_black, 1);
    }
}
draw_set_blend_mode(bm_normal);
draw_set_blend_mode(bm_normal);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], view_angle[0]);
if (surface_exists(global.surf1))
{
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, merge_color(c_white, merge_color(c_aqua, c_purple, 0.5 + lengthdir_x(0.5, dir * 3)), 0.25 + lengthdir_x(0.25, dir)), 1);
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
    draw_sprite_ext(sprMasksIcon, currentmask, 556 + (addx * 3.3), 125, 1, 1, image_angle, color, 1);
}
else if (select == 12)
{
    draw_sprite_ext(sprHospitalIcon, 0, 556 + (addx * 3.3), 125, 1, 1, 0, c_white, 1);
}
else
{
    draw_sprite_ext(sprMasksIconNoMask, 0, 556 + (addx * 3.3), 125, 1, 1, 0, c_white, 1);
}
if (select <= 15)
{
    if (global.letter[scrLevelGetPuzzle(select)] == 1)
    {
        draw_sprite_ext(sprToken, 0, 556 + (addx * 3.3) + 11, 125, 1, 1, 0, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sprToken, 0, 556 + (addx * 3.3) + 11, 125, 1, 1, 0, c_black, 1);
    }
}
if (fade == 0)
{
    if (c_amount < 180)
    {
        c_amount += 10;
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
            sxeasy_play(song);
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
draw_set_blend_mode(bm_subtract);
if (global.hardmode == 0)
{
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 240 + random(24) + 32, c_black, merge_color(c_navy, c_aqua, 0.25 + random(0.25)), 0);
}
else
{
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 240 + random(24) + 32, c_black, merge_color(c_red, c_maroon, 0.25 + random(0.25)), 0);
}
draw_set_blend_mode(bm_normal);
