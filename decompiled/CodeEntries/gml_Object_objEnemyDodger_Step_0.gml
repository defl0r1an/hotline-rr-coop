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
if (global.maskindex == 3 && global.hardmode == 1)
{
    instance_create(x, y, objEnemyFat);
    instance_destroy();
}
if (scrIsDodging(sprite_index) == 1)
{
    if (!place_meeting(x, y, objBullet) || !place_meeting(x, y, objWeaponThrow) || !place_meeting(x, y, objThrowingWeapon) || !place_meeting(x, y, objDennisThrowingKnife) || !place_meeting(x, y, objFlame))
    {
        if (image_index < 15)
        {
            image_index += 0.25;
        }
        else
        {
            alert = 1;
            sprite_index = sprEDodgerWalk;
            legindex = 0;
        }
    }
    else if (image_index < 3)
    {
        image_index += 0.5;
    }
    exit;
}
else
{
    if (x < 0)
    {
        hspeed = abs(hspeed);
    }
    if (x > room_width)
    {
        hspeed = -abs(hspeed);
    }
    if (y < 0)
    {
        vspeed = abs(vspeed);
    }
    if (y > room_height)
    {
        vspeed = -abs(vspeed);
    }
    if (sprite_index == sprEWalkUnarmed)
    {
        nothing = 0;
    }
    else
    {
        global.factor += sign(alert);
    }
    scrMoveSolidOn();
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
        if (path_position == 1)
        {
            path_end();
        }
    }
    else if (killed == 0)
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
    scrDodgerStep();
}
