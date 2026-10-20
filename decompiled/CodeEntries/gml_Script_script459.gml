var i = 0;
var str = "";
var mask = argument1;
var bits = log2(argument1);
while (argument0 ^ mask)
{
    var val = (argument0 & mask) >> (bits * i);
    mask *= argument1;
    i++;
    if (val > 9)
    {
        val += 97;
    }
    else
    {
        val += 48;
    }
    str += chr(val);
}
return str;
