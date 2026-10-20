if (global.done == 1)
{
    if (objPlayer.y < 288)
    {
        with (objBloodPool)
        {
            deadlined = 1;
        }
        with (objWeapon)
        {
            decadenced = 1;
        }
        with (objBloodSplat)
        {
            deadlined = 1;
        }
        with (objBloodSplat2)
        {
            deadlined = 1;
        }
        with (objBrains)
        {
            deadlined = 1;
        }
        with (objBrains2)
        {
            deadlined = 1;
        }
        with (objBrainChunk2)
        {
            deadlined = 1;
        }
        with (objTinyBlood)
        {
            deadlined = 1;
        }
        with (objBloodSquirt)
        {
            deadlined = 1;
        }
        with (objGuts2)
        {
            deadlined = 1;
        }
        with (objDeadBody)
        {
            deadlined = 1;
        }
        with (objShard)
        {
            deadlined = 1;
        }
        with (objDebris)
        {
            deadlined = 1;
        }
        with (objDoorDebris)
        {
            deadlined = 1;
        }
        with (objShell)
        {
            deadlined = 1;
        }
        with (objBloodDrop)
        {
            deadlined = 1;
        }
        with (objBloodDrop2)
        {
            deadlined = 1;
        }
        if (instance_exists(objBackgroundColor))
        {
            with (objBackgroundColor)
            {
                if (global.hardmode == 0)
                {
                    lifeIgel = 4;
                }
                else
                {
                    lifeIgel = 1;
                }
            }
        }
        global.IgelEmotions = "IgelBlink";
        instance_create(352, -160, objVan);
        if (global.checkpointx == 0)
        {
            global.checkpointx = objPlayer.x;
        }
        if (global.checkpointy == 0)
        {
            global.checkpointy = objPlayer.y;
        }
    }
}
