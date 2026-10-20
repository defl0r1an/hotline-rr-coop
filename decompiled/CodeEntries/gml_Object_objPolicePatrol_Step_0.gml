if (global.deadIgel == 1)
{
    if (instance_exists(objPlayer))
    {
        _diff = angle_difference(point_direction(x, y, objPlayer.x, objPlayer.y), direction);
        direction += (_diff * 0.1);
    }
    image_index = 0;
    speed = 0;
    exit;
}
scrMoveSolidOn();
if (sprite_index == sprPoliceWalkUnarmed)
{
    nothing = 0;
}
else
{
    global.factor += sign(alert);
}
if (path_index > 0)
{
    image_speed = 0.1;
    if (path_position == 1)
    {
        path_end();
        direction = round(direction * 0.1) * 10;
    }
}
else
{
    if (image_speed < 1)
    {
        image_speed = speed * 0.1;
    }
    if (!place_free(x, y))
    {
        tempdir = direction;
        for (i = 1; !place_free(x + lengthdir_x(4 + (i / 20), tempdir), y + lengthdir_y(4 + (i / 20), tempdir)) && i < 100; i += 1)
        {
            tempdir += 18;
        }
        if (i < 100)
        {
            move_outside_solid(tempdir, 4 + (i / 20));
        }
    }
}
scrPolicePatrolStep();
scrMoveSolidOff();
if (!instance_exists(objPlayer))
{
    alert = 0;
    direction = round(direction * 0.1) * 10;
    exit;
}
scrStayAwayFromPlayer();
