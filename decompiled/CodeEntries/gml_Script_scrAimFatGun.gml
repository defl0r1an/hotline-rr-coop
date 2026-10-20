if (ammo > 0)
{
    dist = point_distance(x, y, argument0, argument1);
    if (dist > 280)
    {
        scrChase(path, objPlayer.x, objPlayer.y);
    }
    else
    {
        if (dist > 80)
        {
            angle = point_direction(x, y, objPlayer.x, objPlayer.y);
        }
        else
        {
            angle = scrRotate(angle, point_direction(x, y, argument0, argument1), 10);
        }
        if (reload > 0)
        {
            reload -= 1;
        }
        else
        {
            if (scrIsSearching(sprite_index))
            {
                sprite_index = scrStopSearch(sprite_index);
            }
            scrEnemyShoot();
        }
        scrChargeSearch(objPlayer.x, objPlayer.y, 4);
    }
}
if (argument_count > 3)
{
    test = argument2 + argument3;
}
