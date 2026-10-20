player_exists = instance_exists(objPlayer);
player_x = 0;
player_y = 0;
holyshitihatethis = 1;
if (player_exists)
{
    player_x = objPlayer.x;
    player_y = objPlayer.y;
    holyshitihatethis = scrLook(player_x, player_y, 4);
}
alert = holyshitihatethis;
if ((alert == 0 || alert == 2) && ammo > 0)
{
    if (player_exists)
    {
        dir = scrRotate(dir, point_direction(x, y, player_x, player_y), 10);
    }
    if (image_index < 3)
    {
        image_index += 0.25;
    }
    else
    {
        state = 1;
        shooting = 1;
    }
}
else
{
    shooting = 0;
    if (state == 1)
    {
        state = 3;
        image_index = 3;
    }
    reload = 15;
    if (image_index > 0 && sprite_index != sprEHidingReloadM16)
    {
        image_index -= 0.25;
    }
    if (ammo <= 0)
    {
        alert = 1;
        if (image_index == 0)
        {
            durak = instance_create(x, y, objEnemyMelee);
            durak.alert = 2;
            durak2 = instance_create(x, y, objWeapon);
            switch (sprite_index)
            {
                case sprEMafiaAmbush9mm:
                    durak2.image_index = 28;
                    break;
                case sprEMafiaAmbushSilencer:
                    durak2.image_index = 7;
                    break;
                case sprEMafiaAmbushScorpion:
                    durak2.image_index = 11;
                    break;
            }
            durak2.ammo = ammo;
            with (instance_nearest(x, y, instance_exists(objEAmbushTrigger)))
            {
                touch = 0;
            }
            instance_destroy();
        }
        if (sprite_index == sprEHidingReloadM16)
        {
            image_speed = 0.25;
        }
    }
}
if (shooting == 1)
{
    scrEnemyAmbushShoot();
}
aim_offset = abs(angle_difference(dir, direction));
if (aim_offset > 24)
{
    durak = instance_create(x, y, objEnemy);
    durak.alert = 2;
    switch (sprite_index)
    {
        case sprEMafiaAmbush9mm:
            durak.sprite_index = sprEWalk9mm;
            break;
        case sprEMafiaAmbushSilencer:
            durak.sprite_index = sprEWalkSilencer;
            break;
        case sprEMafiaAmbushScorpion:
            durak.sprite_index = sprEWalkScorpion;
            break;
    }
    durak.ammo = ammo;
    with (instance_nearest(x, y, instance_exists(objEAmbushTrigger)))
    {
        touch = 0;
    }
    instance_destroy();
}
