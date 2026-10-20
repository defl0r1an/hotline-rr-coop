solid = 1;
if (global.done == 1)
{
    exit;
}
if (visible == true)
{
    global.test = 0;
    with (objSubwayDoor)
    {
        if (on == 2 || on == 3)
        {
            global.test = 1;
        }
    }
    if (global.test == 1)
    {
        if (instance_exists(objEnemy) || instance_exists(objKnockedOut) || instance_exists(objBoss) || instance_exists(objESubwayStatic))
        {
            nothing = 1;
        }
        else
        {
            global.done = 1;
        }
    }
}
