if (console_mode)
{
    if (keyboard_check(vk_down) || keyboard_check(vk_up))
    {
        if (nav_keys_timer <= 0)
        {
            event_perform(ev_keypress, keyboard_key);
        }
        else
        {
            nav_keys_timer--;
        }
    }
    else
    {
        nav_keys_timer = keys_timer_max;
    }
    if (keyboard_check(vk_right) || keyboard_check(vk_left))
    {
        if (cursor_keys_timer <= 0)
        {
            event_perform(ev_keypress, keyboard_key);
        }
        else
        {
            cursor_keys_timer--;
        }
    }
    else
    {
        cursor_keys_timer = keys_timer_max;
    }
    if (mouse_wheel_down())
    {
        if (log_offset < array_length_1d(log_buffer))
        {
            log_offset++;
        }
    }
    if (mouse_wheel_up())
    {
        if (log_offset > 0)
        {
            log_offset--;
        }
    }
}
if (instance_exists(objPlayer) && myspeed != 0)
{
    objPlayer.myspeed = myspeed;
}
if (!window_has_focus())
{
    room_speed = 30;
}
else
{
    room_speed = 60;
}
