if (!instance_exists(objPlayer))
{
    my_id = instance_create(288, 400, objPlayerBikerHouse);
    if (global.gotbeaten == 1)
    {
        my_id.sprite_index = sprBikerWalkHealed;
    }
    else
    {
        my_id.sprite_index = sprBoss2Walk;
    }
}
