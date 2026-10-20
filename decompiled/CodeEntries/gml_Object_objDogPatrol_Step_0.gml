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
if (sprite_index == sprDogSit)
{
    image_speed = 0.15 + randomspeedtail;
    speed = 0;
    if (instance_exists(objPlayer))
    {
        scrDogChaseSearch(objPlayer.x, objPlayer.y, 4);
    }
}
else
{
    global.factor += sign(alert);
    scrMoveSolidOn();
    if (path_index >= 0)
    {
        if (image_speed < 0.3)
        {
            image_speed = 0.3;
        }
        if (path_position == 1)
        {
            path_end();
            if (alert == 3)
            {
                alert = 0;
            }
        }
    }
    else
    {
        image_speed = speed * 0.1;
        if (!place_free(x, y) && alert == 0)
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
    if (speed > 1)
    {
        if (place_meeting(x, y, objPlayer))
        {
            global.my_id = id;
            if (objPlayer.object_index == objPlayerShieldMouse)
            {
                scrPlayerShieldDieDogBite();
            }
            else
            {
                scrPlayerDieDogBite();
            }
            instance_destroy();
        }
    }
    else
    {
        sprite_index = sprDogWalk;
    }
    scrDogStep();
    scrMoveSolidOff();
}
if (global.dog == -1 && object_index == objDogPatrol)
{
    if (instance_number(objDogPatrol) == 0)
    {
        global.dog = 0;
    }
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "Good boy!";
    my_id = instance_create(x, y, objDogPatrolFriend);
    my_id.DirectionFriendDog = direction;
    instance_destroy();
}
