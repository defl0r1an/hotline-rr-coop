if (active && index < 5)
{
    index += 0.2;
}
else if (!active && index > 0)
{
    index -= 0.2;
}
if (instance_exists(objPlayer))
{
    if (objEffector.showammo == 1)
    {
        unarmed = 0;
    }
    else
    {
        unarmed = 1;
    }
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32 && !unarmed)
    {
        active = 1;
    }
    else
    {
        active = 0;
    }
    arrow = 0;
    if (objPlayer.ammo == 0 && !unarmed)
    {
        active = 1;
        arrow = 1;
    }
}
