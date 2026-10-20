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
if (global.maskindex == 3)
{
    instance_create(x, y, objEFatGunner);
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
            sprite_index = sprEDodgerGunWalk;
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
    if (ammo == 0)
    {
        sprite_index = sprEDodgerGReload;
        image_speed = 0.2;
    }
    if (sprite_index == sprEDodgerGReload)
    {
        if (image_index >= 3 && !clip)
        {
            my_id = instance_create(x + lengthdir_x(13, angle - 4) + lengthdir_x(5, angle - 90), y + lengthdir_y(13, angle - 4) + lengthdir_y(5, angle - 90), objClip);
            my_id.image_index = 3;
            my_id.sprite_index = sprUnarmedClips;
            my_id.image_angle = image_angle - 90;
            my_id.speed = random(1);
            my_id.direction = angle + 90 + random_range(-10, 10);
            my_id = instance_create(x + lengthdir_x(13, angle - 4) + lengthdir_x(-5, angle - 90), y + lengthdir_y(13, angle - 4) + lengthdir_y(-5, angle - 90), objClip);
            my_id.image_index = 3;
            my_id.sprite_index = sprUnarmedClips;
            my_id.image_angle = image_angle + 90;
            my_id.speed = random(1);
            my_id.direction = (angle - 90) + random_range(-10, 10);
            clip = 1;
        }
    }
    if (sprite_index == sprESwatStumble)
    {
        legindex = 0;
        if (image_index < 5)
        {
            image_index += 0.25;
        }
        else
        {
            sprite_index = sprEDodgerGunWalk;
            image_index = 0;
        }
        exit;
    }
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
    else if (killed == 0 && sprite_index != sprEDodgerGunAttackRight && sprite_index != sprEDodgerGunAttackLeft && sprite_index != sprEDodgerGReload)
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
    if (sprite_index != sprEDodgerGunDodge)
    {
        scrDodgerGPatrolStep();
    }
    if (path_index >= 0 && sprite_index != sprEDodgerGunAttackRight && sprite_index != sprEDodgerGunAttackLeft && sprite_index != sprEDodgerGReload)
    {
        image_speed = path_speed * 0.1;
    }
    else if (sprite_index != sprEDodgerGunAttackRight && sprite_index != sprEDodgerGunAttackLeft && sprite_index != sprEDodgerGReload)
    {
        image_speed = speed * 0.1;
    }
}
