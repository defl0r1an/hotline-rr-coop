if (keyboard_check(vk_shift))
{
    if (argument0)
    {
        cursor_sel_pos = argument0;
    }
    else
    {
        return cursor_sel_pos;
    }
}
else if (argument0)
{
    cursor_main_pos = argument0;
    cursor_sel_pos = argument0;
}
else
{
    return cursor_main_pos;
}
