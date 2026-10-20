if (surface_exists(global.psurf))
{
    if (on > 0)
    {
        if (blur < 1)
        {
            blur += 0.1;
        }
        if (blacky < 1)
        {
            blacky += 0.05;
        }
    }
    else if (on == 0)
    {
        if (blur > 0)
        {
            blur -= 0.05;
        }
        if (blacky > 0)
        {
            blacky -= 0.05;
        }
        else
        {
            if (surface_exists(global.psurf))
            {
                surface_free(global.psurf);
            }
            room = global.lastroom;
            exit;
        }
    }
    color1 = merge_color(c_red, c_aqua, 0.5 + lengthdir_x(0.5, dir));
    color2 = make_color_hsv(0, 0, 45 + lengthdir_x(20, dir * 3));
    global.myx = lengthdir_x(0.5 * blur, dir * 1.35);
    global.myy = lengthdir_y(0.5 * blur, dir * 1.35);
    merge_color(c_black, color2, blur);
    dir += 2;
    draw_enable_alphablend(0);
    draw_surface_ext(global.psurf, global.myx, global.myy, view_w / surf_w, view_h / surf_h, 0, merge_color(c_white, color1, blur * 0.5), 0.8 + lengthdir_x(0.2, dir));
    draw_surface_ext(global.psurf, -global.myx, -global.myy, view_w / surf_w, view_h / surf_h, 0, merge_color(c_white, color1, blur * 0.5), 0.8 - lengthdir_x(0.2, dir));
    draw_enable_alphablend(1);
}
coloralpha1 = merge_color(c_black, c_dkgray, blur * 0.5);
coloralpha2 = merge_color(c_black, c_white, blur * 0.5);
draw_set_color(c_black);
draw_set_blend_mode(bm_subtract);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 268, coloralpha2, coloralpha2, 0);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 268, coloralpha1, coloralpha2, 0);
draw_set_blend_mode(bm_normal);
point_x = x + (1 * dcos(360));
point_y = y + (1 * dsin(360));
if (surface_exists(global.surf1))
{
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
}
if (fade == 1)
{
    if (c_amount > 0)
    {
        c_amount -= 5;
        sxeasy_setVolume((c_amount * (1 - (blur * 0.5))) / 180);
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
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + view_wview[0] + 10, view_yview[0] + view_hview[0] + 10, c_white, c_white, c_white, c_white, 0);
        draw_set_blend_mode(bm_normal);
        game_restart();
    }
}
else
{
    sxeasy_setVolume(1 - (blur * 0.5));
}
draw_set_blend_mode(bm_subtract);
my_y = random(32);
draw_sprite_tiled(sprScanlines, 0, 0, my_y);
draw_set_blend_mode(bm_subtract);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 268 + random(24), c_black, merge_color(c_navy, c_aqua, 0.25 + random(0.25)), 0);
draw_set_blend_mode(bm_normal);
