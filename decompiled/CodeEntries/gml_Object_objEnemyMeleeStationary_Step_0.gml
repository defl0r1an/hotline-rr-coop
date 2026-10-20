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
if (reload > 0)
{
    reload -= 1;
}
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
    if (image_speed < 0.2)
    {
        image_speed = 0.2;
    }
    if (alert == 0 && path_position == 1)
    {
        path_end();
    }
}
else if (image_speed < 1)
{
    image_speed = speed * 0.1;
}
angle = direction;
if (alert == 1)
{
    if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objPlayer) || place_meeting(x, y, objPlayer))
    {
        if (scrIsSearching(sprite_index))
        {
            sprite_index = scrStopSearch(sprite_index);
        }
        sprite_index = scrGetAttack(sprite_index);
        global.my_id = id;
        scrPlayerDieMelee();
        speed = 0;
    }
}
scrEMeleeStationaryStep();
scrMoveSolidOff();
