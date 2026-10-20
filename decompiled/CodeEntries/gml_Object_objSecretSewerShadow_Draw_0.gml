draw_set_colour(c_black);
draw_rectangle(0 - scale, 0 - scale, room_width + scale, 15, false);
draw_rectangle(0 - scale, 0, 32, room_height, false);
draw_rectangle(0 - scale, 187, room_width + scale, room_height + scale, false);
draw_rectangle(room_width, 0, room_width + scale, room_height, false);
draw_set_blend_mode(bm_subtract);
draw_set_color(c_white);
draw_set_blend_mode(bm_subtract);
draw_rectangle(32, 16, 208 - dir, 186, false);
draw_rectangle_color(208 - dir, 16, 258 - dir, 186, c_white, c_black, c_black, c_white, 0);
if (instance_exists(objJonesBoss))
{
    if (objJonesBoss.state == -3 && dir < 160)
    {
        dir++;
    }
    else
    {
        state = 1;
    }
}
else if (dir < 160)
{
    if (instance_exists(objPlayer) && objPlayer.Spark == 2)
    {
        dir = lerp(dir, 160, 0.015);
    }
}
draw_set_color(c_white);
draw_set_blend_mode(bm_subtract);
draw_rectangle(334 + dir1, 16, room_width, 186, false);
draw_rectangle_color(304 + dir1, 16, 334 + dir1, 186, c_black, c_white, c_white, c_black, 0);
if (instance_exists(objJonesBoss))
{
    if (objJonesBoss.state > 1)
    {
        if (dir1 < 625)
        {
            dir1 = lerp(dir1, 625, 0.015);
        }
    }
}
draw_set_blend_mode(bm_normal);
