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
            if (room == rmTrainstationEntrance || room == rmBossClubFloor3)
            {
                if (global.maskindex == 3 && global.hardmode == 1)
                {
                    my_id = instance_create(x, y, choose(objEnemy, objEnemyStationary));
                }
                else
                {
                    my_id = instance_create(x, y, objEnemyMeleeStationary);
                }
            }
            else if (global.maskindex == 3 && global.hardmode == 1)
            {
                my_id = instance_create(x, y, choose(objEnemy, objEnemyStationary));
            }
            else
            {
                my_id = instance_create(x, y, choose(objEnemy, objEnemyMeleeStationary));
            }
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
