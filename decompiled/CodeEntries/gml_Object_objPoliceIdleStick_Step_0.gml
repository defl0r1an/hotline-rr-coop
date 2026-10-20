if (!instance_exists(objPlayer))
{
    exit;
}
if (global.maskindex == 3 && global.hardmode == 1 && global.maskon == 1)
{
    my_id = instance_create(x, y, objPoliceIdleGuard);
    my_id.sprite_index = sprEPoliceStandGuard9mm;
    my_id.direction = direction;
    instance_destroy();
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
            my_id = instance_create(x, y, objPoliceMelee);
            my_id.sprite_index = sprPoliceWalkNightStick;
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
if (on == 1)
{
    my_id = instance_create(x, y, objPoliceMelee);
    my_id.sprite_index = sprPoliceWalkNightStick;
    my_id.alert = 1;
    my_id.checkreload = 15;
    if (global.enemy == id)
    {
        global.enemy = my_id;
    }
    instance_destroy();
}
