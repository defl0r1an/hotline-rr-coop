var j;
if (argument0 == "mouse")
{
    j = instance_place(mouse_x, mouse_y, all);
    if (j == -4)
    {
        cl_print("Could not find any objects at mouse position", 255);
        return -1010;
    }
}
else if (is_numeric(argument0))
{
    j = instance_id_get(parse_num(argument0));
    if (j == -4)
    {
        cl_print("Could not find object ID " + argument0, 255);
        return -1010;
    }
}
else
{
    j = asset_get_index(argument0);
    if (j > -1 && object_exists(j))
    {
        j = instance_find(j, 0);
        if (j == -4)
        {
            cl_print("Couldn't find any instance of type '" + argument0 + "'", 255);
            return -1010;
        }
    }
    else
    {
        cl_print("Invalid object name '" + argument0 + "'", 255);
        return -1010;
    }
}
return j;
