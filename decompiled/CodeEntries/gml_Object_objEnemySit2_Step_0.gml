if (!instance_exists(objPlayer) || sprite_index == sprEnemyRise)
{
    exit;
}
direction = image_angle;
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
            image_speed = 0.5;
        }
    }
    reload = 30;
}
if (on == 1)
{
    image_speed = 0.5;
}
