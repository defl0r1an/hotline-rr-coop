if (sprite_index == sprBodyguardGetUp)
{
    if (!place_free(x, y))
    {
        speed = 0;
    }
    if (speed == 0)
    {
        if (reload > 0)
        {
            reload -= 1;
        }
        else
        {
            image_speed = 0.35;
        }
    }
}
if (instance_exists(objPlayer))
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 48)
    {
        if (!(state < 3))
        {
            if (objPlayer.sprite_index == sprPJacketAttackKnuckles || (global.maskindex == 27 && (objPlayer.sprite_index == sprPAttackPunch || objPlayer.sprite_index == sprPPushing)))
            {
                if (sprite_index == sprBodyguardGetUp)
                {
                    exit;
                }
                path_end();
                sprite_index = sprBodyguardGetUp;
                speed = 1.5;
                friction = 0.1;
                direction = objPlayer.direction;
                global.shake = 1;
                reload = 50 + random(60);
                image_index = 1;
                audio_play_sound(sndPunch, 0, false);
                if (objPlayer.sprite_index == sprPJacketAttackKnuckles || (global.maskindex == 27 && objPlayer.sprite_index == sprPAttackPunch))
                {
                    global.shake = 10;
                    audio_play_sound(sndHit, 0, false);
                    audio_play_sound(sndHitWall, 0, false);
                    repeat (6)
                    {
                        my_id = instance_create((x - 3) + random(6), (y - 3) + random(6), objBloodDrop);
                        my_id.direction = point_direction(x, y, my_id.x, my_id.y);
                        my_id.image_xscale = 1 + random(0.2);
                        my_id.image_yscale = my_id.image_xscale;
                        my_id.image_angle = random(360);
                        my_id.speed = 2 + random(4);
                    }
                }
            }
        }
    }
}
if (sprite_index == sprBodyguardGetUp || sprite_index == sprBodyguardKnockedOutTKnife)
{
    if (instance_exists(objPlayer))
    {
        if (point_distance(x, y, objPlayer.x, objPlayer.y) < 12)
        {
            my_id = -112345;
            if (sprite_index == sprBodyguardKnockedOutTKnife)
            {
                my_id = instance_create(x, y, objPKillBodyguardTKnife);
            }
            else
            {
                my_id = instance_create(x, y, objPKillBodyguard);
            }
            if (instance_exists(my_id))
            {
                my_id.image_angle = direction;
                my_id.maskon = 1;
                my_id.maskindex = global.maskindex;
                global.executionx = objPlayer.x;
                global.executiony = objPlayer.y;
                my_id2 = instance_create(x + lengthdir_y(6, image_angle + 90), y + lengthdir_y(6, image_angle + 90), objPoliceHat);
                my_id2.sprite_index = sprBGSword;
                my_id2.direction = (direction + 70) - random(40);
                my_id2.speed = 2 + random(1);
                instance_destroy();
                with (objPlayerMouse)
                {
                    instance_destroy();
                }
            }
        }
    }
    exit;
}
if (state == 0)
{
    if (instance_exists(objPlayer))
    {
        if (objPlayer.y < (y + 12))
        {
            if (sprite_index == sprBodyguardAttack)
            {
                direction = point_direction(x, y, objPlayer.x, objPlayer.y);
                my_id = instance_create(x, y, objBodyguardKnife);
                my_id.direction = direction;
                my_id.speed = 12;
                my_id.image_angle = direction;
                sprite_index = sprBodyguardThrow;
                image_speed = 0.5;
            }
            objPlayer.myxspeed = 0;
            objPlayer.myyspeed = 0;
        }
    }
    if (!instance_exists(objPanther) && !instance_exists(objPantherBite))
    {
        if (instance_exists(objPlayer))
        {
            if (wait > 0)
            {
                wait -= 1;
            }
            else
            {
                with (objPlayerMouse)
                {
                    my_id = instance_create(x, y, objPlayerMouseHouse);
                    my_id.active = 0;
                    my_id.dir = dir;
                    my_id.legindex = legindex;
                    my_id.sprite_index = sprite_index;
                    my_id.direction = 90;
                    my_id.legdir = 90;
                    my_id.maskon = 1;
                    my_id.maskindex = maskindex;
                    instance_destroy();
                }
                scrGetMessage(2);
                state = 2;
                wait = 20;
            }
        }
    }
}
if (state == 2)
{
    if (!instance_exists(objPhoneConversation))
    {
        state = 3;
        with (objPlayerMouseHouse)
        {
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.dir = dir;
            my_id.legindex = legindex;
            my_id.image_index = image_index;
            my_id.sprite_index = sprite_index;
            my_id.direction = 90;
            my_id.legdir = 90;
            my_id.maskon = 1;
            my_id.maskindex = maskindex;
            instance_destroy();
        }
    }
}
if (state == 3)
{
    if (!instance_exists(objPlayer))
    {
        if (sprite_index == sprBodyguardAttack)
        {
            state = 4;
        }
    }
    else if (wait > 0)
    {
        wait -= 1;
    }
    else
    {
        pwait = 0;
        if (pwait > 0)
        {
            pwait -= 1;
        }
        else
        {
            mask_index = sprWeaponMask;
            if (!scrCollisionLineDouble(x, y, objPlayer.x, objPlayer.y, 4, 309, 315))
            {
                direction = point_direction(x, y, objPlayer.x, objPlayer.y);
                speed = 4;
                if (image_index < 2)
                {
                    image_index += 0.25;
                }
                legindex += (speed * 0.25);
                if (point_distance(x, y, objPlayer.x, objPlayer.y) < 38)
                {
                    global.my_id = id;
                    global.shake = 10;
                    scrPlayerDieMelee();
                    image_index = 0.25;
                    speed = 0;
                    state = 4;
                }
            }
            else
            {
                speed = 0;
                legindex = 0;
                if (sprite_index == sprBodyguardAttack)
                {
                    direction = point_direction(x, y, objPlayer.x, objPlayer.y);
                    my_id = instance_create(x, y, objBodyguardKnife);
                    my_id.direction = direction;
                    my_id.speed = 12;
                    my_id.image_angle = direction;
                    sprite_index = sprBodyguardThrow;
                    image_speed = 0.5;
                }
                objPlayer.myxspeed = 0;
                objPlayer.myyspeed = 0;
            }
            mask_index = sprMask;
        }
    }
}
if (state == 4)
{
    if (image_index > 0)
    {
        if (image_index < 23)
        {
            image_index += 0.25;
        }
    }
}
