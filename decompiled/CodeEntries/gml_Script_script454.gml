var acc = "";
var seen_space = 0;
if (argument1)
{
    for (var i = 1; i <= string_length(argument0); i++)
    {
        if (string_ord_at(argument0, i) == 32 && seen_space)
        {
            continue;
        }
        seen_space = 0;
        acc += string_char_at(argument0, i);
        seen_space = string_ord_at(argument0, i) == 32;
    }
    return acc;
}
else
{
    return argument0;
}
