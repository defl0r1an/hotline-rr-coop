var tur_dir = argument0;
var destdir = argument1;
var turnspeed = argument2;
if (tur_dir > 359)
{
    tur_dir = 0;
}
if (tur_dir < 0)
{
    tur_dir = 359;
}
var dir = destdir - tur_dir;
if (dir > 180)
{
    dir = -(360 - dir);
}
if (dir < -180)
{
    dir = 360 + dir;
}
if (sqrt(sqr(dir)) <= turnspeed)
{
    tur_dir += dir;
}
else
{
    tur_dir += (sign(dir) * turnspeed);
}
return tur_dir;
