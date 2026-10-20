dir += 0.25;
if (global.hardmode == 0)
{
    color2 = merge_color(c_black, merge_color(c_maroon, c_orange, 0.5 + lengthdir_x(0.5, dir * 4)), 0.4);
    color1 = merge_color(c_black, merge_color(c_fuchsia, c_maroon, 0.5 + lengthdir_x(0.5, dir * 4)), 0.2);
}
else
{
    color2 = merge_color(c_black, merge_color(c_maroon, c_orange, 0.5 + lengthdir_x(0.5, dir * 4)), 0.3);
    color1 = merge_color(c_black, merge_color(c_fuchsia, c_maroon, 0.5 + lengthdir_x(0.5, dir * 4)), 0.3);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_rectangle_color(view_xview[0], view_yview[0] + 34, view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 34, color1, color1, color2, color2, 0);
color1a = 8388736;
color2a = 8388736;
color3a = merge_color(merge_color(c_maroon, c_teal, 0.5 + lengthdir_x(0.5, dir)), c_black, 0.5 + lengthdir_x(0.5, dir * 0.5));
color4a = merge_color(merge_color(c_maroon, c_teal, 0.5 + lengthdir_x(0.5, dir * 1.2)), c_black, 0.5 + lengthdir_x(0.5, (dir * 0.5) + 45));
draw_set_blend_mode(bm_subtract);
if (surface_exists(surf1))
{
    draw_surface_general(surf1, 0, 0, 640, 320, 0, 0, 1, 1, 0, color1a, color2a, color3a, color4a, 1);
}
draw_set_blend_mode(bm_normal);
if (!surface_exists(surf1))
{
    surf1 = surface_create(room_width, room_height);
}
surface_set_target(surf1);
draw_clear_alpha(c_black, 0);
with (objHouse)
{
    draw_sprite_general(sprite_index, image_index, 0, 0, sprite_get_width(sprite_index), sprite_get_height(sprite_index), x, y, image_xscale, image_yscale, image_angle, c_white, c_white, c_black, c_black, 1);
}
surface_reset_target();
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
i = 0;
repeat (3)
{
    draw_sprite_ext(sprPalmTrees, palmindex[i], palmx[i], room_height + 65, 1, 1, 0, c_black, 1);
    palmx[i] -= 8;
    if (palmx[i] <= -120)
    {
        palmx[i] = room_width + 160;
        palmindex[i] = floor(random(3));
    }
    i += 1;
}
draw_set_blend_mode(bm_subtract);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, (view_wview[0] * 0.8) + random(10), c_black, c_teal, 0);
draw_set_blend_mode(bm_normal);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], view_angle[0]);
if (surface_exists(global.surf1))
{
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
}
view_angle[0] = lengthdir_y(3, dir * 3.33);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 35, false);
draw_rectangle(0, room_height, room_width, room_height - 35, false);
if (global.dialoguestyle == 1)
{
    draw_sprite_ext(sprPhoneLine, 0, 0, 38, 1, 2, 90, c_white, 1);
    draw_sprite_ext(sprPhoneLine, 0, 0, room_height - 35, 1, 2, 90, c_white, 1);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_font(fntDate);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_dkgray);
draw_text(room_width / 2, room_height - 28, hint[myhint]);
draw_text(room_width / 2, room_height / 8.6, "NOW ENTERING");
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
        global.NotSaved = 1;
        global.shells = 0;
        global.PauseRestart = 1;
        room_goto(global.level);
    }
}
draw_set_blend_mode(bm_subtract);
my_y = random(32);
draw_sprite_tiled(sprScanlines, 0, 0, my_y);
draw_set_blend_mode(bm_normal);
