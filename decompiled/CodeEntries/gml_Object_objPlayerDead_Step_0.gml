if (keyboard_check_pressed(ord(global.restartkey)))
{
    event_perform(ev_keypress, ord("R"));
}
scrMoveSolidOn();
if (!place_free(x, y))
{
    speed = 0;
}
scrMoveSolidOff();
if (sprite_index == sprPJacketHeadBlow && image_index > 14 && sound == 0)
{
    audio_play_sound(sndBulletHit2, 0, false);
    sound = 1;
}
if (sprite_index == sprPJacketHeadBlow && image_index >= 22 && !explode)
{
    i = 0;
    repeat (8)
    {
        tempid = instance_create(x, y, objBrainChunk2);
        tempid.speed = 1.5 + random(2.2);
        tempid.direction = direction + i + random_range(-35, 35);
        tempid.image_angle = tempid.direction;
        i += 45;
    }
    i = 0;
    repeat (3)
    {
        tempid = instance_create(x, y, objSkinPiece2);
        tempid.speed = 2.4 + random(1.2);
        tempid.direction = direction + i + random_range(-35, 35);
        tempid.image_angle = tempid.direction;
        tempid.image_index = random(4);
        i += 80;
    }
    i = 0;
    repeat (2)
    {
        tempid = instance_create(x, y, objSkinPiece2);
        tempid.sprite_index = sprHeadPieces;
        tempid.image_index = random(6);
        tempid.speed = 2.4 + random(1.2);
        tempid.direction = direction + i + random_range(-35, 35);
        tempid.image_angle = tempid.direction;
        tempid.image_index = random(4);
        i += 160;
    }
    i = 0;
    repeat (8)
    {
        tempid = instance_create(x, y, objBloodSmoke);
        tempid.speed = 2.4 + random(1.2);
        tempid.direction = direction + i + random_range(-35, 35);
        tempid.image_angle = tempid.direction;
        tempid.image_index = random(4);
        i += 80;
    }
    repeat (8)
    {
        my_id = instance_create((x - 3) + random(6), y - 3, objBloodSmoke);
        my_id.image_xscale = 1.2 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = (direction - 20) + random(40);
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.15;
        my_id = instance_create((x - 3) + random(6), (y - 3) + random(6), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x, y, my_id.x, my_id.y);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1 + random(5);
    }
    i = 0;
    repeat (4)
    {
        tempid = instance_create(x, y, objBloodSquirt);
        tempid.speed = 2.4 + random(1.2);
        tempid.direction = direction + i + random_range(-35, 35);
        tempid.image_angle = tempid.direction;
        tempid.image_index = random(4);
        i += 80;
    }
    audio_play_sound(sndHeadshot, 0, false);
    explode = 1;
}
if (sprite_index == sprPJacketHeadBlow && image_index > 25 && explode == 1)
{
    direction = image_angle - 180;
    speed = 1.35 + random(0.15);
    friction = 0.1;
    audio_play_sound(sndBodyFall1, 0, false);
    explode = 2;
}
if (speed == 0 && bled == 0)
{
    bled = 1;
    length = random(24);
    if (sprite_index == sprEBackBlunt && global.maskindex != 19)
    {
        repeat (1 + random(2))
        {
            my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 2) + random(4), ((y + lengthdir_y(24, image_angle)) - 2) + random(4), objBloodPool);
        }
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.surface = 1;
        }
        if (my_id.surface == 1 && instance_exists(objVan))
        {
            surfaced = 0;
        }
    }
    if (sprite_index == sprEBackCut && global.maskindex != 19)
    {
        repeat (1 + random(2))
        {
            my_id = instance_create(((x + lengthdir_x(6, image_angle)) - 2) + random(4), ((y + lengthdir_y(6, image_angle)) - 2) + random(4), objBloodPool);
        }
        if (surface == 1)
        {
            my_id.surface = 1;
        }
        if (my_id.surface == 1 && instance_exists(objVan))
        {
            surface = 0;
        }
    }
    if ((sprite_index == sprPBackShotgun || sprite_index == sprPBackCar) && global.maskindex != 19)
    {
        repeat (2 + random(2))
        {
            my_id = instance_create(((x + lengthdir_x(length, image_angle)) - 2) + random(4), ((y + lengthdir_y(length, image_angle)) - 2) + random(4), objBloodPool);
        }
        if (surface == 1)
        {
            my_id.surface = 1;
        }
        if (my_id.surface == 1 && instance_exists(objVan))
        {
            surface = 0;
        }
    }
    if (sprite_index == sprPBackMachinegun && global.maskindex != 19)
    {
        repeat (2 + random(2))
        {
            my_id = instance_create(((x + lengthdir_x(length, image_angle)) - 2) + random(4), ((y + lengthdir_y(length, image_angle)) - 2) + random(4), objBloodPool);
        }
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.surface = 1;
        }
        if (my_id.surface == 1 && instance_exists(objVan))
        {
            surface = 0;
        }
    }
    if (sprite_index == sprPBackEaten || sprite_index == sprGriffinDeadDog)
    {
        repeat (2 + random(3))
        {
            dir = image_angle + (image_yscale * 12);
            my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
            my_id.image_angle = random(360);
        }
    }
    if (sprite_index == sprEBackBlunt)
    {
        if (image_index == 6 || image_angle == 13)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 2) + random(4);
                my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt);
                my_id.image_angle = (dir - 35) + random(70);
                if (room == rmTrainstationEntrance && objTrain.visible == true)
                {
                    my_id.surface = 1;
                }
                if (room == rmHouse1Downstairs && instance_exists(objBoss1))
                {
                    my_id.surface = 1;
                }
            }
        }
        if (image_index == 14)
        {
            repeat (2 + random(3))
            {
                dir = image_angle + ((2 + random(4)) * image_yscale);
                my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt);
                my_id.image_angle = dir - random(50);
                if (room == rmTrainstationEntrance && objTrain.visible == true)
                {
                    my_id.surface = 1;
                }
                if (room == rmHouse1Downstairs && instance_exists(objBoss1) && objPlayerMouse.decadenced == 1)
                {
                    my_id.surface = 1;
                }
            }
        }
        if (image_index == 12)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 2) + random(4);
                my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt);
                my_id.image_angle = (dir - 70) + random(140);
                if (room == rmTrainstationEntrance && objTrain.visible == true)
                {
                    my_id.surface = 1;
                }
                if (room == rmHouse1Downstairs && instance_exists(objBoss1) && objPlayerMouse.decadenced == 1)
                {
                    my_id.surface = 1;
                }
            }
        }
    }
    if (sprite_index == sprPBackShotgun)
    {
        if (image_index == 2)
        {
            repeat (2 + random(3))
            {
                dir = image_angle + (image_yscale * 12);
                my_id = instance_create(x + lengthdir_x(15, dir), y + lengthdir_y(15, dir), objBloodSquirt);
                if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
                {
                    my_id.surface = 1;
                }
                my_id.image_angle = ((image_angle + (90 * image_yscale)) - 20) + random(60);
            }
        }
        if (image_index == 3)
        {
            repeat (2 + random(3))
            {
                dir = (image_angle - 2) + random(4);
                my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
                my_id.image_angle = (dir - 30) + random(60);
                if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
                {
                    my_id.surface = 1;
                }
                if (room == rmTrainstationEntrance && objTrain.visible == true)
                {
                    my_id.surface = 1;
                }
                if (my_id.surface == 1 && instance_exists(objVan))
                {
                    surface = 0;
                }
            }
        }
    }
    if (sprite_index == sprEBackCut)
    {
        if (image_index == 2)
        {
            repeat (2 + random(3))
            {
                dir = image_angle + (image_yscale * 12);
                my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
                my_id.image_angle = random(360);
                if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
                {
                    my_id.surface = 1;
                }
                if (room == rmTrainstationEntrance && objTrain.visible == true)
                {
                    my_id.surface = 1;
                }
                if (my_id.surface == 1 && instance_exists(objVan))
                {
                    surface = 0;
                }
            }
        }
    }
}
if (room == rmSequence12c)
{
    nothing = 1;
}
else if (global.maskindex != 7 && !instance_exists(objSeveredHeadPlayer) && !instance_exists(objBodyPartPlayer) && !instance_exists(objMaskOwlDrop))
{
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
    viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
    view_angle[0] = lengthdir_y(vdist * 0.01, vdir * 2);
    global.chargeSkippy = lerp(global.chargeSkippy, 0, 0.025);
    if (global.zoomdeaths == 1)
    {
        global.zoomwview = lerp(global.zoomwview, global.wview / 4, 0.15);
        global.zoomhview = lerp(global.zoomhview, global.hview / 4, 0.15);
    }
    if (endtransition == 0)
    {
        view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.05);
        view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.05);
    }
    else
    {
        view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.25);
        view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.25);
    }
    scrHardMode();
}
