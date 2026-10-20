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
if (sprite_index == sprPoliceWalkUnarmed)
{
    nothing = 0;
}
else
{
    global.factor += sign(alert);
}
scrMoveSolidOn();
if (sprite_index == sprPoliceWalkUnarmed)
{
    scrPoliceGetWeapon();
}
if (!place_free(x + (hspeed * 3), y + (vspeed * 3)))
{
    if (!place_free(x + (hspeed * 3), y))
    {
        hspeed = -hspeed;
    }
    if (!place_free(x, y + (vspeed * 3)))
    {
        vspeed = -vspeed;
    }
}
if (path_index > 0)
{
    image_speed = 0.2;
    if (path_position == 1)
    {
        path_end();
    }
}
else
{
    image_speed = speed * 0.1;
}
scrMoveSolidOff();
if (!instance_exists(objPlayer))
{
    alert = 0;
    speed = 0;
    exit;
}
scrPoliceStaticStep();
scrStayAwayFromPlayer();
