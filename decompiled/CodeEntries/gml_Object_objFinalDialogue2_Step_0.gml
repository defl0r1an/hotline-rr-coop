if (global.xbox == 1)
{
    if (checkbutton(0, getid(5)) || checkbutton(0, getid(11)))
    {
        if (presstart == 0)
        {
            presstart = 1;
            scrXboxEndingDialogue2Start();
        }
    }
    else
    {
        presstart = 0;
    }
}
if (stop == 1)
{
    if (blackx > 0)
    {
        blackx -= 2.5;
    }
    else
    {
        objEffectorHouse.blackx = blackx;
        with (objPlayerBiker)
        {
            my_id = instance_create(x, y, objPlayerBiker);
            if (global.gotbeaten == 1)
            {
                my_id.sprite_index = sprBikerWalkHealed;
            }
            else
            {
                my_id.sprite_index = sprBoss2Walk;
            }
            instance_destroy();
        }
        global.done = 1;
        instance_create(x, y, objLevelComplete);
        instance_destroy();
    }
}
