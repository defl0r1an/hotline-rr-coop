if (place_meeting(x, y, objBloodPool))
{
    bloodsled = 1;
}
if (bloodstep > 0)
{
    bloodstep -= 1;
}
else if (bloodsled > 0)
{
    my_id = instance_create(x, y, objLegSled);
    my_id.image_speed = 0;
    my_id.sprite_index = sprLegSleds;
    if (bloodscale == 1)
    {
        my_id.image_index = 0;
    }
    else
    {
        my_id.image_index = 1;
    }
    my_id.image_angle = direction;
    my_id.image_alpha = bloodsled;
    bloodsled -= random_range(0.05, 0.1);
    bloodstep = 10;
    bloodscale = -bloodscale;
}
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
if (sprite_index == sprEWalkUnarmed)
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
scrEPatrolStep();
scrMoveSolidOff();
if (!instance_exists(objPlayer))
{
    alert = 0;
    direction = round(direction * 0.1) * 10;
    exit;
}
scrStayAwayFromPlayer();
if (sprite_index == sprEWalk9mm && ammoget == 0)
{
    ammo = 13;
    ammoget = 1;
}
if (sprite_index == sprEWalkScorpion && ammoget == 0)
{
    ammo = 20;
    ammoget = 1;
}
