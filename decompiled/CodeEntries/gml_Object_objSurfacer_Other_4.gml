if (global.resetstory)
{
    draw_clear(c_black);
    screen_refresh();
    room_persistent = false;
    if (ds_list_size(global.roomlist) > 0)
    {
        myroom = ds_list_find_value(global.roomlist, 0);
        ds_list_delete(global.roomlist, 0);
        room_goto(myroom);
    }
    else
    {
        global.level = global.afterreset;
        global.resetstory = 0;
        room = rmChapter;
    }
    exit;
}
if (surface_exists(global.surf2))
{
    surface_set_target(global.surf2);
    draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
    surface_alpha();
    surface_reset_target();
}
if (surface_exists(global.surf3))
{
    surface_set_target(global.surf3);
    draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
    surface_alpha();
    surface_reset_target();
}
