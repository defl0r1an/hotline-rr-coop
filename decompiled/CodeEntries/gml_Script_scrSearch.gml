if (checkreload > 0)
{
    checkreload -= 1;
}
else
{
    if (global.maskindex == 18)
    {
        dist = 100;
    }
    else
    {
        dist = 280;
    }
    if (point_distance(x, y, argument0, argument1) < dist || path_index >= 0 || speed > 0)
    {
        global.check = scrLook(argument0, argument1, argument2);
    }
    else
    {
        global.check = 1;
    }
    if (global.check == 0)
    {
        if (alert == 0 && alertwait == -1)
        {
            alertwait = 15;
        }
        if (alert == 2 || alert == 3)
        {
            alert = 1;
        }
    }
    if (global.check == 2)
    {
        path_end();
        alert = 2;
    }
    if (global.check > 0 && global.check < 2)
    {
        if (alert > 0)
        {
            alert = 3;
            scrChase(path, argument0, argument1);
        }
        else
        {
            alert = 0;
        }
    }
    checkreload = global.limitreload;
}
