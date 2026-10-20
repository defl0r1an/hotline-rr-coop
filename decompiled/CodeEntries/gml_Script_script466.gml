var len = string_length(argument0);
if (len == 0)
{
    return 0;
}
var i;
if (string_ord_at(argument0, 1) == 48 && len > 1)
{
    switch (string_char_at(argument0, 2))
    {
        case "x":
            for (i = 3; i < len; i++)
            {
                var c = string_ord_at(argument0, i);
                if ((c < 48 || c > 57) && (c < 97 || c > 102))
                {
                    return 0;
                }
            }
            break;
        case "o":
            for (i = 3; i < len; i++)
            {
                var c = string_ord_at(argument0, i);
                if (c < 48 || c > 55)
                {
                    return 0;
                }
            }
            break;
        case "b":
            for (i = 3; i < len; i++)
            {
                var c = string_ord_at(argument0, i);
                if (!(c == 48 || c == 49))
                {
                    return 0;
                }
            }
            break;
        default:
            return 0;
    }
    return 1;
}
var found_decimal = 0;
var initial_digit_index = 1;
if (string_char_at(argument0, 1) == "-")
{
    initial_digit_index = 2;
}
for (i = initial_digit_index; i <= len; i++)
{
    var c = string_ord_at(argument0, i);
    if (c == 46)
    {
        if (found_decimal)
        {
            return 0;
        }
        initial_digit_index = i + 1;
        found_decimal = 1;
    }
    else if (c < 48 || c > 57)
    {
        return 0;
    }
}
return i != initial_digit_index;
