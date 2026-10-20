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
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 280)
    {
        if (!scrCollisionLineExt(x, y, objPlayer.x, objPlayer.y, 3, 309, 99, 131))
        {
            if (sprite_index == sprEMafiaIdlePapper)
            {
                image_index = 1;
                image_speed = 0.5;
                sprite_index = sprEnemyRise;
                my_id = instance_create(x + lengthdir_x(3, direction), y + lengthdir_y(3, direction), objElisMagazines);
                my_id.image_index = 1;
            }
        }
    }
    reload = 30;
}
if (on == 1)
{
    if (sprite_index == sprEMafiaIdlePapper)
    {
        image_index = 1;
        image_speed = 0.5;
        sprite_index = sprEnemyRise;
        my_id = instance_create(x + lengthdir_x(3, direction), y + lengthdir_y(3, direction), objElisMagazines);
        my_id.image_index = 1;
    }
}
