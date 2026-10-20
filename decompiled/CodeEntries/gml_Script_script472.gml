if (is_undefined(argument0) || argument_count < 1)
{
    argument0 = "Hello from " + object_get_name(object_index);
}
else if (!is_string(argument0))
{
    argument0 = string(argument0);
}
if (is_undefined(argument1) || argument_count < 2)
{
    argument1 = 16776960;
}
with (objConsole)
{
    cl_print(argument0, argument1);
}
