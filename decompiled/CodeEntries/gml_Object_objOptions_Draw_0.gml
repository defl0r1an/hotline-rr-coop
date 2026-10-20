view_angle[0] = lengthdir_x(1, dir * 0.1);
draw_rectangle_color(-30, -30, room_width + 30, room_height + 30, merge_color(c_black, c_dkgray, 0.1 + random(0.1)), merge_color(c_black, c_dkgray, 0.1 + random(0.1)), merge_color(c_black, c_maroon, random(0.1)), merge_color(c_black, c_maroon, random(0.1)), 0);
draw_set_blend_mode(bm_add);
draw_circle_color(room_width / 2, room_height / 3, 192 + lengthdir_x(16, dir * 0.1), c_maroon, c_black, 0);
draw_set_blend_mode(bm_normal);
draw_set_color(merge_color(c_red, c_orange, 0.6 + lengthdir_x(0.2, dir * 3)));
draw_circle(room_width / 2, room_height / 3, 8, 0);
draw_set_color(merge_color(c_black, c_dkgray, random(0.05)));
color = merge_color(merge_color(c_purple, c_maroon, 0.7 + lengthdir_x(0.3, dir * 0.1)), merge_color(c_black, c_orange, 0.05 + lengthdir_x(0.02, dir * 0.14)), 0.85 + lengthdir_x(0.05, dir * 0.3));
draw_rectangle_color(-30, room_height / 3, room_width + 30, room_height + 30, c_black, c_black, color, color, 0);
with (objWave)
{
    image_xscale = 1 + (y * 0.02);
    if (y > 0)
    {
        image_yscale = y * 0.01;
    }
    else
    {
        image_yscale = 0;
    }
    dir += 2;
    if (y < 0)
    {
        image_blend = c_black;
    }
    else
    {
        image_blend = merge_color(c_black, c_red, (y * 1) / (room_height + 32));
    }
    i = 0;
    repeat (6)
    {
        draw_sprite_ext(sprite_index, index[i], x + (i * sprite_get_width(sprite_index) * 0.5 * image_xscale), (room_height / 2) + (y * 0.5 * image_xscale), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(sprite_index, index[i], x - (i * sprite_get_width(sprite_index) * 0.5 * image_xscale), (room_height / 2) + (y * 0.5 * image_xscale), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        index[i] += 0.1;
        i += 1;
    }
    if (y < (room_height + 60))
    {
        y += 0.5;
    }
    else
    {
        y = -30;
    }
}
if (global.language == 0)
{
    altchoise = "ENGLISH";
}
else
{
    altchoise = "RUSSIAN";
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
if (surface_exists(global.surf1))
{
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_rectangle(0, 0, view_wview[0], blackx, false);
draw_set_color(c_black);
draw_rectangle(0, 0, view_wview[0], blackx, false);
draw_rectangle(0, view_hview[0] - blackx, view_wview[0], view_hview[0], false);
draw_set_blend_mode(bm_normal);
draw_set_font(fntDate);
draw_text_colour(view_wview[0] / 2, (view_hview[0] * 0.95) + 1, "THANKS FOR PLAYING SUPER REDUX-REDUX#SUPER R-R VER. 2.05", c_orange, c_orange, c_yellow, c_yellow, 0.25);
draw_text_colour(view_wview[0] / 2, view_hview[0] * 0.95, "THANKS FOR PLAYING SUPER REDUX-REDUX#SUPER R-R VER. 2.05", c_maroon, c_maroon, c_red, c_red, 1);
draw_set_color(c_black);
draw_set_alpha(0.2);
draw_text(view_wview[0] / 2, view_hview[0] * 0.95, "THANKS FOR PLAYING SUPER REDUX-REDUX#SUPER R-R VER. 2.05");
draw_set_blend_mode(bm_subtract);
my_y = random(32);
draw_sprite_tiled(sprScanlines, 0, 0, my_y);
draw_set_blend_mode(bm_subtract);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 240 + random(24), c_black, merge_color(c_navy, c_aqua, 0.25 + random(0.25)), 0);
draw_set_blend_mode(bm_normal);
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
        if (file_exists(working_directory + "\xbox") && global.xbox == 0)
        {
            file_delete(working_directory + "\xbox");
        }
        if (file_exists(working_directory + "\steamon"))
        {
            file_delete(working_directory + "\steamon");
        }
        if (file_exists(working_directory + "\steamoff"))
        {
            file_delete(working_directory + "\steamoff");
        }
        if (file_exists(working_directory + "\alienware"))
        {
            file_delete(working_directory + "\alienware");
        }
        if (global.steamon == 1)
        {
            SteamShutdown();
            steamdll_free();
        }
        if (global.xbox == 1)
        {
            dllfree();
        }
        if (global.alienware == 1)
        {
            scrAlienWareFree();
        }
        sxeasy_close();
        sleep(250);
        room = nextrm;
    }
}
