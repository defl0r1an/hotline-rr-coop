if (cursor_sel_pos == cursor_main_pos)
{
    return "";
}
var i = cursor_sel_pos - cursor_main_pos;
var p;
if (i > 0)
{
    p = cursor_main_pos;
    cursor_sel_pos = p;
}
else
{
    p = cursor_sel_pos;
    cursor_main_pos = p;
    i = -i;
}
if (argument0)
{
    keyboard_string = string_delete(keyboard_string, p, i);
}
else
{
    return string_copy(keyboard_string, p, i);
}
