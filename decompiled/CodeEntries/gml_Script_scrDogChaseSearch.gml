if (sprite_index == sprDogSit)
{
    global.check = scrLook(argument0, argument1, argument2);
    if (global.check == 0)
    {
        _diff = angle_difference(point_direction(x, y, argument0, argument1), direction);
        NearFriendDog = 1;
    }
    else
    {
        _diff = angle_difference(DirectionFriendDog, direction);
        NearFriendDog = 0;
        if (object_index == objDogPatrol && direction >= DirectionFriendDog)
        {
            sprite_index = sprDogWalk;
        }
    }
    direction += (_diff * 0.1);
}
else if (checkreload > 0)
{
    checkreload -= 1;
}
else
{
    global.check = scrLook(argument0, argument1, argument2);
    if (global.check == 0)
    {
        path_end();
        alert = 1;
        speed = 2;
        direction = point_direction(x, y, argument0, argument1);
    }
    if (global.check < 2 && global.check > 0)
    {
        if (path_index >= 0)
        {
            nothing = 1;
        }
        else
        {
            alert = 0;
            direction = round(direction * 0.1) * 10;
            speed = 1;
        }
    }
    if (path_position == 1)
    {
        path_end();
        alert = 0;
        findwall = 1;
        direction = round(direction * 0.1) * 10;
        image_index = 0;
        image_speed = 0.2;
    }
    if (global.check == 2)
    {
        scrDogChase(path, objPlayer.x, objPlayer.y);
        alert = 3;
    }
    checkreload = 20;
}
