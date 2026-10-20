if (global.console == 1)
{
    console_mode = !console_mode;
    global.player_lock = console_mode;
    cheat = 1;
    if (console_mode)
    {
        keyboard_string = cmd_saved;
    }
    else
    {
        cmd_saved = keyboard_string;
    }
}
