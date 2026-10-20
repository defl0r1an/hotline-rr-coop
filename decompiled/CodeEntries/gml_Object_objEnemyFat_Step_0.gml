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
if (sprite_index == sprEFatDie)
{
    if (path_index > 0)
    {
        path_end();
    }
    exit;
}
scrMoveSolidOn();
if (hits > 0)
{
    if (wait > 0)
    {
        wait -= 1;
        exit;
    }
    else
    {
        wait = 4 - hits;
        blood -= (1 + (hits * 0.25));
        if (round(random(4)) == 2)
        {
            instance_create((x - 8) + random(16), (y - 8) + random(16), objBloodSplat);
        }
        if (blood <= 0 || hits > 6)
        {
            if (speed > 0)
            {
                my_id = instance_create(x, y, objDeadBody);
                my_id.direction = direction - 180;
                my_id.speed = speed;
                if (dennisknife > 0 || knife > 0)
                {
                    my_id.sprite_index = sprEFatDeadTKnife;
                    if (knife > 0)
                    {
                        my_id.sprite_index = sprEMafiaFatDeadKnifeBiker;
                    }
                }
                else
                {
                    my_id.sprite_index = sprEFatDead;
                }
                if (shotgunned == 1)
                {
                    my_id.image_index = floor(random(2));
                }
                else if (melee == 1)
                {
                    my_id.image_index = 1;
                }
                else if (dennisknife > 0 || knife > 0)
                {
                    my_id.image_index = dennisknife + knife + floor(random(1));
                }
                else
                {
                    my_id.image_index = 2 + floor(random(2));
                }
                my_id.image_angle = my_id.direction;
                instance_destroy();
                exit;
            }
            else
            {
                sprite_index = sprEFatDie;
                image_index = 1;
                image_speed = 0.15;
                speed = 0;
                if (global.enemy == id)
                {
                    global.enemy = -1234;
                }
            }
            my_id = instance_create(x, y - 12, objScore);
            my_id.text = "+" + string((500 + (hits * 20) + 150) * global.factor) + "pts";
            global.myscore += ((500 + (hits * 20) + 150) * global.factor);
            global.killscore += (500 + (hits * 20));
            global.boldscore += 150;
            global.combo += 1;
            global.combotime = 240;
            global.killx[global.kills] = x;
            global.killy[global.kills] = y;
            global.kills += 1;
            global.blink = 1;
            global.gunkill += 1;
            if (global.bonustime < (12 + (global.factor * 4)))
            {
                global.bonustime = 12 + (global.factor * 4);
            }
            if (global.factor == 2)
            {
                ds_list_add(global.bonuslist, "Exposure");
            }
            if (global.factor == 3)
            {
                ds_list_add(global.bonuslist, "Double Exposure");
            }
            if (global.factor == 4)
            {
                ds_list_add(global.bonuslist, "Triple Exposure");
            }
            if (global.factor > 4)
            {
                ds_list_add(global.bonuslist, "Severe Exposure");
            }
            scrMoveSolidOff();
            exit;
        }
    }
}
if (reload > 0)
{
    reload -= 1;
}
if (path_index > 0)
{
    if (image_speed < 1)
    {
        image_speed = 0.2;
    }
    if (alert == 0 && path_position == 1)
    {
        path_end();
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
scrEFatStep();
scrMoveSolidOff();
angle = direction;
if (image_speed >= 0.5)
{
    if (place_meeting(x + lengthdir_x(16, angle), y + lengthdir_y(16, angle), objPlayer))
    {
        if (scrIsSearching(sprite_index))
        {
            scrStopSearch(sprite_index);
        }
        global.my_id = id;
        scrPlayerDieMelee();
    }
}
