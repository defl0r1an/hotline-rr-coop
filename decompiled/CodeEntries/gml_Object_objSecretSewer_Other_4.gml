if (!instance_exists(objPlayer))
{
    if (global.done == 1)
    {
        instance_create(580, 528, objPlayerMouse);
    }
}
