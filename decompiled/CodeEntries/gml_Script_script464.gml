var b = string_split(argument0, ";");
for (var i = 0; i < array_length_1d(b); i++)
{
    if (is_numeric(b[i]))
    {
        b[i] = real(b[i]);
    }
}
return b;
