global.factor += sign(alert);
if (path_index > 0)
{
    if (image_speed < 0.3)
    {
        image_speed = 0.3;
    }
    if (path_position == 1)
    {
        path_end();
        gotowall = 1;
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
if (alert == 0)
{
    sprite_index = sprDogWalk;
    speed = 1;
    friction = 0;
    with (objDoorV)
    {
        solid = 1;
    }
    scrMoveSolidOn();
    if (!place_free(x + lengthdir_x(speed * 8, direction), y + lengthdir_y(speed * 8, direction)))
    {
        gotowall = 0;
        direction -= 10;
        add = -1;
    }
    else if (place_free(x + lengthdir_x(speed * 12, direction + 90), y + lengthdir_y(speed * 12, direction + 90)) && gotowall == 0)
    {
        direction += 10;
        add = 1;
    }
    else if (abs(frac(direction * 0.011111111111111112)) > 0 && gotowall == 0)
    {
        direction += (10 * add);
    }
    with (objDoorV)
    {
        solid = 0;
    }
    scrMoveSolidOff();
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
if (!instance_exists(objPlayer))
{
    if (alert == 1)
    {
        gotowall = 1;
    }
    alert = 0;
    direction = round(direction * 0.1) * 10;
    speed = 1;
    exit;
}
if (checkreload > 0)
{
    checkreload -= 1;
}
else
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 220)
    {
        if (!scrCollisionLineExt(x, y, objPlayer.x, objPlayer.y, 4, 309, 317, 99))
        {
            if (path_index > -21314241)
            {
                path_end();
            }
            if (alert == 0)
            {
                audio_play_sound(sndDogBark, 0, false);
            }
            alert = 1;
        }
        else
        {
            if (alert > 0)
            {
                checkreload = 30;
                scrDogChasePlayer();
            }
            alert = 0;
            direction = round(direction * 0.1) * 10;
        }
    }
    checkreload = 30;
}
friction = 0;
if (alert == 1)
{
    sprite_index = sprDogRun;
    mask = 692;
    image_yscale = 0.5;
    image_angle = direction;
    if (!place_free(x + hspeed, y + vspeed))
    {
        speed = 0;
    }
    mask = 237;
    image_yscale = 1;
    image_angle = 0;
    if (point_distance(x, y, objPlayer.x, objPlayer.y) > 16)
    {
        if (speed < 1)
        {
            speed = 1;
        }
        motion_add(point_direction(x, y, objPlayer.x, objPlayer.y), 0.25);
        friction = 0;
    }
    else
    {
        friction = 0.5;
    }
    if (speed > 4)
    {
        speed = 4;
    }
    direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
    angle = direction;
    if (checkreload > 5)
    {
        checkreload = 5;
    }
}
