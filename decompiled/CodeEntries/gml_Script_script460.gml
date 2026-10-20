var res = 0;
var b;
switch (string_copy(argument0, 1, 2))
{
    case "0x":
        i = string_length(argument0);
        while (i > 2)
        {
            var j = string_ord_at(argument0, i);
            if (j < 58 && j > 47)
            {
                j -= 48;
            }
            else
            {
                j -= 87;
            }
            res += (power(16, i - 3) * j);
            i--;
        }
        return res;
    case "0o":
        b = 8;
        break;
    case "0b":
        b = 2;
        break;
    default:
        res = real(argument0);
        return res;
}
var i = string_length(argument0);
while (i > 2)
{
    res += (power(b, i - 3) * (string_ord_at(argument0, i) - 48));
    i--;
}
return res;
