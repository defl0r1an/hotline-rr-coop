var val;
if (array_length_1d(argument1) > 2)
{
    val = parse_bool(argument1[2]);
}
else if (ds_map_exists(scmd_states, argument0))
{
    val = !ds_map_find_value(scmd_states, argument0);
}
else
{
    val = 1;
}
if (val)
{
    cl_print(argument0 + " ON", 65535);
}
else
{
    cl_print(argument0 + " OFF", 65535);
}
ds_map_replace(scmd_states, argument0, val);
return val;
