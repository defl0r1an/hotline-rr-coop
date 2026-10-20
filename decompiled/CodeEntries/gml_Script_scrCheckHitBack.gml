var bodydir = argument0 - 180;
var bulletdir = argument1;
if (bodydir < 0)
{
    bodydir += 360;
}
var check = 0;
if (bodydir < 60)
{
    if (bulletdir > (bodydir + 60) && (bulletdir - 360) < (bodydir - 60))
    {
        check = 1;
    }
}
else if (bodydir > 300)
{
    if (bulletdir < (bodydir - 60) && (bulletdir + 360) > (bodydir + 60))
    {
        check = 1;
    }
}
else if (bulletdir < (bodydir - 60) || bulletdir > (bodydir + 60))
{
    check = 1;
}
return check;
