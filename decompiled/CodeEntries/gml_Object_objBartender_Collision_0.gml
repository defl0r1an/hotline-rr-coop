if (point_distance(x, y, objPlayerBikerHouse.x, objPlayerBikerHouse.y) < 14)
{
    instance_create(x, y, objBartenderDeath);
    instance_destroy();
    with (objPlayerBikerHouse)
    {
        instance_destroy();
    }
}
