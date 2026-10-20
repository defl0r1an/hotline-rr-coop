colorbg = make_colour_rgb(236, 236, 224);
draw_rectangle_color(0, 0, view_wview[0], view_hview[0], colorbg, colorbg, colorbg, colorbg, 0);
texture_set_interpolation(true);
draw_sprite_ext(sprDevolver, 0, view_wview[0] / 1.36, view_hview[0] / 1.45, 1/3, 1/3, 0, c_white, alpha1);
draw_sprite_ext(sprAbstraction, 0, (view_wview[0] / 6) + 1, (view_hview[0] / 3) + 2, 1/3, 1/3, 0, c_white, alpha2);
texture_set_interpolation(false);
if (alarm[0] == 160)
{
    logo1 = 1;
}
if (logo1 == 1)
{
    alpha1 -= 0.025;
}
if (alarm[0] == 120)
{
    logo2 = 1;
}
if (logo2 == 1)
{
    alpha2 += 0.025;
}
if (fade == 0)
{
    if (amount < 180)
    {
        amount += 5;
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, amount)), 0.5 + lengthdir_x(0.5, amount));
        if (amount > 90)
        {
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, amount))), abs(lengthdir_y(1, amount)));
        }
        else
        {
            color2 = 16777215;
        }
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(0, 0, view_wview[0], view_hview[0], color1, color2, color2, color1, 0);
        draw_set_blend_mode(bm_normal);
    }
}
if (fade == 1)
{
    if (amount > 0)
    {
        amount -= 10;
    }
    else
    {
        room_goto_next();
    }
    color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, amount)), 0.5 + lengthdir_x(0.5, amount));
    if (amount > 90)
    {
        color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, amount))), abs(lengthdir_y(1, amount)));
    }
    else
    {
        color2 = 16777215;
    }
    draw_set_blend_mode(bm_subtract);
    draw_rectangle_color(0, 0, view_wview[0], view_hview[0], color2, color1, color1, color2, 0);
    draw_set_blend_mode(bm_normal);
}
draw_set_blend_mode(bm_subtract);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 480 + random(24), c_black, merge_color(c_navy, c_aqua, 0.25 + random(0.25)), 0);
draw_set_blend_mode(bm_normal);
draw_set_color(c_black);
draw_rectangle(-1, -1, view_wview[0] + 1, 15, false);
draw_rectangle(-1, view_hview[0] + 1, view_wview[0] + 1, view_hview[0] - 15, false);
