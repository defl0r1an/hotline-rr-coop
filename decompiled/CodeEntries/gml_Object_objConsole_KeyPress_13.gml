if (console_mode)
{
    cmd_selector = 0;
    prev_lb_len = array_length_1d(log_buffer);
    cl_print(">> " + keyboard_string, 16777215);
    event_user(3);
    event_user(1);
    cursor_main_pos = 0;
    cursor_sel_pos = 0;
    keyboard_string = "";
    alarm[0] = 3;
}
