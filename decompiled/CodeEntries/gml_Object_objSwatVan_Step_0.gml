if (global.done == 1)
{
    if (spawn == 0)
    {
        my_id = instance_create(248, 120, objSwat);
        my_id.direction = 180;
        my_id.diradd = 1;
        my_id = instance_create(352, 120, objSwat);
        my_id.direction = 0;
        my_id.diradd = -1;
        my_id = instance_create(280, 528, objSwat);
        my_id.direction = 90;
        my_id.diradd = -1;
        my_id = instance_create(336, 528, objSwat);
        my_id.direction = 90;
        my_id.diradd = 1;
        visible = true;
        solid = 1;
        spawn = 1;
        with (objShell)
        {
            deadlined = 1;
        }
        with (objBloodPool)
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
        with (objBloodSquirt)
        {
            deadlined = 1;
        }
        with (objTinyBlood)
        {
            deadlined = 1;
        }
        with (objBloodSplat)
        {
            deadlined = 1;
        }
        with (objBloodSplat2)
        {
            deadlined = 1;
        }
        with (objBloodSmoke)
        {
            deadlined = 1;
        }
        with (objPoliceCarSiren)
        {
            visible = true;
            solid = 1;
        }
        scrCheckpoint();
    }
}
