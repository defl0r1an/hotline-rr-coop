if (keyboard_check(vk_control))
{
    if (log_offset < array_length_1d(log_buffer))
    {
        log_offset++;
    }
    exit;
}
cmd_selector++;
event_user(0);
