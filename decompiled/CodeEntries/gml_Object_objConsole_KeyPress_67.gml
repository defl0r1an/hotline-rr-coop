if (console_mode && keyboard_check(vk_control))
{
    var s = consoleGetSelection();
    if (s != "")
    {
        clipboard_set_text(s);
    }
}
