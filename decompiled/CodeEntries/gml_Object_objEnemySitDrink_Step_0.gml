if (!instance_exists(objPlayer) || sprite_index == sprEnemyRise)
{
    exit;
}
if (reload > 0)
{
    reload -= 1;
}
else
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 220)
    {
        if (!scrCollisionLineExt(x, y, objPlayer.x, objPlayer.y, 3, 309, 99, 131))
        {
            if (sprite_index == sprEDrinking)
            {
                image_index = 1;
                image_speed = 0.5;
                sprite_index = sprEnemyRise;
                my_id = instance_create(x, y, objWeaponThrow);
                my_id.image_index = 31;
                my_id.speed = 1;
                my_id.direction = image_angle - 90;
            }
        }
    }
    reload = 30;
}
if (on == 1)
{
    if (sprite_index == sprEDrinking)
    {
        image_index = 1;
        image_speed = 0.5;
        sprite_index = sprEnemyRise;
        my_id = instance_create(x, y, objWeaponThrow);
        my_id.image_index = 31;
        my_id.speed = 1;
        my_id.direction = image_angle - 90;
    }
}
