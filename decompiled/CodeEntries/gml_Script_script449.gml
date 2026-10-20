if (console_mode)
{
    if (argument1)
    {
        consoleChangeCursorInternal(argument0);
    }
    else
    {
        var len = string_length(keyboard_string);
        if (keyboard_check(vk_control))
        {
            var i = consoleChangeCursorInternal();
            while (1)
            {
                if (i < 1 || i > len || string_ord_at(keyboard_string, i) == 32)
                {
                    break;
                }
                else
                {
                    i += argument0;
                    continue;
                }
            }
        }
        else
        {
            consoleChangeCursorInternal(clamp(argument0 + consoleChangeCursorInternal(), 0, len));
        }
    }
}
