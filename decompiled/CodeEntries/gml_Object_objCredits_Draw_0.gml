d3d_set_projection_ortho(0, 0, 453, 256, 0);
draw_rectangle_color(0, 60, room_width, room_height - 60, merge_color(c_black, c_navy, 0.1 + lengthdir_x(0.1, dir * 0.5)), merge_color(c_black, c_navy, 0.1 + lengthdir_x(0.1, dir * 2)), merge_color(c_maroon, c_red, 0.4 + lengthdir_x(0.3, dir * 0.76) + random(0.05)), merge_color(c_maroon, c_red, 0.4 + lengthdir_x(0.3, dir * 0.76) + random(0.05)), 0);
if (rollcredits == 0)
{
    view_angle[0] = lengthdir_x(2, dir * 0.2);
}
else if (topicalpha <= 0.05)
{
    view_angle[0] = 0;
}
d3d_set_projection_ortho(0, 0, 453, 256, view_angle[0]);
if (rollcredits == 1)
{
    draw_set_font(fntCreditList);
    if (credit_y < (string_height(creditlist) + 128))
    {
        if (credits_y < 1)
        {
            credits_y += 0.2;
        }
        if (credits_y == 1)
        {
            credit_y += 1;
        }
    }
}
draw_set_blend_mode(bm_add);
draw_surface_ext(global.surf2, 0, 0, 1/3, 1/3, 0, merge_color(merge_color(c_fuchsia, c_aqua, 0.5 + lengthdir_x(0.5, dir * 0.4)), merge_color(c_yellow, c_lime, 0.5 + lengthdir_x(0.5, dir)), 0.5 + lengthdir_x(0.5, dir * 0.1)), 0.4);
draw_set_blend_mode(bm_normal);
draw_surface_ext(global.surf1, 0, 1 - frac(credits_y), 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, -1 - frac(credits_y), 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 1, 0 - frac(credits_y), 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, -1, 0 - frac(credits_y), 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, 0 - frac(credits_y), 1, 1, 0, c_white, 1);
d3d_set_projection_ortho(0, 0, 453, 256, 0);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 60, false);
draw_rectangle(0, room_height - 60, room_width, room_height, false);
if (endfade == 0)
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
if (endfade == 1)
{
    if (c_amount > 0)
    {
        c_amount -= 5;
        sxeasy_setVolume(c_amount * 0.005555555555555556);
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
        sxeasy_stop();
        global.parttitle[0] = "PART FIVE:";
        global.parttitle[1] = "ANSWERS.";
        global.nextlevel = 36;
        room_goto(rmPart);
    }
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_blend_mode(bm_subtract);
my_y = random(32);
draw_sprite_tiled(sprScanlines, 0, 0, my_y);
draw_set_blend_mode(bm_subtract);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 240 + random(24), c_black, merge_color(c_navy, c_aqua, 0.25 + random(0.25)), 0);
draw_set_blend_mode(bm_normal);
