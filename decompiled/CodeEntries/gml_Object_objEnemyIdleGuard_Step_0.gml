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
            my_id = instance_create(x, y, objEnemy);
            if (sprite_index == sprESearchSilencer || sprite_index == sprEMafiaStandGuardSilencer)
            {
                my_id.ammo = 13;
                my_id.sprite_index = sprEWalkSilencer;
            }
            if (sprite_index == sprEStandGuard || sprite_index == sprEMafiaStandGuardM16)
            {
                my_id.ammo = 20;
                my_id.sprite_index = sprEWalkM16;
            }
            if (sprite_index == sprEMafiaStandGuard9mm)
            {
                my_id.ammo = 13;
                my_id.sprite_index = sprEWalk9mm;
            }
            if (sprite_index == sprEMafiaStandGuardDoubleBarrel)
            {
                my_id.ammo = 2;
                my_id.sprite_index = sprEWalkDoubleBarrel;
            }
            if (sprite_index == sprEMafiaStandGuardKalashnikov)
            {
                my_id.ammo = 24;
                my_id.sprite_index = sprEWalkKalashnikov;
            }
            if (sprite_index == sprEMafiaStandGuardScorpion)
            {
                my_id.ammo = 20;
                my_id.sprite_index = sprEWalkScorpion;
            }
            if (sprite_index == sprEMafiaStandGuardShotgun)
            {
                my_id.ammo = 6;
                my_id.sprite_index = sprEWalkShotgun;
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
    my_id = instance_create(x, y, objEnemy);
    if (sprite_index == sprESearchSilencer || sprite_index == sprEMafiaStandGuardSilencer)
    {
        my_id.ammo = 13;
        my_id.sprite_index = sprEWalkSilencer;
    }
    if (sprite_index == sprEStandGuard || sprite_index == sprEMafiaStandGuardM16)
    {
        my_id.ammo = 20;
        my_id.sprite_index = sprEWalkM16;
    }
    if (sprite_index == sprEMafiaStandGuard9mm)
    {
        my_id.ammo = 13;
        my_id.sprite_index = sprEWalk9mm;
    }
    if (sprite_index == sprEMafiaStandGuardDoubleBarrel)
    {
        my_id.ammo = 2;
        my_id.sprite_index = sprEWalkDoubleBarrel;
    }
    if (sprite_index == sprEMafiaStandGuardKalashnikov)
    {
        my_id.ammo = 24;
        my_id.sprite_index = sprEWalkKalashnikov;
    }
    if (sprite_index == sprEMafiaStandGuardScorpion)
    {
        my_id.ammo = 20;
        my_id.sprite_index = sprEWalkScorpion;
    }
    if (sprite_index == sprEMafiaStandGuardShotgun)
    {
        my_id.ammo = 6;
        my_id.sprite_index = sprEWalkShotgun;
    }
    my_id.alert = 1;
    my_id.checkreload = 15;
    if (global.enemy == id)
    {
        global.enemy = my_id;
    }
    instance_destroy();
}
