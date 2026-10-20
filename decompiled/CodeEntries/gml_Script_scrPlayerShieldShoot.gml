if (sprite_index == sprShieldSnapUzi || sprite_index == sprShieldSnapMP5 || sprite_index == sprShieldSnapDoubleBarrel || sprite_index == sprShieldSnapSilencer || sprite_index == sprShieldSnapScorpion || sprite_index == sprShieldSnapMagnum || sprite_index == sprPSnapHumanShieldSilencedUzi || sprite_index == sprPShieldSnapAks || sprite_index == sprPShieldSnapNailgun || sprite_index == sprPHumanShieldSnap9mm)
{
    exit;
}
sprite = mask_index;
if (reload <= 0)
{
    if (ammo > 0)
    {
        mask_index = sprBullet;
        image_angle = dir;
        if (sprite_index == sprPHumanShieldDoubleBarrel)
        {
            audio_play_sound(sndDoubleBarrel, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 12;
            global.shake = 14;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                repeat (16)
                {
                    my_id = instance_create(x + lengthdir_x(16, dir - 3), y + lengthdir_y(16, dir - 3), objBullet);
                    if (instance_exists(my_id))
                    {
                        if (global.maskindex == 15)
                        {
                            if (global.hardmode == 0)
                            {
                                my_id.direction = (dir - 6) + random(12);
                            }
                            if (global.hardmode == 1)
                            {
                                my_id.direction = (dir - 16) + random(26);
                            }
                        }
                        else
                        {
                            my_id.direction = (dir - 10) + random(20);
                        }
                        my_id.speed = 16 - random(6);
                        my_id.image_angle = my_id.direction;
                    }
                }
            }
            if (ammo == 1)
            {
                sprite_index = sprPHumanShieldDoubleBarrelShoot1;
            }
            else
            {
                sprite_index = sprPHumanShieldDoubleBarrelShoot2;
            }
            image_speed = 0.5;
            image_index = 0;
            light = 25;
        }
        if (sprite_index == sprPHumanShieldSilencer)
        {
            audio_play_sound(sndSilencer, 0, false);
            ammo -= 1;
            reload = 12;
            global.shake = 2;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBullet);
                if (instance_exists(my_id))
                {
                    if (global.maskindex == 15)
                    {
                        if (global.hardmode == 0)
                        {
                            my_id.direction = (dir - 1) + random(2);
                        }
                        if (global.hardmode == 1)
                        {
                            my_id.direction = (dir - 6) + random(12);
                        }
                    }
                    else
                    {
                        my_id.direction = (dir - 2) + random(4);
                    }
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, dir - (4 * left)), y + lengthdir_y(16, dir - (4 * left)), objShell);
            my_id.sprite_index = sprUziShell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPHumanShieldSilencerShoot;
            image_speed = 0.5;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPHumanShield9mm)
        {
            audio_play_sound(snd9mm, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 14;
            global.shake = 5;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBullet);
                if (instance_exists(my_id))
                {
                    if (global.maskindex == 15)
                    {
                        if (global.hardmode == 0)
                        {
                            my_id.direction = (dir - 1) + random(2);
                        }
                        if (global.hardmode == 1)
                        {
                            my_id.direction = (dir - 6) + random(12);
                        }
                    }
                    else
                    {
                        my_id.direction = (dir - 2) + random(4);
                    }
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, dir - (4 * left)), y + lengthdir_y(16, dir - (4 * left)), objShell);
            my_id.sprite_index = sprUziShell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPHumanShield9mmShoot;
            image_speed = 0.5;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPHumanShieldUzi)
        {
            audio_play_sound(sndUzi, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 3;
            global.shake = 6;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBullet);
                scrMuzzle(x + myxspeed + lengthdir_x(26, dir), y + myyspeed + lengthdir_y(26, dir), dir, 2001, 1, 1);
                if (instance_exists(my_id))
                {
                    if (global.maskindex == 15)
                    {
                        if (global.hardmode == 0)
                        {
                            my_id.direction = (dir - 1) + random(2);
                        }
                        if (global.hardmode == 1)
                        {
                            my_id.direction = (dir - 8) + random(16);
                        }
                    }
                    else
                    {
                        my_id.direction = (dir - 5) + random(10);
                    }
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, dir - (4 * left)), y + lengthdir_y(16, dir - (4 * left)), objShell);
            my_id.sprite_index = sprUziShell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPHumanShieldUziShoot;
            image_speed = 1;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPWalkHumanShieldSilencedUzi)
        {
            audio_play_sound(sndSilencedUzi, 0, false);
            ammo -= 1;
            reload = 3;
            global.shake = 5;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBullet);
                if (instance_exists(my_id))
                {
                    if (global.maskindex == 15)
                    {
                        if (global.hardmode == 0)
                        {
                            my_id.direction = (dir - 1) + random(2);
                        }
                        if (global.hardmode == 1)
                        {
                            my_id.direction = (dir - 8) + random(16);
                        }
                    }
                    else
                    {
                        my_id.direction = (dir - 4) + random(8);
                    }
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, dir - (4 * left)), y + lengthdir_y(16, dir - (4 * left)), objShell);
            my_id.sprite_index = sprUziShell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPAttackHumanShieldSilencedUzi;
            image_speed = 1;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPHumanShieldMP5)
        {
            audio_play_sound(sndMP5, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 4;
            global.shake = 6;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBullet);
                if (instance_exists(my_id))
                {
                    if (global.maskindex == 15)
                    {
                        if (global.hardmode == 0)
                        {
                            my_id.direction = (dir - 1) + random(2);
                        }
                        if (global.hardmode == 1)
                        {
                            my_id.direction = (dir - 8) + random(16);
                        }
                    }
                    else
                    {
                        my_id.direction = (dir - 4) + random(8);
                    }
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, dir - (4 * left)), y + lengthdir_y(16, dir - (4 * left)), objShell);
            my_id.sprite_index = sprUziShell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPHumanShieldMP5Shoot;
            image_speed = 1;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPWalkHumanShieldAks)
        {
            audio_play_sound(sndAks, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 6;
            global.shake = 6;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBullet);
                scrMuzzle(x + myxspeed + lengthdir_x(35, dir), y + myyspeed + lengthdir_y(35, dir), dir, 1998, 1, 1);
                if (instance_exists(my_id))
                {
                    if (global.maskindex == 15)
                    {
                        if (global.hardmode == 0)
                        {
                            my_id.direction = (dir - 1) + random(2);
                        }
                        if (global.hardmode == 1)
                        {
                            my_id.direction = (dir - 8) + random(16);
                        }
                    }
                    else
                    {
                        my_id.direction = (dir - 4) + random(8);
                    }
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, dir - (4 * left)), y + lengthdir_y(16, dir - (4 * left)), objShell);
            my_id.sprite_index = sprM16Shell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPAttackHumanShieldAks;
            image_speed = 1;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPHumanShieldMagnum)
        {
            audio_play_sound(sndMagnum, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 14;
            global.shake = 10;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBullet);
                if (instance_exists(my_id))
                {
                    if (global.maskindex == 15)
                    {
                        if (global.hardmode == 0)
                        {
                            my_id.direction = (dir - 1) + random(2);
                        }
                        if (global.hardmode == 1)
                        {
                            my_id.direction = (dir - 6) + random(12);
                        }
                    }
                    else
                    {
                        my_id.direction = (dir - 3) + random(6);
                    }
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                    my_id.caliber = 1;
                }
            }
            sprite_index = sprPHumanShieldMagnumShoot;
            image_speed = 0.5;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPWalkHumanShieldNailgun)
        {
            audio_play_sound(sndNailGun, 0, false);
            ammo -= 1;
            reload = 10;
            global.shake = 2;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid))
            {
                my_id = instance_create(x + lengthdir_x(10, dir - 3), y + lengthdir_y(10, dir - 3), objNail);
                my_id.collision = -1;
                my_id.image_angle = image_angle;
                my_id.depth = 0;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objNail);
                if (instance_exists(my_id))
                {
                    my_id.direction = (dir - 3) + random(6);
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            sprite_index = sprPAttackHumanShieldNailgun;
            image_speed = 0.5;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPHumanShieldScorpion)
        {
            audio_play_sound(sndScorpion, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 3;
            global.shake = 6;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBullet);
                if (instance_exists(my_id))
                {
                    if (global.maskindex == 15)
                    {
                        if (global.hardmode == 0)
                        {
                            my_id.direction = (dir - 2) + random(4);
                        }
                        if (global.hardmode == 1)
                        {
                            my_id.direction = (dir - 7) + random(14);
                        }
                    }
                    else
                    {
                        my_id.direction = (dir - 3) + random(8);
                    }
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, dir - (4 * left)), y + lengthdir_y(16, dir - (4 * left)), objShell);
            my_id.sprite_index = sprUziShell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPHumanShieldScorpionShoot;
            image_speed = 1;
            image_index = 0;
            light = 12;
        }
    }
}
mask_index = sprite;
image_angle = 0;
