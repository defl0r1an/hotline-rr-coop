var clstartx = x;
var clstarty = y;
var cldist = point_distance(argument0, argument1, argument2, argument3);
var cldir = point_direction(argument0, argument1, argument2, argument3);
var repeats;
if (cldist > 0)
{
    repeats = round(cldist / argument4);
}
else
{
    repeats = 0;
}
var claddx = lengthdir_x(argument4, cldir);
var claddy = lengthdir_y(argument4, cldir);
var i = 0;
var test = 0;
while (i < repeats)
{
    x += claddx;
    y += claddy;
    if (place_meeting(x, y, argument5) || place_meeting(x, y, argument6))
    {
        test = 1;
    }
    i += 1;
}
x = clstartx;
y = clstarty;
return test;
