if (view_current == 0)
{
    color1 = merge_color(c_olive, c_maroon, 0.5 + lengthdir_x(0.5, dir));
    color2 = merge_color(c_orange, c_purple, 0.5 + lengthdir_x(0.5, dir));
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_set_blend_mode(bm_subtract);
    draw_rectangle_color(0, 0, 453, 140, color1, color1, color2, color2, 0);
    draw_rectangle_color(0, 130, 453, 140, c_black, c_black, c_white, c_white, 0);
    draw_set_blend_mode(bm_normal);
    if (fade == 0)
    {
        if (c_amount < 180)
        {
            c_amount += 2;
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
            draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + global.wview + 10, view_yview[0] + global.hview + 10, color1, color2, color2, color1, 0);
            draw_set_blend_mode(bm_normal);
        }
    }
    if (fade == 1)
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
            draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + global.wview + 10, view_yview[0] + global.hview + 10, color2, color1, color1, color2, 0);
            draw_set_blend_mode(bm_normal);
        }
        else if (global.newmasks > 0)
        {
            draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + global.wview + 10, view_yview[0] + global.hview + 10, c_black, c_black, c_black, c_black, 0);
            sxeasy_stop(0);
            room_goto(rmUnlock);
        }
        else
        {
            draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + global.wview + 10, view_yview[0] + global.hview + 10, c_black, c_black, c_black, c_black, 0);
            sxeasy_stop(0);
            bgm_Close();
            game_restart();
        }
    }
    dir += 1;
}
else if (view_current != 0)
{
    draw_set_alpha(1);
    draw_set_font(fntBikerCredits);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(merge_color(c_fuchsia, c_purple, 0.5 + lengthdir_x(0.5, dir)));
    draw_text(225, credits_y + 1, credits);
    draw_set_color(merge_color(c_white, c_aqua, 0.5 + lengthdir_x(0.5, dir - 90)));
    draw_text(224, credits_y, credits);
    draw_set_blend_mode(bm_subtract);
    draw_rectangle_color(0, 140, 400, 150, c_white, c_white, c_black, c_black, 0);
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(0.5 + lengthdir_x(0.5, c_amount));
    draw_set_color(c_black);
}
