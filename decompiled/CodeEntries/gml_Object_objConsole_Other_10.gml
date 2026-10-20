if (cmd_selector >= array_length_1d(cmd_buffer))
{
    cmd_selector = 0;
}
else if (cmd_selector <= 0)
{
    cmd_selector = array_length_1d(cmd_buffer) - 1;
}
keyboard_string = cmd_buffer[cmd_selector];
cursor_main_pos = clamp(cursor_main_pos, 0, string_length(keyboard_string));
cursor_sel_pos = cursor_main_pos;
