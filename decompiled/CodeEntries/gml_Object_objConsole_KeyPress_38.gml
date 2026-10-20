if (keyboard_check(vk_control))
{
    if (log_offset > 0)
    {
        log_offset--;
    }
    exit;
}
cmd_selector--;
event_user(0);
