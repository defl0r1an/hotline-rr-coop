global.my_id = id;
global.test = 0;
if (!instance_exists(objPlayer))
{
    speed = 0;
    exit;
}
scrMoveSolidOn();
if (instance_exists(objPlayer))
{
    if (checkreload > 0)
    {
        checkreload -= 1;
    }
    else
    {
        checkreload = 5;
        global.check = scrLook(objPlayer.x, objPlayer.y, 4);
        if (global.check == 0 || global.check == 2)
        {
            alert = 1;
            speed = 0;
        }
        else
        {
            alert = 0;
        }
    }
    if (alert == 1 && collision_circle(x, y, 160, objPlayer, 0, 1))
    {
        direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 6);
        if (collision_circle(x, y, 90, objPlayer, 0, 1))
        {
            speed = 0;
            image_speed = 0;
            dist = point_distance(x, y, objPlayer.x, objPlayer.y);
            if (dist < 64)
            {
                dir = point_direction(objPlayer.x, objPlayer.y, x, y);
                direction = dir - 180;
                if (place_free(x + lengthdir_x(1, dir), y) && !scrMeetDoor(x + lengthdir_x(1, dir), y))
                {
                    x += lengthdir_x(1, dir);
                }
                if (place_free(x, y + lengthdir_y(1, dir)) && !scrMeetDoor(x, y + lengthdir_y(1, dir)))
                {
                    y += lengthdir_y(1, dir);
                }
                image_speed = 0.1;
            }
        }
    }
}
scrMoveSolidOff();
with (objPlayer)
{
    if (scrIsAttacking(sprite_index) && sprite_index != sprPAttackPunch && sprite_index != sprPAttackDrill)
    {
        if (place_meeting(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), global.my_id))
        {
            global.test = 1;
        }
    }
    if (sprite_index == sprPAttackPunch || sprite_index == sprPAttackDrill || sprite_index == sprPPushing)
    {
        if (place_meeting(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), global.my_id))
        {
            global.test = 4;
        }
    }
    if (sprite_index == sprPAttackTaser)
    {
        if (place_meeting(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), global.my_id))
        {
            global.test = 3;
        }
    }
    if (sprite_index == sprPAttackSword || sprite_index == sprPAttackButterfly || sprite_index == sprPAttackKnife || sprite_index == sprPAttackChainsaw || sprite_index == sprPSprintChainsaw)
    {
        if (place_meeting(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), global.my_id))
        {
            global.test = 2;
        }
    }
    if (sprite_index == sprPJacketAttackKnuckles || (sprite_index == sprPAttackPunch && global.maskindex == 27))
    {
        if (place_meeting(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), global.my_id))
        {
            global.test = 1;
        }
    }
}
if (global.test > 0)
{
    if (global.test == 1 || global.test == 2)
    {
        pdir = point_direction(objPlayer.x, objPlayer.y, x, y);
        repeat (8)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.sprite_index = sprBloodSplatSmall;
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(4);
        }
        repeat (2 + random(3))
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = 1 + random(5);
        }
        repeat (4)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, pdir), (y - 3) + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = (pdir - 20) + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
        }
        my_id = instance_create(x, y, objDeadBody);
        my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y);
        my_id.speed = 2;
        my_id.sprite_index = sprESubwayDead;
        if (global.test == 1)
        {
            my_id.image_index = floor(random(2));
        }
        else
        {
            audio_play_sound(choose(sndCut1, sndCut2), 0, false);
            my_id.image_index = 2 + round(random(1));
        }
        my_id.image_angle = my_id.direction;
        my_id = instance_create(x + lengthdir_x(6, direction - 180), y + lengthdir_y(6, direction - 180), objPoliceHat);
        my_id.direction = direction - 180;
        my_id.speed = 1;
        my_id.sprite_index = sprInspectorHat;
        audio_play_sound(sndPunch, 0, false);
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndBonesBreak, 0, false);
    }
    if (global.test == 3)
    {
        my_id = instance_create(x, y, objDeadBody);
        my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y);
        my_id.speed = 2;
        my_id.sprite_index = sprESubwayDeadTaser;
        my_id.image_speed = 0.25;
        my_x = x + lengthdir_x(16, my_id.direction - (35 * objPlayer.image_yscale));
        my_y = y + lengthdir_y(16, my_id.direction - (35 * objPlayer.image_yscale));
        my_id.life = 240 + random(60);
        i = 0;
        sparks = 10 + floor(random(20));
        repeat (sparks)
        {
            my_id1 = instance_create(my_x, my_y, objSpark1);
            my_id1.direction = (i * 360) / sparks;
            my_id1.speed = 1.6 + lengthdir_x(0.2, my_id1.direction * sparks * 0.25);
            my_id1.image_angle = my_id1.direction;
            i += 1;
        }
        repeat (8 + random(8))
        {
            my_id1 = instance_create(my_x, my_y, objSpark2);
            my_id1.direction = random(360);
            my_id1.speed = random(0.6);
        }
        instance_create(my_x, my_y, objElectricLight);
        my_id.image_angle = my_id.direction;
        my_id = instance_create(x + lengthdir_x(6, direction - 180), y + lengthdir_y(6, direction - 180), objPoliceHat);
        my_id.direction = direction - 180;
        my_id.speed = 1;
        my_id.sprite_index = sprInspectorHat;
        audio_play_sound(sndElectric, 0, false);
    }
    if (global.test == 4)
    {
        my_id = instance_create(x, y, objSubwayKnockedOut);
        my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y);
        my_id.speed = 2;
        my_id.angle = my_id.direction;
        audio_play_sound(sndPunch, 0, false);
    }
    if (sprite_index == sprESubwayBriefcase || sprite_index == sprESubwayWalkBriefcase)
    {
        if (global.maskindex != 11 || (global.maskindex == 11 && objPlayer.sprite_index != sprPAttackPunch))
        {
            my_id = instance_create(x + lengthdir_x(6, direction - 90), y + lengthdir_y(6, direction - 90), objBriefcase);
            my_id.speed = 1 + random(1);
            my_id.friction = 0.1;
        }
        if (global.maskindex == 11 && objPlayer.sprite_index == sprPAttackPunch)
        {
            objPlayer.sprite_index = sprPWalkBag;
            my_id = instance_create(x, y, objCheckpoint);
            my_id.text = "STAGE CLEAR";
            instance_destroy();
            global.done = 1;
            instance_create(x, y, objTrainshake);
        }
    }
    instance_destroy();
}
