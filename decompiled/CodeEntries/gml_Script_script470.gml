if (string_length(argument0) < 1)
{
    cl_print("You need to specify key", 255);
    return -1;
}
else if (string_length(argument0) > 1)
{
    argument0 = string_lower(argument0);
    if (string_pos("numpad", argument0) == 1)
    {
        return 96 + real(string_replace(argument0, "numpad", ""));
    }
    else if (string_ord_at(argument0, 1) == 102)
    {
        var i = real(string_replace(argument0, "f", ""));
        if (i > 0 && i < 13)
        {
            return 112 + (i - 1);
        }
        else
        {
            cl_print("Invalid F* key", 255);
            return -1;
        }
    }
    else if (ds_map_exists(bind_spec_keys, argument0))
    {
        return ds_map_find_value(bind_spec_keys, argument0);
    }
    else
    {
        cl_print("Could not find key" + str_brack(argument0), 255);
        return -1;
    }
}
else
{
    return ord(argument0);
}
