dir += 0.25;
if (global.hardmode == 0)
{
    color2 = make_colour_rgb(26, 8, 24);
    color1 = make_colour_rgb(80, 24, 71);
}
else
{
    color2 = make_colour_rgb(8, 11, 26);
    color1 = make_colour_rgb(24, 40, 80);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_rectangle_color(view_xview[0], view_yview[0] + 40, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 40, color2, color2, color1, color1, 0);
with (objHouseReturn)
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
i = 0;
repeat (3)
{
    draw_sprite_ext(sprPalmTrees, palmindex[i], palmx[i], room_height + 65, 1, 1, 0, c_black, 1);
    palmx[i] += 8;
    if (palmx[i] >= (room_width + 120))
    {
        palmx[i] = -160;
        palmindex[i] = floor(random(3));
    }
    i += 1;
}
draw_rectangle_color(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + 40, c_black, c_black, c_black, c_black, 0);
draw_rectangle_color(view_xview[0], view_hview[0], view_xview[0] + view_wview[0], view_hview[0] - 39, c_black, c_black, c_black, c_black, 0);
draw_set_blend_mode(bm_subtract);
draw_rectangle_color(view_xview[0], view_hview[0] - 38, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 50, c_black, c_black, c_white, c_white, 0);
draw_set_blend_mode(bm_normal);
if (factor > 0)
{
    draw_set_blend_mode(bm_subtract);
    i = 0;
    repeat (9)
    {
        color1 = merge_color(c_black, c_white, 0.5 + lengthdir_x(0.4, 180 - (factor * 180)) + lengthdir_x(0.1, (dir * 16) + (i * 90)));
        draw_rectangle_color(100 + (lengthdir_x(32, (dir * 16) + (i * 90)) * factor), (view_hview[0] - 79) + (i * 5), view_wview[0], ((view_hview[0] - 79) + (i * 5)) - 3, c_black, color1, color1, c_black, 0);
        i += 1;
    }
    draw_set_blend_mode(bm_normal);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_font(fntDate);
    if (global.hardmode == 0)
    {
        color1 = merge_color(c_maroon, c_olive, 0.5 + lengthdir_x(0.5, dir * 5));
        color2 = merge_color(c_yellow, c_orange, 0.5 + lengthdir_x(0.5, dir * 5));
    }
    else
    {
        color1 = merge_color(c_navy, c_purple, 0.5 + lengthdir_x(0.5, dir * 5));
        color2 = merge_color(c_fuchsia, make_colour_rgb(128, 64, 255), 0.5 + lengthdir_x(0.5, dir * 5));
    }
    text = string(points_until_next) + " POINTS UNTIL NEXT WEAPON UNLOCK";
    if (global.newguns > 0)
    {
        text = "NEW WEAPON UNLOCKED!";
    }
    if (allguns == 1)
    {
        text = "";
    }
    else
    {
        draw_set_color(color1);
        draw_text((view_wview[0] / 2) + 1, (view_hview[0] - 24) + 1, text);
        draw_set_color(color2);
        draw_text(view_wview[0] / 2, view_hview[0] - 24, text);
    }
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], view_angle[0]);
if (surface_exists(global.surf1))
{
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
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
        next = 17;
        room_goto(next);
    }
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_color(c_black);
draw_set_blend_mode(bm_subtract);
my_y = random(32);
draw_sprite_tiled(sprScanlines, 0, 0, my_y);
draw_set_blend_mode(bm_subtract);
if (global.hardmode == 0)
{
    draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), c_black, c_aqua, 0);
}
else
{
    draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), c_black, c_red, 0);
}
draw_set_blend_mode(bm_normal);
