if (coldir < 180)
{
    coldir += 2;
}
if (coldir < 90)
{
    coldir += 3;
}
if (coldir <= 90)
{
    color = merge_color(c_black, merge_color(c_white, c_purple, abs(lengthdir_y(1, coldir))), abs(lengthdir_y(1, coldir)));
}
if (coldir > 90)
{
    color = merge_color(c_purple, c_aqua, abs(lengthdir_x(1, coldir)));
}
dir += 0.25;
color2 = 0;
color1 = merge_color(c_black, merge_color(merge_color(c_purple, c_aqua, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_red, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.75 + lengthdir_y(0.25, dir * 1.73));
global.color3 = merge_color(merge_color(merge_color(c_blue, c_red, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_yellow, 0.125 + lengthdir_y(0.125, dir * 1.73)), merge_color(c_white, c_purple, 0.5 + lengthdir_x(0.3, dir)), 0.5 + lengthdir_x(0.5, dir * 2.33));
draw_rectangle_color(-20, -20, room_width + 20, room_height + 20, color1, color1, color2, color2, 0);
i = 0;
draw_set_blend_mode(bm_add);
with (objPalmTree)
{
    draw_sprite_general(sprPalmTrees, image_index, 0, 0, 127, 277, (room_width / 2) + amount2, (room_height * 0.7) - ((320 * amount) / 240), amount / 160, amount / 120, 0, global.color3, global.color3, c_black, c_black, 1);
    draw_sprite_general(sprPalmTrees, image_index, 0, 0, 127, 277, (room_width / 2) - amount - ((amount / 240) * 82), (room_height * 0.7) - ((320 * amount) / 240), -amount / 160, amount / 120, 0, global.color3, global.color3, c_black, c_black, 1);
}
draw_set_blend_mode(bm_normal);
if (surface_exists(global.surf1))
{
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 2, 2, 1, 1, 0, c_black, 0.5);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
}
else
{
    draw_set_font(fntScore);
    draw_set_valign(fa_top);
    draw_set_halign(fa_center);
    draw_set_color(c_black);
    draw_text(x - 1, y, "YOUR SYSTEM IS#OUT OF VIDEO MEMORY#PLEASE RESTART THE GAME!");
    draw_text(x + 1, y, "YOUR SYSTEM IS#OUT OF VIDEO MEMORY#PLEASE RESTART THE GAME!");
    draw_text(x, y + 1, "YOUR SYSTEM IS#OUT OF VIDEO MEMORY#PLEASE RESTART THE GAME!");
    draw_text(x, y - 1, "YOUR SYSTEM IS#OUT OF VIDEO MEMORY#PLEASE RESTART THE GAME!");
    draw_set_color(c_white);
    draw_text(x, y, "YOUR SYSTEM IS#OUT OF VIDEO MEMORY#PLEASE RESTART THE GAME!");
}
view_angle[0] = lengthdir_y(3, dir * 3.33);
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
        if (select == 0)
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
    else
    {
        if (select == 0)
        {
            sxeasy_stop();
            sxeasy_setVolume(0);
            global.level = 0;
            sxeasy_play(global.Static);
            room = nextlevel;
        }
        if (select == 1 && level == 1)
        {
            room = rmControls;
        }
        if (select == 2 && level == 0)
        {
            room = rmOptions;
        }
        if (select == 1 && level == 0)
        {
            room = rmLevelSelect;
        }
        if (select == 3 && level == 0)
        {
            game_end();
        }
    }
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_color(c_black);
draw_rectangle(-1, -1, room_width + 1, 15, false);
draw_rectangle(-1, room_height + 1, room_width + 1, room_height - 15, false);
draw_set_color(c_white);
draw_set_font(fntDate);
draw_set_blend_mode(bm_subtract);
my_y = random(32) - 32;
draw_sprite_tiled(sprScanlines, 0, my_y, my_y);
draw_set_blend_mode(bm_subtract);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 240 + random(24) + 25, c_black, merge_color(c_navy, c_aqua, 0.25 + random(0.25)), 0);
draw_set_blend_mode(bm_normal);
i = 0;
