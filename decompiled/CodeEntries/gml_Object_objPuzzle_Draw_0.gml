if (instance_number(objLetterDone) == 16)
{
    draw_surface(surf1, 0, 0);
}
draw_set_blend_mode(bm_normal);
draw_set_color(c_white);
if (global.xbox == 0)
{
    draw_sprite(sprCursor, 0, mouse_x, mouse_y);
}
else
{
    draw_sprite(sprCursor, 0, mousex, mousey);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 44, false);
draw_rectangle(0, room_height - 44, room_width, room_height, false);
