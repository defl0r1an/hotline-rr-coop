if (console_mode && keyboard_check(vk_control) && clipboard_has_text())
{
    consoleGetSelection(1);
    keyboard_string = string_insert(clipboard_get_text(), keyboard_string, cursor_main_pos);
}
