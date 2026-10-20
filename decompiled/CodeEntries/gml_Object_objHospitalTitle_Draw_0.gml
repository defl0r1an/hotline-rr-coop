dir += 0.25;
if (global.hardmode == 0)
{
    color2 = merge_color(c_yellow, c_white, 0.7 + lengthdir_x(0.3, dir * 3.12));
    color1 = merge_color(c_yellow, merge_color(merge_color(c_red, c_orange, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_maroon, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.4 + lengthdir_y(0.4, dir * 1.73));
}
else
{
    color2 = merge_color(c_fuchsia, c_white, 0.7 + lengthdir_x(0.3, dir * 3.12));
    color1 = merge_color(c_yellow, merge_color(merge_color(c_fuchsia, c_purple, 0.25 + lengthdir_x(0.25, dir * 3.12)), c_maroon, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.25 + lengthdir_y(0.25, dir * 1.73));
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_rectangle_color(view_xview[0], view_yview[0] + 54, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 64, color1, color1, color2, color2, 0);
with (objHouse)
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
i = 0;
repeat (3)
{
    draw_sprite_ext(sprPalmTrees, palmindex[i], palmx[i], room_height + 65, 1, 1, 0, c_black, 1);
    palmx[i] -= 12;
    if (palmx[i] <= -120)
    {
        palmx[i] = room_width + 160;
        palmindex[i] = floor(random(3));
    }
    i += 1;
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], view_angle[0]);
draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
draw_set_blend_mode(bm_subtract);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, (view_wview[0] * 0.8) + random(10), c_black, c_teal, 0);
draw_set_blend_mode(bm_normal);
view_angle[0] = lengthdir_y(3, dir * 3.33);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 55, false);
draw_rectangle(0, room_height, room_width, room_height - 65, false);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_font(fntDate);
draw_set_halign(fa_center);
draw_set_color(c_dkgray);
draw_text(room_width / 2, room_height - 58, hint[myhint]);
draw_text(room_width / 2, (room_height / 4) - 14, "NOW ENTERING");
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
        room_goto(global.level);
    }
}
draw_set_blend_mode(bm_subtract);
my_y = random(32);
draw_sprite_tiled(sprScanlines, 0, 0, my_y);
draw_set_blend_mode(bm_normal);
