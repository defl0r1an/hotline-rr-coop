if (!switchalpha && instance_exists(objPlayer) && collision_rectangle(xshadow + 7, yshadow + 7, xshadow2, yshadow2, objPlayer, 0, 1))
{
    with (objShadow)
    {
        switchalpha = 1;
    }
}
alpha = lerp(alpha, switchalpha, 0.1);
if (alpha >= 1)
{
    instance_destroy();
}
