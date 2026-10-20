if (!instance_exists(objPlayer))
{
    exit;
}
if (x < 180)
{
    hspeed = abs(hspeed);
}
if (x > 276)
{
    hspeed = -abs(hspeed);
}
if (y > 48)
{
    vspeed = -abs(vspeed);
}
if (y < 8 && speed < 1)
{
    vspeed = abs(vspeed);
}
image_angle = direction;
