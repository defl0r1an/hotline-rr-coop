if (coldir < 180)
{
    coldir += 2;
}
if (coldir < 90)
{
    coldir += 3;
}
if (global.holiday != 2)
{
    if (coldir <= 90)
    {
        color = merge_color(c_black, merge_color(c_white, c_purple, abs(lengthdir_y(1, coldir))), abs(lengthdir_y(1, coldir)));
    }
    if (coldir > 90)
    {
        color = merge_color(c_purple, c_aqua, abs(lengthdir_x(1, coldir)));
    }
}
else
{
    if (coldir <= 90)
    {
        color = merge_color(c_black, merge_color(c_white, c_olive, abs(lengthdir_y(1, coldir))), abs(lengthdir_y(1, coldir)));
    }
    if (coldir > 90)
    {
        color = merge_color(c_purple, c_yellow, abs(lengthdir_x(1, coldir)));
    }
}
dir += 3;
color2 = 0;
if (global.holiday != 2)
{
    color1 = merge_color(merge_color(merge_color(c_fuchsia, c_red, 0.5), c_aqua, 0.5 + lengthdir_x(0.5, dir * 0.1)), c_black, 0.5);
    global.color3 = merge_color(c_fuchsia, c_aqua, 0.5 - lengthdir_x(0.5, dir * 0.1));
}
else
{
    color1 = merge_color(merge_color(merge_color(c_olive, c_red, 0.5), c_yellow, 0.5 + lengthdir_x(0.5, dir * 0.1)), c_black, 0.5);
    global.color3 = merge_color(c_olive, c_yellow, 0.5 - lengthdir_x(0.5, dir * 0.1));
}
draw_rectangle_color(-16, -16, room_width + 16, room_height + 16, color1, color1, color2, color2, 0);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_blend_mode(bm_add);
draw_surface_ext(global.surf2, 0, 0, 1/3, 1/3, 0, merge_color(merge_color(c_fuchsia, c_red, 0.5 + lengthdir_x(0.5, dir * 0.4)), merge_color(color1, color2, 0.5 + lengthdir_x(0.5, dir)), 0.5 + lengthdir_x(0.5, dir * 0.1)), 0.1);
draw_set_blend_mode(bm_normal);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], creditangle);
draw_surface_ext(global.surf1, 0, 1 - frac(credits_y), 1, 1, 0, c_black, 0.2);
draw_surface_ext(global.surf1, 0, -1 - frac(credits_y), 1, 1, 0, c_black, 0.2);
draw_surface_ext(global.surf1, 1, 0 - frac(credits_y), 1, 1, 0, c_black, 0.2);
draw_surface_ext(global.surf1, -1, 0 - frac(credits_y), 1, 1, 0, c_black, 0.2);
draw_surface_ext(global.surf1, 0, 0 - frac(credits_y), 1, 1, 0, c_white, 0.2);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
with (objPalmTree)
{
    if (amount2 > 12)
    {
        alpha += 0.01;
    }
    draw_set_blend_mode(bm_add);
    draw_sprite_general(sprPalmTrees, 1, 0, 0, 127, 277, (room_width / 2) + amount2, (room_height * 0.7) - ((320 * amount) / 240), amount / 160, amount / 120, 0, global.color3, global.color3, c_black, c_black, alpha);
    draw_sprite_general(sprPalmTrees, 6, 0, 0, 127, 277, (room_width / 2) - amount - ((amount / 240) * 82), (room_height * 0.7) - ((320 * amount) / 240), -amount / 160, amount / 120, 0, global.color3, global.color3, c_black, c_black, alpha);
    draw_sprite_general(sprPalmTrees, 1, 0, 0, 127, 277, (room_width / 2) + amount2, (room_height * 0.7) - ((320 * amount) / 240), amount / 160, amount / 120, 0, global.color3, global.color3, c_black, c_black, alpha);
    draw_sprite_general(sprPalmTrees, 6, 0, 0, 127, 277, (room_width / 2) - amount - ((amount / 240) * 82), (room_height * 0.7) - ((320 * amount) / 240), -amount / 160, amount / 120, 0, global.color3, global.color3, c_black, c_black, alpha);
    draw_set_blend_mode(bm_normal);
}
i = 0;
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
        if (select == 0 && level == 1)
        {
            sxeasy_stop();
            sxeasy_setVolume(0);
            global.level = 0;
            global.hardmode = 0;
            sxeasy_play(global.Static);
            room = nextlevel;
        }
        if (select == 1 && level == 1)
        {
            sxeasy_stop();
            sxeasy_setVolume(0);
            global.level = 0;
            global.hardmode = 1;
            sxeasy_play(global.Static);
            room = nextlevel;
        }
        if (select == 0 && level == 0)
        {
            sxeasy_stop();
            sxeasy_setVolume(0);
            global.level = 0;
            sxeasy_play(global.Static);
            room = nextlevel;
        }
        if (select == 1 && level == 0)
        {
            room = rmLevelSelect;
        }
        if (select == 2 && level == 0)
        {
            room = rmOptions;
        }
        if (select == 3 && level == 0)
        {
            draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + view_wview[0] + 10, view_yview[0] + view_hview[0] + 10, c_black, c_black, c_black, c_black, 0);
            game_end();
        }
    }
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_color(c_black);
draw_rectangle(-1, -1, room_width + 1, 5.5, false);
draw_rectangle(-1, room_height + 1, room_width + 1, room_height - 7.5, false);
draw_set_color(c_white);
draw_set_font(fntDate);
draw_set_blend_mode(bm_subtract);
my_y = random(32) - 32;
draw_sprite_tiled(sprScanlines, 0, my_y, my_y);
draw_set_blend_mode(bm_subtract);
draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), c_black, c_aqua, 0);
draw_set_blend_mode(bm_normal);
