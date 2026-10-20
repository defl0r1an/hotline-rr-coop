argument0 = string_lower(argument0);
switch (argument0)
{
    case "true":
        return 1;
    case "on":
        return 1;
    case "false":
        return 0;
    case "off":
        return 0;
    default:
        if (is_numeric(argument0))
        {
            return parse_num(argument0) > 0;
        }
}
