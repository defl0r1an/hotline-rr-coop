sprite = mask_index;
if (reload <= 0)
{
    if (sprite_index == sprPigButcher)
    {
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        sprite_index = sprPigButcherAttack;
        image_index = 0;
        image_speed = 0.35;
        reload = 25;
    }
    if (sprite_index == sprPigButcherWalkHammer)
    {
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        sprite_index = sprPigButcherAttackHammer;
        image_index = 1;
        image_speed = 0.35;
        reload = 25;
        global.shake = 0;
    }
    if (sprite_index == sprPigButcher)
    {
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        sprite_index = sprPigButcherAttack;
        image_index = 0;
        image_speed = 0.35;
        reload = 25;
    }
    if (ammo > 0)
    {
        mask_index = sprBullet;
        image_angle = dir;
        if (sprite_index == sprPigButcherWalkM16)
        {
            audio_play_sound(sndM16, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 3;
            global.shake = 6;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid) || place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objDoorV))
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
                my_id = instance_create(x + lengthdir_x(16, dir - 7), y + lengthdir_y(16, dir - 7), objBullet);
                if (instance_exists(my_id))
                {
                    my_id.direction = (dir - 3) + random(6);
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
            my_id.sprite_index = sprM16Shell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPigButcherAttackM16;
            image_speed = 0.5;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPigButcherWalkAK)
        {
            audio_play_sound(sndKalashnikov, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 6;
            global.shake = 8;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid) || place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objDoorV))
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
                my_id = instance_create(x + lengthdir_x(16, dir - 7), y + lengthdir_y(16, dir - 7), objBullet);
                if (instance_exists(my_id))
                {
                    my_id.direction = (dir - 6) + random(12);
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
            my_id.sprite_index = sprM16Shell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPigButcherAttackAK;
            image_speed = 0.5;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPigButcherWalkShotgun)
        {
            audio_play_sound(sndShotgun, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 30;
            global.shake = 9;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid) || place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objDoorV))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
                with (objDoorV)
                {
                    if (place_meeting(x + lengthdir_x(12, global.dir - 180), y + lengthdir_y(12, global.dir - 180), objPlayer))
                    {
                        if (object_index == objDoorV)
                        {
                            if (solid == 0)
                            {
                                if (abs(swingspeed) < 8)
                                {
                                    swingspeed += lengthdir_x(16, global.dir);
                                    if (abs(swingspeed) > 3.5)
                                    {
                                        swinger = 1;
                                    }
                                }
                                if (abs(swingspeed) > 8)
                                {
                                    swingspeed = sign(swingspeed) * 8;
                                }
                            }
                        }
                        if (object_index == objDoorH)
                        {
                            if (solid == 0)
                            {
                                if (abs(swingspeed) < 8)
                                {
                                    swingspeed += lengthdir_y(16, global.dir);
                                    if (abs(swingspeed) > 3.5)
                                    {
                                        swinger = 1;
                                    }
                                }
                                if (abs(swingspeed) > 8)
                                {
                                    swingspeed = sign(swingspeed) * 8;
                                }
                            }
                        }
                        if (object_index == objDoorV2)
                        {
                            if (solid == 0)
                            {
                                if (abs(swingspeed) < 8)
                                {
                                    swingspeed -= lengthdir_x(16, global.dir);
                                    if (abs(swingspeed) > 3.5)
                                    {
                                        swinger = 1;
                                    }
                                }
                                if (abs(swingspeed) > 8)
                                {
                                    swingspeed = sign(swingspeed) * 8;
                                }
                            }
                        }
                        if (object_index == objDoorH2)
                        {
                            if (solid == 0)
                            {
                                if (abs(swingspeed) < 8)
                                {
                                    swingspeed -= lengthdir_y(16, global.dir);
                                    if (abs(swingspeed) > 3.5)
                                    {
                                        swinger = 1;
                                    }
                                }
                                if (abs(swingspeed) > 8)
                                {
                                    swingspeed = sign(swingspeed) * 8;
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                repeat (8)
                {
                    my_id = instance_create(x + lengthdir_x(16, dir - 7), y + lengthdir_y(16, dir - 7), objBullet);
                    if (instance_exists(my_id))
                    {
                        my_id.direction = (dir - 6) + random(12);
                        my_id.speed = 16 - random(4);
                        my_id.image_angle = my_id.direction;
                    }
                }
            }
            my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
            my_id.sprite_index = sprShotgunShell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPigButcherAttackShotgun;
            image_speed = 0.5;
            image_index = 0;
            light = 20;
        }
        if (sprite_index == sprPigButcherWalkDoubleBarrel)
        {
            audio_play_sound(sndDoubleBarrel, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 12;
            global.shake = 14;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid) || place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objDoorV))
            {
                my_id = instance_create(x, y, objSmokeHit);
                my_id.image_angle = image_angle;
                global.dir = dir;
                with (my_id)
                {
                    move_contact_solid(global.dir, 16);
                }
                with (objDoorV)
                {
                    if (place_meeting(x + lengthdir_x(12, global.dir - 180), y + lengthdir_y(12, global.dir - 180), objPlayer))
                    {
                        if (object_index == objDoorV)
                        {
                            if (solid == 0)
                            {
                                if (abs(swingspeed) < 8)
                                {
                                    swingspeed += lengthdir_x(16, global.dir);
                                    if (abs(swingspeed) > 3.5)
                                    {
                                        swinger = 1;
                                    }
                                }
                                if (abs(swingspeed) > 8)
                                {
                                    swingspeed = sign(swingspeed) * 8;
                                }
                            }
                        }
                        if (object_index == objDoorH)
                        {
                            if (solid == 0)
                            {
                                if (abs(swingspeed) < 8)
                                {
                                    swingspeed += lengthdir_y(16, global.dir);
                                    if (abs(swingspeed) > 3.5)
                                    {
                                        swinger = 1;
                                    }
                                }
                                if (abs(swingspeed) > 8)
                                {
                                    swingspeed = sign(swingspeed) * 8;
                                }
                            }
                        }
                        if (object_index == objDoorV2)
                        {
                            if (solid == 0)
                            {
                                if (abs(swingspeed) < 8)
                                {
                                    swingspeed -= lengthdir_x(16, global.dir);
                                    if (abs(swingspeed) > 3.5)
                                    {
                                        swinger = 1;
                                    }
                                }
                                if (abs(swingspeed) > 8)
                                {
                                    swingspeed = sign(swingspeed) * 8;
                                }
                            }
                        }
                        if (object_index == objDoorH2)
                        {
                            if (solid == 0)
                            {
                                if (abs(swingspeed) < 8)
                                {
                                    swingspeed -= lengthdir_y(16, global.dir);
                                    if (abs(swingspeed) > 3.5)
                                    {
                                        swinger = 1;
                                    }
                                }
                                if (abs(swingspeed) > 8)
                                {
                                    swingspeed = sign(swingspeed) * 8;
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                repeat (16)
                {
                    my_id = instance_create(x + lengthdir_x(16, dir - 7 - 3), y + lengthdir_y(16, dir - 7 - 3), objBullet);
                    if (instance_exists(my_id))
                    {
                        my_id.direction = (dir - 10) + random(20);
                        my_id.speed = 16 - random(6);
                        my_id.image_angle = my_id.direction;
                    }
                }
            }
            if (ammo == 1)
            {
                sprite_index = sprPigButcherAttackDoubleBarrel1;
            }
            else
            {
                sprite_index = sprPigButcherAttackDoubleBarrel2;
            }
            image_speed = 0.5;
            image_index = 0;
            light = 25;
        }
        if (sprite_index == sprPigButcherWalkSilencer)
        {
            audio_play_sound(sndSilencer, 0, false);
            ammo -= 1;
            reload = 12;
            global.shake = 2;
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid) || place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objDoorV))
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
                my_id = instance_create(x + lengthdir_x(20, dir - 7), y + lengthdir_y(20, dir - 7), objBullet);
                if (instance_exists(my_id))
                {
                    my_id.bullet = 1;
                    my_id.direction = (dir - 2) + random(4);
                    my_id.speed = 16;
                    my_id.image_angle = my_id.direction;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShell);
            my_id.sprite_index = sprUziShell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPigButcherAttackSilencer;
            image_speed = 0.5;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPigButcherWalk9mm)
        {
            audio_play_sound(snd9mm, 0, false);
            scrHearPlayer();
            ammo -= 1;
            reload = 14;
            global.shake = 5;
            if (place_meeting(x + lengthdir_x(11, dir), y + lengthdir_y(11, dir), objSolid) || place_meeting(x + lengthdir_x(11, dir), y + lengthdir_y(11, dir), objDoorV))
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
                my_id = instance_create(x + lengthdir_x(20, dir - 2), y + lengthdir_y(20, dir - 2), objBullet);
                scrMuzzle(x + myxspeed + lengthdir_x(24, dir - 1), y + myyspeed + lengthdir_y(24, dir - 1), dir, 2001, 1, 1);
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
                    my_id.bullet = 1;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShell);
            my_id.sprite_index = sprUziShell;
            my_id.image_angle = dir;
            my_id.direction = (dir - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPigButcherAttack9mm;
            image_speed = 0.5;
            image_index = 0;
            light = 12;
        }
        if (sprite_index == sprPigButcherWalkMP5)
        {
            image_index = 0;
            sprite_index = sprPigButcherShoot;
        }
        if (sprite_index == sprPigButcherShoot)
        {
            if (image_index < 2)
            {
                image_index += 0.25;
            }
            else
            {
                image_index = 2;
                audio_play_sound(sndMP5, 0, false);
                ammo -= 1;
                reload = 4;
                global.shake = 6;
                if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSolid) || place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objDoorV))
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
                    my_id = instance_create(x + lengthdir_x(20, dir - 1), y + lengthdir_y(20, dir - 1), objBullet);
                    scrMuzzle(x + myxspeed + lengthdir_x(32, dir - 1), y + myyspeed + lengthdir_y(32, dir - 1), dir, 2002, 1, 1);
                    if (instance_exists(my_id))
                    {
                        my_id.direction = (dir - 4) + random(8);
                        my_id.speed = 16;
                        my_id.image_angle = my_id.direction;
                    }
                }
                my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShell);
                my_id.sprite_index = sprUziShell;
                my_id.image_angle = dir;
                my_id.direction = (dir - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                image_speed = 0;
                light = 12;
            }
        }
    }
    if (sprite_index == sprPigButcherWalkKnife)
    {
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        sprite_index = sprPigButcherAttackKnife;
        image_speed = 0.6;
        image_index = 0;
        reload = 16;
        global.shake = 0;
    }
    if (sprite_index == sprPigButcherWalkClub)
    {
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        sprite_index = sprPigButcherAttackClub;
        image_speed = 0.35;
        image_index = 1;
        reload = 32;
        global.shake = 0;
    }
    if (sprite_index == sprPigButcherWalkStick)
    {
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        sprite_index = sprPigButcherAttackStick;
        image_speed = 0.35;
        image_index = 1;
        reload = 25;
        global.shake = 0;
    }
    if (sprite_index == sprPigButcherWalkPipe)
    {
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        sprite_index = sprPigButcherAttackPipe;
        image_speed = 0.35;
        image_index = 1;
        reload = 25;
        global.shake = 0;
    }
    if (sprite_index == sprPigButcherWalkBat)
    {
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        sprite_index = sprPigButcherAttackBat;
        image_speed = 0.35;
        image_index = 1;
        reload = 30;
        global.shake = 0;
    }
    mask_index = sprite;
    image_angle = 0;
}
