if (global.xbox == 1)
{
    if (checkbutton(0, getid(5)) || checkbutton(0, getid(6)))
    {
        if (presstart == 0)
        {
            presstart = 1;
            scrXboxCreditsStart();
        }
    }
    else
    {
        presstart = 0;
    }
}
if (!surface_exists(global.surf1))
{
    global.surf1 = surface_create(room_width, room_height);
    surface_set_target(global.surf1);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
if (!surface_exists(global.surf2))
{
    global.surf2 = surface_create(room_width * 3, room_height * 3);
    surface_set_target(global.surf2);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
if (!surface_exists(global.surf3))
{
    global.surf3 = surface_create(room_width * 3, room_height * 3);
    surface_set_target(global.surf3);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
if (global.holiday != 2)
{
    color1 = merge_color(c_teal, c_green, 0.5 + lengthdir_x(0.5, dir));
    color2 = merge_color(c_lime, c_yellow, 0.5 + lengthdir_x(0.5, dir));
    color3 = merge_color(c_aqua, c_lime, 0.5 + lengthdir_x(0.5, dir));
    color4 = 16777215;
}
else
{
    color1 = merge_color(c_yellow, c_olive, 0.5 + lengthdir_x(0.5, dir));
    color2 = merge_color(c_olive, c_yellow, 0.5 + lengthdir_x(0.5, dir));
    color3 = merge_color(c_yellow, c_olive, 0.5 + lengthdir_x(0.5, dir));
    color4 = 16777215;
}
dir += 2;
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_color(color1);
surface_reset_target();
surface_set_target(global.surf3);
draw_surface_ext(global.surf2, 0, 0, 1, 1, 0, c_white, 0.998);
surface_reset_target();
surface_set_target(global.surf2);
draw_clear_alpha(c_black, 0.1);
texture_set_interpolation(true);
with (objSpread)
{
    draw_sprite_ext(sprite_index, image_index, x * 3, y * 3, image_xscale * 3, image_yscale * 3, image_angle, merge_color(c_white, c_yellow, random(1)), image_alpha);
}
draw_set_blend_mode(bm_add);
draw_surface_ext(global.surf3, -13, -7.68, 1.02, 1.02, 0, c_white, 1);
texture_set_interpolation(false);
draw_set_blend_mode(bm_normal);
surface_reset_target();
if (wait > 0)
{
    wait -= 1;
}
if (global.xbox == 1)
{
    if (checkbutton(0, getid(5)))
    {
        if (presstart == 0)
        {
            presstart = 1;
            scrXboxMenuStart();
        }
    }
    else
    {
        presstart = 0;
    }
    if (checkbutton(0, getid(6)))
    {
        if (pressback == 0)
        {
            pressback = 1;
            scrXboxMenuQuit();
        }
    }
    else
    {
        pressback = 0;
    }
    if (leftthumb_x(0) > 10000)
    {
        if (pressright == 0)
        {
            pressright = 1;
            scrXboxMenuRight();
        }
    }
    else
    {
        pressright = 0;
    }
    if (leftthumb_x(0) < -10000)
    {
        if (pressleft == 0)
        {
            pressleft = 1;
            scrXboxMenuLeft();
        }
    }
    else
    {
        pressleft = 0;
    }
    if (leftthumb_y(0) > 10000)
    {
        if (pressup == 0)
        {
            pressup = 1;
            scrXboxMenuUp();
        }
    }
    else
    {
        pressup = 0;
    }
    if (leftthumb_y(0) < -10000)
    {
        if (pressdown == 0)
        {
            pressdown = 1;
            scrXboxMenuDown();
        }
    }
    else
    {
        pressdown = 0;
    }
}
if (!surface_exists(global.surf1))
{
    global.surf1 = surface_create(room_width, room_height);
    if (surface_exists(global.surf1))
    {
        surface_set_target(global.surf1);
        draw_clear_alpha(c_black, 0);
        surface_reset_target();
    }
}
if (keyboard_check_pressed(ord(global.upkey)))
{
    event_perform(ev_keypress, ord("W"));
}
if (keyboard_check_pressed(ord(global.downkey)))
{
    event_perform(ev_keypress, ord("S"));
}
if (keyboard_check_pressed(ord(global.rightkey)))
{
    event_perform(ev_keypress, ord("D"));
}
if (keyboard_check_pressed(ord(global.leftkey)))
{
    event_perform(ev_keypress, ord("A"));
}
if (!surface_exists(global.surf1))
{
    exit;
}
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
amount = 0.5 + lengthdir_x(0.5, dir * 7);
colormenu0 = merge_color(c_dkgray, merge_color(c_black, c_dkgray, 0.35), amount);
amount1 = 0.5 - lengthdir_x(0.5, dir * 7);
colormenu1 = merge_color(merge_color(c_black, c_dkgray, 0.35), c_dkgray, amount1);
i = 0;
ii = 0;
draw_set_font(fntBigMenu);
colormenu2 = merge_color(merge_color(c_fuchsia, c_maroon, 0.35 + lengthdir_x(0.35, dir * 2)), c_purple, 0.5 + lengthdir_x(0.5, dir + (ii * 45)));
if (level == 1)
{
    repeat (2)
    {
        draw_set_font(fntBigMenu);
        ii = 0;
        repeat (altrepeat1[i])
        {
            if (select == i)
            {
                draw_set_color(colormenu2);
            }
            else
            {
                draw_set_color(merge_color(c_dkgray, c_black, 0.25 + lengthdir_x(0.25, dir + (ii * 45))));
            }
            draw_text_transformed((view_wview[0] / 2) - ii, (view_hview[0] / 2) + 36 + (i * 24), alt[i], 1, 1, lengthdir_x(1, dir * 0.1));
            ii += 1;
        }
        if (select == i)
        {
            draw_set_color(c_black);
            draw_text_transformed((view_wview[0] / 2) - ii, (view_hview[0] / 2) + 36 + (i * 24), alt[i], 1, 1, lengthdir_x(1, dir * 0.1));
            draw_text_transformed_color((view_wview[0] / 2) - 1 - ii, (view_hview[0] / 2) + 36 + (i * 24), alt[i], 1, 1, lengthdir_x(1, dir * 0.1), c_white, c_white, colormenu2, colormenu2, 1);
            draw_text_transformed_color((view_wview[0] / 2) - 2 - ii, (view_hview[0] / 2) + 36 + (i * 24), alt[i], 1, 1, lengthdir_x(1, dir * 0.1), c_white, c_white, colormenu2, colormenu2, 1);
            draw_text_transformed_color((view_wview[0] / 2) - 3 - ii, (view_hview[0] / 2) + 36 + (i * 24), alt[i], 1, 1, lengthdir_x(1, dir * 0.1), c_white, c_white, colormenu2, colormenu2, 1);
            if (altrepeat1[i] < 8)
            {
                altrepeat1[i] += 0.5;
            }
        }
        else if (altrepeat1[i] > 3)
        {
            altrepeat1[i] -= 0.5;
        }
        i += 1;
    }
}
if (level == 0)
{
    repeat (4)
    {
        draw_set_font(fntBigMenu);
        ii = 0;
        repeat (altrepeat[i])
        {
            if (select == i)
            {
                draw_set_color(colormenu2);
            }
            else
            {
                draw_set_color(merge_color(c_dkgray, c_black, 0.25 + lengthdir_x(0.25, dir + (ii * 45))));
            }
            draw_text_transformed((view_wview[0] / 2) - ii, (view_hview[0] / 2) + 12 + (i * 24), alt[i], 1, 1, -lengthdir_x(1, dir * 0.1));
            ii += 1;
        }
        if (select == i)
        {
            draw_set_color(c_black);
            draw_text_transformed((view_wview[0] / 2) - ii, (view_hview[0] / 2) + 12 + (i * 24), alt[i], 1, 1, -lengthdir_x(1, dir * 0.1));
            draw_text_transformed_color((view_wview[0] / 2) - 1 - ii, (view_hview[0] / 2) + 12 + (i * 24), alt[i], 1, 1, -lengthdir_x(1, dir * 0.1), c_white, c_white, colormenu2, colormenu2, 1);
            draw_text_transformed_color((view_wview[0] / 2) - 2 - ii, (view_hview[0] / 2) + 12 + (i * 24), alt[i], 1, 1, -lengthdir_x(1, dir * 0.1), c_white, c_white, colormenu2, colormenu2, 1);
            draw_text_transformed_color((view_wview[0] / 2) - 3 - ii, (view_hview[0] / 2) + 12 + (i * 24), alt[i], 1, 1, -lengthdir_x(1, dir * 0.1), c_white, c_white, colormenu2, colormenu2, 1);
            if (altrepeat[i] < 8)
            {
                altrepeat[i] += 0.5;
            }
        }
        else if (altrepeat[i] > 3)
        {
            altrepeat[i] -= 0.5;
        }
        i += 1;
    }
}
draw_set_blend_mode(bm_normal);
i = 10;
repeat (10)
{
    if (global.holiday != 2)
    {
        color2 = merge_color(merge_color(c_aqua, c_aqua, 0.5 + lengthdir_x(0.5, dir * 1.3)), merge_color(c_purple, c_fuchsia, 0.5 + lengthdir_x(0.5, dir)), i * 0.1);
    }
    else
    {
        color2 = merge_color(merge_color(c_yellow, c_yellow, 0.5 + lengthdir_x(0.5, dir * 1.3)), merge_color(c_olive, c_yellow, 0.5 + lengthdir_x(0.5, dir)), i * 0.1);
    }
    draw_sprite_ext(sprTitle, 0, (view_wview[0] / 2) + lengthdir_x(i * 0.5, dir * 0.1), (view_hview[0] / 4) + 8 + lengthdir_y(i * 0.5, dir * 0.1), 1, 1, lengthdir_y(5, dir * 0.1), color2, 1);
    i -= 1;
}
i = 0;
times = 1 + lengthdir_x(16, dir * 0.25);
if (times < 1)
{
    times = 1;
}
if (times > 10)
{
    times = 10;
}
repeat (times)
{
    color9 = merge_color(c_red, c_white, i * 0.1);
    if (i < times)
    {
        if (global.holiday != 2)
        {
            draw_sprite_ext(sprTitle, 1, (view_wview[0] / 2) + 10 + lengthdir_x(0.5, dir * 1.3), (view_hview[0] / 4) + 8 + lengthdir_y(i * 0.5, dir * 0.1), 1, 1, lengthdir_y(5, dir * 0.1), color9, 1);
        }
        else
        {
            draw_sprite_ext(sprWoag, 0, (view_wview[0] / 2) + 10 + lengthdir_x(0.5, dir * 1.3), (view_hview[0] / 4) + 8 + lengthdir_y(i * 0.5, dir * 0.1), 1, 1, lengthdir_y(5, dir * 0.1), color9, 1);
        }
        draw_sprite_ext(sprTitle, 2, (view_wview[0] / 2) + 5 + lengthdir_x(0.5, dir * 1.3), (view_hview[0] / 4) + 8 + lengthdir_y(i * 0.5, dir * 0.1), 1, 1, lengthdir_y(5, dir * 0.1), color9, 1);
    }
    i += 1;
}
surface_alpha();
surface_reset_target();
if (reload > 0)
{
    reload -= 1;
}
else
{
    my_id = instance_create((room_width / 2) + 32, room_height / 2, objPalmTree);
    my_id.image_index = 6;
    my_id = instance_create((room_width / 2) - 8, room_height / 2, objPalmTree);
    my_id.image_index = 1;
    reload = 35;
}
