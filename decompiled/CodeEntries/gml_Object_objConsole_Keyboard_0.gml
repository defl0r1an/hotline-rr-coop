if (console_mode)
{
    if (cmd_suggestions && keyboard_string != "" && string_count(" ", keyboard_string) == 0)
    {
        for (i = 0; i < array_length_1d(cmd_list); i++)
        {
            a = cmd_list[i];
            j = 0;
            while (1)
            {
                j++;
                if (string_char_at(keyboard_string, j) == string_char_at(a, j))
                {
                    if (j >= string_length(keyboard_string))
                    {
                        cmd_suggested = a;
                        exit;
                    }
                }
                else
                {
                    break;
                }
            }
        }
        cmd_suggested = "";
    }
    else
    {
        cmd_suggested = "";
    }
    if (cursor_sel_pos == cursor_main_pos)
    {
        i = string_length(keyboard_string);
        if (cursor_main_pos == (i - 1))
        {
            consoleChangeCursorInternal(i);
        }
    }
    else if (keyboard_prev != keyboard_string)
    {
        consoleGetSelection(1);
    }
    keyboard_prev = keyboard_string;
}
