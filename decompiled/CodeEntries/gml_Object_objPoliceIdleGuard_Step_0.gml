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
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 220)
    {
        if (!scrCollisionLineExt(x, y, objPlayer.x, objPlayer.y, 3, 309, 99, 131))
        {
            my_id = instance_create(x, y, objPolice);
            if (sprite_index == sprEPoliceStandGuardM16)
            {
                my_id.ammo = 20;
                my_id.sprite_index = sprPoliceWalkM16;
            }
            if (sprite_index == sprEPoliceStandGuard9mm)
            {
                my_id.ammo = 13;
                my_id.sprite_index = sprPoliceWalkGun;
            }
            if (sprite_index == sprEPoliceStandGuardShotgun)
            {
                my_id.ammo = 6;
                my_id.sprite_index = sprPoliceWalkShotgun;
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
    reload = 15;
}
if (on == 1)
{
    my_id = instance_create(x, y, objPolice);
    if (sprite_index == sprEPoliceStandGuardM16)
    {
        my_id.ammo = 20;
        my_id.sprite_index = sprPoliceWalkM16;
    }
    if (sprite_index == sprEPoliceStandGuard9mm)
    {
        my_id.ammo = 13;
        my_id.sprite_index = sprPoliceWalkGun;
    }
    if (sprite_index == sprEPoliceStandGuardShotgun)
    {
        my_id.ammo = 6;
        my_id.sprite_index = sprPoliceWalkShotgun;
    }
    my_id.alert = 1;
    my_id.checkreload = 15;
    if (global.enemy == id)
    {
        global.enemy = my_id;
    }
    instance_destroy();
}
