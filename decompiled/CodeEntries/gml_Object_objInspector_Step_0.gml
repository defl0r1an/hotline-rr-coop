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
if (sprite_index == sprPInspectorDie)
{
    if (hat == 1 && image_index >= 5)
    {
        hat = 0;
        my_id = instance_create(x + lengthdir_x(6, direction - 180), y + lengthdir_y(6, direction - 180), objPoliceHat);
        my_id.direction = direction - 180;
        my_id.speed = 1;
        my_id.sprite_index = sprInspectorHat;
        my_id = instance_create(x + lengthdir_x(6, direction - 180), y + lengthdir_y(6, direction - 180), objWeaponThrow);
        my_id.image_index = 46;
        my_id.direction = direction - 90;
        my_id.speed = 1 + random(1);
    }
    if (place_meeting(x, y, objPlayer) || place_meeting(x + global.spacex, y + global.spacey, objPlayer))
    {
        if (sprite_index == sprPInspectorWalk || sprite_index == sprPInspectorSearch)
        {
            if (objPlayer.sprite_index == sprPAttackChainsaw)
            {
                with (objPlayer)
                {
                    instance_destroy();
                }
                my_id = instance_create(x, y, objPKillChainsawFat);
                my_id.sprite_index = sprPKillChainsawInspector;
                my_id.image_angle = image_angle;
                instance_destroy();
            }
        }
    }
    if (path_index >= 0)
    {
        path_end();
    }
    speed = 0;
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
                if (dennisknife > 0)
                {
                    my_id.sprite_index = sprEInspectorDeadTKnife1;
                }
                else
                {
                    my_id.sprite_index = sprPInspectorDead;
                }
                if (shotgunned == 1)
                {
                    my_id.image_index = floor(random(2));
                }
                else if (dennisknife > 0)
                {
                    my_id.image_index = dennisknife + floor(random(1));
                }
                else
                {
                    my_id.image_index = 3;
                }
                my_id.image_angle = my_id.direction;
                my_id = instance_create(x + lengthdir_x(6, direction - 180), y + lengthdir_y(6, direction - 180), objWeaponThrow);
                my_id.image_index = 46;
                my_id.direction = direction - 90;
                my_id.speed = 1 + random(1);
                my_id = instance_create(x + lengthdir_x(6, direction - 180), y + lengthdir_y(6, direction - 180), objPoliceHat);
                my_id.direction = direction - 180;
                my_id.speed = 1;
                my_id.sprite_index = sprInspectorHat;
                instance_destroy();
            }
            else
            {
                sprite_index = sprPInspectorDie;
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
            global.gunkill += 1;
            global.blink = 1;
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
    scrPInspectorStep();
    scrMoveSolidOff();
    angle = direction;
    if (image_speed >= 0.5)
    {
        if (place_meeting(x + lengthdir_x(16, angle), y + lengthdir_y(16, angle), objPlayer))
        {
            global.my_id = id;
            scrPlayerDieMelee();
            my_x = x + lengthdir_x(16, angle - (35 * image_yscale));
            my_y = y + lengthdir_y(16, angle - (35 * image_yscale));
            i = 0;
            sparks = 10 + floor(random(20));
            repeat (sparks)
            {
                my_id = instance_create(my_x, my_y, objSpark1);
                my_id.direction = (i * 360) / sparks;
                my_id.speed = 1.6 + lengthdir_x(0.2, my_id.direction * sparks * 0.25);
                my_id.image_angle = my_id.direction;
                i += 1;
            }
            repeat (8 + random(8))
            {
                my_id = instance_create(my_x, my_y, objSpark2);
                my_id.direction = random(360);
                my_id.speed = random(0.6);
            }
            instance_create(my_x, my_y, objElectricLight);
            audio_play_sound(sndElectric, 0, false);
        }
    }
}
