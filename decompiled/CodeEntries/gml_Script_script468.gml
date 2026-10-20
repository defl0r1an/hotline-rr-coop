var j = 0;
var out;
out[j] = "";
for (var i = 1; i <= string_length(argument0); i++)
{
    var c = string_char_at(argument0, i);
    if (c == argument1)
    {
        j++;
        out[j] = "";
    }
    else
    {
        out[j] += c;
    }
}
return out;
