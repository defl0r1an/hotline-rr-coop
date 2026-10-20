if (!instance_exists(objPlayer))
{
    exit;
}
if (reload > 0)
{
    reload -= 1;
}
else if (global.notarget == 0)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 280)
    {
        if (!scrCollisionLineExt(x, y, objPlayer.x, objPlayer.y, 3, 309, 99, 131))
        {
            my_id = instance_create(x, y, objEnemy);
            my_id.alert = 1;
            my_id.checkreload = 15;
            if (global.enemy == id)
            {
                global.enemy = my_id;
            }
            instance_destroy();
        }
    }
    reload = 20;
}
if (global.maskon == 1 && room == rmHouse5Downstairs && global.maskindex == 2 && global.hardmode == 1)
{
    my_id = instance_create(366, 225, objEnemySitDrink);
    my_id.direction = 180;
    my_id.depth = -2;
    my_id = instance_create(545, 338, objEnemyStationary);
    my_id.image_angle = 180;
    instance_destroy();
    exit;
}
