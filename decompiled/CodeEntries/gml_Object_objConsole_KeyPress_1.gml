if (console_mode || ds_map_empty(bind_binds))
{
    exit;
}
var i = ds_map_find_first(bind_binds);
while (1)
{
    c_print("Lulz", 255);
    if (i == keyboard_lastkey)
    {
        c_print("bruhz", 16777215);
        keyboard_string = ds_map_find_value(bind_binds, i);
        event_user(1);
        cl_print("!!>> " + keyboard_string, 65535);
        exit;
    }
    if (i == ds_map_find_last(bind_binds))
    {
        break;
    }
    else
    {
        i = ds_map_find_next(bind_binds, i);
        continue;
    }
}
