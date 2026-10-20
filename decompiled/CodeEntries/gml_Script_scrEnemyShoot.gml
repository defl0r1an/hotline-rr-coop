if (ammo > 0 && global.deadIgel != 1)
{
    if (object_index != objEFatGunner)
    {
        scrStayAwayFromPlayer();
    }
    if (sprite_index == sprEWalkM16 || sprite_index == sprPoliceWalkM16 || sprite_index == sprSwatWalkM16)
    {
        if (reload > 0)
        {
            reload -= 1;
        }
        else
        {
            shake = 1;
            ammo -= 1;
            light = 10;
            global.shake = 3;
            audio_play_sound(sndM16, 0, false);
            mask_index = sprWeaponMask;
            if (object_index == objSwat)
            {
                sprite_index = sprSwatAttackM16;
                image_speed = 0.5;
                image_index = 0;
            }
            reload = 3;
            if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = angle;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(26, angle), y + lengthdir_y(26, angle), objEBullet);
                if (instance_exists(my_id))
                {
                    if (global.hardmode == 0)
                    {
                        my_id.direction = (angle - 5) + random(10);
                        my_id.speed = 12 + random(4);
                    }
                    else
                    {
                        my_id.direction = (angle - 3) + random(6);
                        my_id.speed = 16;
                    }
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(5, angle - (5 * image_yscale)), y + lengthdir_y(5, angle - (5 * image_yscale)), objShell);
            my_id.sprite_index = sprM16Shell;
            my_id.image_angle = angle;
            my_id.direction = (angle - (90 * image_yscale) - 20) + random(30);
            my_id.speed = 1 + random(3);
            mask_index = sprMask;
        }
    }
    if (sprite_index == sprEWalkKalashnikov)
    {
        if (reload > 0)
        {
            reload -= 1;
        }
        else
        {
            shake = 1;
            ammo -= 1;
            light = 10;
            global.shake = 3;
            audio_play_sound(sndKalashnikov, 0, false);
            mask_index = sprWeaponMask;
            reload = 6;
            if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = angle;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(26, angle), y + lengthdir_y(26, angle), objEBullet);
                if (instance_exists(my_id))
                {
                    if (global.hardmode == 0)
                    {
                        my_id.direction = (angle - 10) + random(20);
                        my_id.speed = 12 + random(4);
                    }
                    else
                    {
                        my_id.direction = (angle - 6) + random(12);
                        my_id.speed = 16;
                    }
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(5, angle - (5 * image_yscale)), y + lengthdir_y(5, angle - (5 * image_yscale)), objShell);
            my_id.sprite_index = sprM16Shell;
            my_id.image_angle = angle;
            my_id.direction = (angle - (90 * image_yscale) - 20) + random(30);
            my_id.speed = 1 + random(3);
            mask_index = sprMask;
        }
    }
    if (sprite_index == sprEWalkShotgun || sprite_index == sprPoliceWalkShotgun)
    {
        if (reload > 0)
        {
            reload -= 1;
        }
        else
        {
            audio_play_sound(sndShotgun, 0, false);
            ammo -= 1;
            shake = 3;
            if (global.hardmode == 0)
            {
                reload = 60;
            }
            else
            {
                reload = 30;
            }
            global.shake = 6;
            mask_index = sprWeaponMask;
            if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid))
            {
                repeat (8)
                {
                    my_id = instance_create(x, y, objSmokeHit);
                    global.dir = angle;
                    with (my_id)
                    {
                        move_contact_all(global.dir, 26);
                    }
                }
            }
            else
            {
                repeat (8)
                {
                    my_id = instance_create(x + lengthdir_x(26, angle), y + lengthdir_y(26, angle), objEBullet);
                    if (instance_exists(my_id))
                    {
                        my_id.direction = (angle - 6) + random(12);
                        if (global.hardmode == 0)
                        {
                            my_id.speed = 12 + random(4);
                        }
                        else
                        {
                            my_id.speed = 16 - random(4);
                        }
                        my_id.image_angle = my_id.direction;
                    }
                }
            }
            my_id = instance_create(x + lengthdir_x(5, angle - (5 * image_yscale)), y + lengthdir_y(5, angle - (5 * image_yscale)), objShell);
            my_id.sprite_index = sprShotgunShell;
            my_id.image_angle = angle;
            my_id.direction = (angle - (90 * image_yscale) - 20) + random(30);
            my_id.speed = 1 + random(3);
            light = 20;
            mask_index = sprMask;
        }
    }
    if (sprite_index == sprEWalkDoubleBarrel)
    {
        if (reload > 0)
        {
            reload -= 1;
        }
        else
        {
            audio_play_sound(sndDoubleBarrel, 0, false);
            ammo -= 1;
            shake = 3;
            if (global.hardmode == 0)
            {
                reload = 15;
            }
            else
            {
                reload = 12;
            }
            mask_index = sprWeaponMask;
            global.shake = 6;
            if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid))
            {
                repeat (16)
                {
                    my_id = instance_create(x, y, objSmokeHit);
                    global.dir = angle;
                    with (my_id)
                    {
                        move_contact_all(global.dir, 26);
                    }
                }
            }
            else
            {
                repeat (16)
                {
                    my_id = instance_create(x + lengthdir_x(26, angle), y + lengthdir_y(26, angle), objEBullet);
                    if (instance_exists(my_id))
                    {
                        my_id.direction = (angle - 10) + random(20);
                        if (global.hardmode == 0)
                        {
                            my_id.speed = 12 + random(4);
                        }
                        else
                        {
                            my_id.speed = 16 - random(6);
                        }
                        my_id.image_angle = my_id.direction;
                    }
                }
            }
            light = 20;
            mask_index = sprMask;
        }
    }
    if (sprite_index == sprHoboWalkDoubleBarrel)
    {
        if (reload > 0)
        {
            reload -= 1;
        }
        else
        {
            audio_play_sound(sndDoubleBarrel, 0, false);
            ammo -= 1;
            shake = 3;
            reload = 15;
            mask_index = sprWeaponMask;
            global.shake = 6;
            if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid))
            {
                repeat (16)
                {
                    my_id = instance_create(x, y, objSmokeHit);
                    global.dir = angle;
                    with (my_id)
                    {
                        move_contact_all(global.dir, 26);
                    }
                }
            }
            else
            {
                repeat (16)
                {
                    my_id = instance_create(x + lengthdir_x(26, angle), y + lengthdir_y(26, angle), objEBullet);
                    if (instance_exists(my_id))
                    {
                        my_id.direction = (angle - 10) + random(20);
                        if (global.hardmode == 0)
                        {
                            my_id.speed = 12 + random(4);
                        }
                        else
                        {
                            my_id.speed = 16 - random(6);
                        }
                        my_id.image_angle = my_id.direction;
                    }
                }
            }
            light = 20;
            if (ammo == 1)
            {
                sprite_index = sprHoboAttackDoubleBarrel1;
            }
            else
            {
                sprite_index = sprHoboAttackDoubleBarrel2;
            }
            image_speed = 0.5;
            mask_index = sprMask;
        }
    }
    if (sprite_index == sprEWalkSilencer)
    {
        if (reload > 0)
        {
            reload -= 1;
        }
        else
        {
            audio_play_sound(sndSilencer, 0, false);
            ammo -= 1;
            shake = 1;
            reload = 10;
            global.shake = 2;
            if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = angle;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, angle), y + lengthdir_y(20, angle), objEBullet);
                if (instance_exists(my_id))
                {
                    if (global.hardmode == 0)
                    {
                        my_id.direction = (angle - 3) + random(6);
                    }
                    else
                    {
                        my_id.direction = (angle - 2) + random(4);
                    }
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, angle - (4 * image_yscale)), y + lengthdir_y(16, angle - (4 * image_yscale)), objShell);
            my_id.sprite_index = sprUziShell;
            my_id.image_angle = angle;
            my_id.direction = (angle - (90 * image_yscale) - 20) + random(30);
            my_id.speed = 1 + random(3);
            light = 12;
        }
    }
    if (sprite_index == sprPoliceWalkGun || sprite_index == sprEWalk9mm)
    {
        if (reload > 0)
        {
            reload -= 1;
        }
        else
        {
            audio_play_sound(snd9mm, 0, false);
            ammo -= 1;
            shake = 1;
            reload = 10;
            global.shake = 2;
            if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = angle;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, angle), y + lengthdir_y(20, angle), objEBullet);
                if (instance_exists(my_id))
                {
                    if (global.hardmode == 0)
                    {
                        my_id.direction = (angle - 3) + random(6);
                    }
                    else
                    {
                        my_id.direction = (angle - 2) + random(4);
                    }
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, angle - (4 * image_yscale)), y + lengthdir_y(16, angle - (4 * image_yscale)), objShell);
            my_id.sprite_index = sprUziShell;
            my_id.image_angle = angle;
            my_id.direction = (angle - (90 * image_yscale) - 20) + random(30);
            my_id.speed = 1 + random(3);
            light = 12;
        }
    }
    if (sprite_index == sprEDodgerGunWalk)
    {
        if (reload > 0)
        {
            reload -= 1;
        }
        else
        {
            audio_play_sound(snd9mm, 0, false);
            ammo -= 1;
            shake = 1;
            if (global.hardmode == 0)
            {
                reload = 10;
            }
            else
            {
                reload = 7;
            }
            global.shake = 2;
            if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = angle;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, angle) + lengthdir_x(5 - (10 * shot), angle - 90), y + lengthdir_y(20, angle) + lengthdir_y(5 - (10 * shot), angle - 90), objEBullet);
                if (instance_exists(my_id))
                {
                    my_id.direction = (angle - 3) + random(6);
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            if (shot)
            {
                sprite_index = sprEDodgerGunAttackLeft;
            }
            else
            {
                sprite_index = sprEDodgerGunAttackRight;
            }
            image_speed = 1;
            shot = !shot;
            my_id = instance_create(x + lengthdir_x(16, angle - 4) + lengthdir_x(5 - (10 * shot), angle - 90), y + lengthdir_y(16, angle - 4) + lengthdir_y(5 - (10 * shot), angle - 90), objShell);
            my_id.sprite_index = sprUziShell;
            my_id.image_angle = angle;
            my_id.direction = (((angle - 90) + (180 * shot)) - 20) + random(30);
            my_id.speed = 1 + random(3);
            light = 12;
        }
    }
    if (sprite_index == sprEWalkScorpion)
    {
        audio_play_sound(sndScorpion, 0, false);
        ammo -= 1;
        reload = 3;
        global.shake = 6;
        if (place_meeting(x + lengthdir_x(10, angle), y + lengthdir_y(10, angle), objSolid) || place_meeting(x + lengthdir_x(10, angle), y + lengthdir_y(10, angle), objDoorV))
        {
            my_id = instance_create(x, y, objSmokeHit);
            my_id.image_angle = image_angle;
            global.dir = angle;
            with (my_id)
            {
                move_contact_solid(global.dir, 16);
            }
        }
        else
        {
            my_id = instance_create(x + lengthdir_x(20, angle - 7), y + lengthdir_y(20, angle - 7), objEBullet);
            if (instance_exists(my_id))
            {
                my_id.direction = (angle - 3) + random(8);
                my_id.speed = 16;
                my_id.image_angle = my_id.direction;
            }
        }
        my_id = instance_create(x + lengthdir_x(16, angle - (4 * image_yscale)), y + lengthdir_y(16, angle - (4 * image_yscale)), objShell);
        my_id.sprite_index = sprUziShell;
        my_id.image_angle = angle;
        my_id.direction = (angle - (90 * image_yscale) - 20) + random(30);
        my_id.speed = 1 + random(3);
        light = 12;
    }
    if (sprite_index == sprEFatGunAttack || (sprite_index == sprEFatGunWalk && !(alert > 3)))
    {
        shake = 1;
        ammo -= 1;
        light = 10;
        global.shake = 3;
        audio_play_sound(sndAks, 0, false);
        mask_index = sprWeaponMask;
        reload = 6;
        if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid))
        {
            my_id = instance_create(x, y, objSmokeHit);
            my_id.image_angle = image_angle;
            global.dir = angle;
            with (my_id)
            {
                move_contact_solid(global.dir, 16);
            }
        }
        else
        {
            my_id = instance_create(x + lengthdir_x(26, angle) + lengthdir_x(5, angle - 90), y + lengthdir_y(26, angle) + lengthdir_y(5, angle - 90), objEBullet);
            if (instance_exists(my_id))
            {
                if (global.hardmode == 0)
                {
                    my_id.direction = (angle - 10) + random(20);
                    my_id.speed = 12 + random(4);
                }
                else
                {
                    my_id.direction = (angle - 6) + random(12);
                    my_id.speed = 16;
                }
                my_id.image_angle = my_id.direction;
            }
        }
        sprite_index = sprEFatGunAttack;
        image_speed = 1;
        my_id = instance_create(x + lengthdir_x(5, angle - (5 * image_yscale)), y + lengthdir_y(5, angle - (5 * image_yscale)), objShell);
        my_id.sprite_index = sprM16Shell;
        my_id.image_angle = angle;
        my_id.direction = (angle - (90 * image_yscale) - 20) + random(30);
        my_id.speed = 1 + random(3);
        mask_index = sprMask;
        image_index = 3;
    }
}
