if (gettrigger_r(0) > 100 || gettrigger_l(0) > 100)
{
    if (y == 528)
    {
        instance_create(x, y, objPlayerEnterWindow);
        instance_destroy();
    }
}
