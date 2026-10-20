if (sprite_index == sprBikerGetUpEnd)
{
    my_id = instance_create(x, y, objPlayerBiker);
    my_id.sprite_index = sprBikerWalkWounded;
    if (global.hardmode == 1)
    {
        my_id.myspeed = 1.5;
    }
    instance_destroy();
}
