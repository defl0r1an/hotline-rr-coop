if (wait > 0)
{
    wait -= 1;
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
i = 0;
ii = 0;
draw_set_font(fntMenu);
if (level == 1)
{
    repeat (2)
    {
        if (select == i)
        {
            repeats = 6 + lengthdir_x(5, dir * 10);
            repeat (repeats)
            {
                draw_set_color(merge_color(c_purple, c_white, ii * 0.085));
                draw_text(x + ii, y + 56 + (i * 20), alt[i]);
                ii += 1;
            }
        }
        else
        {
            amount = 0.5 + lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(x + 1, y + 56 + (i * 20) + 1, alt[i]);
            amount = 0.5 - lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(x, y + 56 + (i * 20), alt[i]);
        }
        i += 1;
    }
}
if (level == 0)
{
    repeat (4)
    {
        if (select == i)
        {
            repeats = 6 + lengthdir_x(5, dir * 10);
            repeat (repeats)
            {
                draw_set_color(merge_color(c_purple, c_white, ii * 0.085));
                draw_text(x + ii, y + 56 + (i * 20), alt[i]);
                ii += 1;
            }
        }
        else
        {
            amount = 0.5 + lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(x + 1, y + 56 + (i * 20) + 1, alt[i]);
            amount = 0.5 - lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(x, y + 56 + (i * 20), alt[i]);
        }
        i += 1;
    }
}
draw_set_blend_mode(bm_normal);
if (coldir > 90)
{
    i = 0;
    times = lengthdir_x(40, dir * 12);
    if (times < 1)
    {
        times = 1;
    }
    repeat (1 + ((coldir - 90) * 0.4))
    {
        color2 = merge_color(c_purple, color, i * 0.025);
        color9 = merge_color(c_red, c_white, i * 0.025);
        draw_sprite_ext(sprTitle, 0, lengthdir_x(i * 0.25, (dir * 4) + 180) + x + lengthdir_x(i * 0.5, dir * 4), lengthdir_y(i * 0.25, (dir * 4) + 180) + y + lengthdir_y(i * 0.5, dir * 4), 1, 1, lengthdir_y(5, dir * 4), color2, 1);
        if (i < times)
        {
            draw_sprite_ext(sprTitle, 1, lengthdir_x(i * 0.25, (dir * 4) + 180) + x + lengthdir_x(i * 0.5, dir * 4), lengthdir_y(i * 0.25, (dir * 4) + 180) + y + lengthdir_y(i * 0.5, dir * 4), 1, 1, lengthdir_y(5, dir * 4), color9, 1);
            draw_sprite_ext(sprTitle, 2, lengthdir_x(i * 0.25, (dir * 4) + 180) + x + lengthdir_x(i * 0.5, dir * 4), lengthdir_y(i * 0.25, (dir * 4) + 180) + y + lengthdir_y(i * 0.5, dir * 4), 1, 1, lengthdir_y(5, dir * 4), color9, 1);
        }
        i += 1;
    }
}
else
{
    draw_sprite_ext(sprTitle, 0, x, y, 1, 1, lengthdir_y(5, dir * 4), color, 1);
}
surface_alpha();
surface_reset_target();
