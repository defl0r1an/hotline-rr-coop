griffinspd = 0;
griffinaccuracy = 0;
if (!(reload <= 0))
{
    exit;
}
if (reload == -1)
{
    exit;
}
if (objPlayer.sprite_index == sprPLeaveBag || sprite_index == sprPWalkBossgun || objPlayer.sprite_index == sprPMaskSlip || instance_exists(objMaskMenu) || global.igelcutscenes == 1)
{
    nothing = 1;
}
else
{
    sprite = mask_index;
    switch (sprite_index)
    {
        case sprPWalkUnarmed:
        case sprPJacketKillDog:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackPunch;
            if (global.maskindex == 2)
            {
                sprite_index = sprPJacketAttackKnuckles;
            }
            image_index = 0;
            image_speed = griffinspd + 0.5;
            reload = 20;
            if (global.maskindex == 27)
            {
                reload = 40;
            }
            impact = 1;
            if (global.maskindex == 2 || global.maskindex == 27)
            {
                impact = 2.5;
            }
            if (global.maskindex == 2 && global.hardmode == 1)
            {
                impact = 3.5;
            }
            impside = 8;
            break;
        case sprPWalkBag:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackBag;
            image_index = 1;
            image_speed = 0.35;
            reload = 25;
            impact = 3;
            impside = 3;
            break;
        case sprPWalkPan:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackPan;
            image_index = 1;
            image_speed = 0.35;
            reload = 25;
            impact = 3;
            impside = 3;
            break;
        case sprPWalkCrowbar:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackCrowbar;
            image_index = 1;
            image_speed = 0.35;
            reload = 25;
            impact = 3;
            impside = 3;
            break;
        case sprPWalkMachete:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackMachete;
            image_index = 1;
            image_speed = 0.35;
            reload = 25;
            global.shake = 0;
            impact = 5;
            impside = 4;
            break;
        case sprPWalkPot:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackPot;
            image_index = 1;
            image_speed = 0.35;
            reload = 25;
            global.shake = 0;
            impact = 3;
            impside = 3;
            break;
        case sprPWalkBoilingPot:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            global.shake = 5;
            sprite_index = sprPAttackBoilingPot;
            image_index = 1;
            image_speed = 0.35;
            repeat (3 + random(2))
            {
                my_id = instance_create(((x + lengthdir_x(11, dir)) - 2) + random(4), ((y + lengthdir_y(11, dir)) - 2) + random(4), objPWater);
                global.mydir = dir;
                with (my_id)
                {
                    move_contact_solid(global.mydir, 10);
                }
                my_id.direction = griffinaccuracy + point_direction(x, y, my_id.x, my_id.y);
                my_id.speed = 8;
                my_id.image_angle = my_id.direction;
            }
            reload = 25;
            break;
        case sprPigButcher:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPigButcherAttack;
            image_index = 0;
            image_speed = griffinspd + 0.5;
            reload = 20;
            break;
        case sprPWalkDrill:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackDrill;
            image_index = 1;
            image_speed = 0.35;
            reload = 25;
            global.shake = 0;
            impact = 3;
            impside = 8;
            break;
        case sprPWalkTrophy:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackTrophy;
            image_index = 0;
            image_speed = 0.35;
            reload = 25;
            global.shake = 0;
            impact = 2;
            impside = 8;
            break;
        case sprPWalkTaser:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackTaser;
            image_index = 0;
            image_speed = 0.5;
            reload = 25;
            break;
        case sprPIdleSkippy2:
            sprite_index = sprPIdleSkippy2End;
            image_speed = 0.2;
            image_index = 0;
            waitidle = 0;
            break;
        case sprPWalkThrow:
            if (place_meeting(x + lengthdir_x(9, dir), y + lengthdir_y(9, dir), objSolid) || place_meeting(x + lengthdir_x(9, dir), y + lengthdir_y(9, dir), objDoorV))
            {
                my_id = instance_create(x + lengthdir_x(4, dir + (left * -35)), y + lengthdir_y(2, dir + (left * -35)), objThrowingWeapon);
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(14, dir + (left * -35)), y + lengthdir_y(12, dir + (left * -35)), objThrowingWeapon);
            }
            audio_play_sound(sndThrow, 0, false);
            my_id.speed = 12;
            my_id.direction = (dir - 2) + random(4);
            my_id.image_index = throwindex;
            if (throwindex == 9 || throwindex == 10 || throwindex == 11)
            {
                my_id.friction = 0;
                my_id.depth = -4;
                my_id.direction = dir;
            }
            my_id.angle = my_id.direction;
            my_id.image_angle = my_id.direction;
            reload = 20;
            image_speed = griffinspd + 0.5;
            image_index = 1;
            sprite_index = sprPAttackThrow;
            left = 1;
            global.shake = 0;
            break;
        case sprPWalkSword:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackSword;
            image_speed = 0.35;
            image_index = 0;
            reload = 32;
            global.shake = 0;
            impact = 5;
            impside = 8;
            break;
        case sprPWalkKnife:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackKnife;
            image_speed = 0.6;
            image_index = 0;
            reload = 16;
            global.shake = 0;
            impact = 1;
            impside = 8;
            break;
        case sprPWalkCleaver:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = choose(sprPJacketAttackCleaver, sprPJacketAttackCleaver2);
            image_index = 0;
            image_speed = 0.5;
            reload = 15;
            impact = 3.25;
            impside = 8;
            break;
        case sprPJacketWalkSkateboard:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPJacketAttackSkateboard;
            image_speed = 0.35;
            image_index = 0;
            reload = 32;
            global.shake = 0;
            impact = 5;
            impside = 8;
            break;
        case sprPWalkButterfly:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackButterfly;
            image_speed = 0.6;
            image_index = 0;
            reload = 10;
            global.shake = 0;
            impact = 1.35;
            impside = 8;
            break;
        case sprGriffinWalk:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprGriffinAttackKnife;
            image_speed = griffinspd + 1;
            image_index = 0;
            reload = 10;
            global.shake = 0;
            break;
        case sprPWalkClub:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackClub;
            image_speed = 0.35;
            image_index = 1;
            reload = 32;
            global.shake = 0;
            impact = 3;
            impside = 8;
            break;
        case sprPWalkNightStick:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackNightStick;
            image_speed = 0.35;
            image_index = 1;
            reload = 25;
            global.shake = 0;
            impact = 3;
            impside = 8;
            break;
        case sprPWalkPipe:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackPipe;
            image_speed = 0.35;
            image_index = 1;
            reload = 25;
            global.shake = 0;
            impact = 3;
            impside = 8;
            break;
        case sprPWalkBat:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackBat;
            image_speed = 0.35;
            image_index = 1;
            reload = 30;
            global.shake = 0;
            impact = 3;
            impside = 8;
            break;
        case sprPWalkAxe:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackAxe;
            image_speed = 0.35;
            image_index = 1;
            reload = 25;
            global.shake = 0;
            impact = 5;
            impside = 8;
            break;
        case sprPWalkSledgeHammer:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackSledgeHammer;
            image_speed = 0.375;
            image_index = 1;
            reload = 25;
            global.shake = 0;
            break;
        case sprPWalkPool:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackPool;
            image_speed = 0.35;
            image_index = 1;
            reload = 25;
            global.shake = 0;
            impact = 3;
            impside = 8;
            break;
        case sprPWalkPoolBroke:
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
            sprite_index = sprPAttackPoolBroke;
            image_speed = 0.6;
            image_index = 1;
            reload = 16;
            global.shake = 0;
            impact = 4;
            impside = 8;
            break;
        case sprPJacketWalkRPG:
            scrHearPlayer();
            ammo -= 1;
            reload = 6;
            global.shake = 6;
            my_id = instance_create(global.mousex, global.mousey, objExplosion);
            my_id.RPGJOKE = 1;
            scrMuzzle(x + myxspeed + lengthdir_x(40, dir - 1), y + myyspeed + lengthdir_y(40, dir - 1), dir, 1998, 1, 1);
            sprite_index = sprPAttackRPG;
            image_speed = 0.3;
            image_index = 0;
            light = 26;
            impact = 4;
            impside = -8;
            break;
    }
    if (ammo > 0)
    {
        mask_index = sprBullet;
        image_angle = dir;
        switch (sprite_index)
        {
            case sprPWalkChainsaw:
                audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
                audio_play_sound(sndChainsawAttack, 0, false);
                sprite_index = sprPAttackChainsaw;
                image_speed = 0.35;
                image_index = 1;
                reload = clamp(round(20 - HotWeaponAlpha), 0, 20);
                ammo -= 5;
                global.shake = 0;
                if (global.hardmode == 1 && global.maskindex == 22)
                {
                    impact = 5.75 + (HotWeaponAlpha * 3.5);
                    HotWeaponSwitch = 0;
                    HotWeaponAlpha += 0.65;
                    HotWeaponSpeed = 0.01;
                }
                else
                {
                    impact = 6.5;
                }
                impside = 8;
                break;
            case sprPWalkM16:
                scrSoundWhileShooting();
                audio_play_sound(sndM16, 0, false);
                scrHearPlayer();
                ammo -= 1;
                reload = 3;
                global.shake = 7;
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
                    my_id = instance_create(x + lengthdir_x(16, dir - 7), y + lengthdir_y(16, dir - 7), objBullet);
                    scrMuzzle(x + myxspeed + lengthdir_x(20, dir - 1), y + myyspeed + lengthdir_y(20, dir - 1), dir, 1998, 1, 1);
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
                                my_id.direction = (dir - 6) + random(12);
                            }
                        }
                        else
                        {
                            my_id.direction = (dir - 3) + random(6);
                        }
                        my_id.speed = 16;
                        my_id.image_angle = my_id.direction;
                    }
                }
                my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
                my_id.sprite_index = sprM16Shell;
                my_id.image_angle = dir;
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackM16;
                image_speed = griffinspd + 0.5;
                image_index = 0;
                light = 12;
                impact = 1;
                impside = -8;
                break;
            case sprPWalkKalashnikov:
                audio_play_sound(sndKalashnikov, 0, false);
                scrSoundWhileShooting();
                scrHearPlayer();
                ammo -= 1;
                reload = 6;
                global.shake = 8;
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
                    my_id = instance_create(x + lengthdir_x(16, dir - 7), y + lengthdir_y(16, dir - 7), objBullet);
                    scrMuzzle(x + myxspeed + lengthdir_x(20, dir - 1), y + myyspeed + lengthdir_y(20, dir - 1), dir, 1997, 1, 1);
                    if (instance_exists(my_id))
                    {
                        if (global.maskindex == 15)
                        {
                            if (global.hardmode == 0)
                            {
                                my_id.direction = (dir - 3) + random(6);
                            }
                            if (global.hardmode == 1)
                            {
                                my_id.direction = (dir - 8) + random(16);
                            }
                        }
                        else
                        {
                            my_id.direction = (dir - 6) + random(12);
                        }
                        my_id.speed = 16;
                        my_id.image_angle = my_id.direction;
                    }
                }
                my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
                my_id.sprite_index = sprM16Shell;
                my_id.image_angle = dir;
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackKalashnikov;
                image_speed = griffinspd + 0.5;
                image_index = 0;
                light = 12;
                impact = 0.75;
                impside = -8;
                break;
            case sprPWalkShotgun:
                audio_play_sound(sndShotgun, 0, false);
                scrHearPlayer();
                ammo -= 1;
                reload = 30;
                global.shake = 9;
                if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSolid) || place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objDoorV))
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
                            if (global.maskindex == 15)
                            {
                                if (global.hardmode == 0)
                                {
                                    my_id.direction = (dir - 3) + random(10);
                                }
                                if (global.hardmode == 1)
                                {
                                    my_id.direction = (dir - 8) + random(16);
                                }
                            }
                            else
                            {
                                my_id.direction = (dir - 6) + random(12);
                            }
                            my_id.speed = 16 - random(4);
                            my_id.image_angle = my_id.direction;
                        }
                    }
                }
                scrMuzzle(x + myxspeed + lengthdir_x(20, dir - 1), y + myyspeed + lengthdir_y(20, dir - 1), dir, 2000, 1, 1);
                my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
                my_id.sprite_index = sprShotgunShell;
                my_id.image_angle = dir;
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackShotgun;
                image_speed = griffinspd + 0.5;
                image_index = 0;
                light = 20;
                impact = 3;
                impside = -8;
                break;
            case sprAubreyShotgunTurn:
                audio_play_sound(sndShotgun, 0, false);
                scrHearPlayer();
                ammo -= 1;
                reload = 30;
                global.shake = 9;
                if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSolid) || place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objDoorV))
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
                        my_id = instance_create(x + lengthdir_x(16, dir - 1), y + lengthdir_y(16, dir - 1), objBullet);
                        if (instance_exists(my_id))
                        {
                            my_id.direction = (dir - 6) + random(12);
                            my_id.speed = 16 - random(4);
                            my_id.image_angle = my_id.direction;
                        }
                    }
                }
                scrMuzzle(x + myxspeed + lengthdir_x(20, dir - 1), y + myyspeed + lengthdir_y(20, dir - 1), dir, 2000, 1, 1);
                my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
                my_id.sprite_index = sprShotgunShell;
                my_id.image_angle = dir;
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackShotgunTurn;
                image_speed = griffinspd + 0.4;
                image_index = 0;
                light = 20;
                impact = 3;
                impside = -8;
                break;
            case sprPWalkHuntingRifle:
                audio_stop_sound(sndHuntingRifle);
                audio_play_sound(sndHuntingRifle, 0, false);
                scrHearPlayer();
                ammo -= 1;
                reload = 40;
                global.shake = 12;
                if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSolid) || place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objDoorV))
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
                    my_id = instance_create(x + lengthdir_x(16, dir - 7), y + lengthdir_y(16, dir - 7), objBullet);
                    scrMuzzle(x + myxspeed + lengthdir_x(20, dir - 1), y + myyspeed + lengthdir_y(20, dir - 1), dir, 2000, 1, 1);
                    if (instance_exists(my_id))
                    {
                        my_id.direction = dir;
                        my_id.speed = 16;
                        my_id.image_angle = my_id.direction;
                        my_id.caliber = 1;
                    }
                }
                my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
                my_id.sprite_index = sprM16Shell;
                my_id.image_angle = dir;
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackHuntingRifle;
                image_speed = griffinspd + 0.5;
                image_index = 0;
                light = 20;
                impact = 2;
                impside = -8;
                break;
            case sprPWalkDoubleBarrel:
                audio_play_sound(sndDoubleBarrel, 0, false);
                scrHearPlayer();
                ammo -= 1;
                reload = 12;
                global.shake = 14;
                if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSolid) || place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objDoorV))
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
                    sprite_index = sprPAttackDoubleBarrel1;
                }
                else
                {
                    sprite_index = sprPAttackDoubleBarrel2;
                }
                image_speed = griffinspd + 0.5;
                image_index = 0;
                light = 25;
                impact = 3;
                impside = -8;
                break;
            case sprJacketWalkShorty:
                audio_play_sound(sndDoubleBarrel, 0, false);
                scrHearPlayer();
                ammo -= 1;
                reload = 12;
                global.shake = 14;
                if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSolid) || place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objDoorV))
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
                    sprite_index = sprJacketAttackShorty1;
                }
                else
                {
                    sprite_index = sprJacketAttackShorty2;
                }
                image_speed = griffinspd + 0.5;
                image_index = 0;
                light = 25;
                impact = 3;
                impside = -8;
                break;
            case sprPWalkSilencer:
                audio_play_sound(sndSilencer, 0, false);
                scrSoundWhileShooting();
                ammo -= 1;
                reload = 12;
                global.shake = 2;
                if (place_meeting(x + lengthdir_x(9, dir), y + lengthdir_y(9, dir), objSolid) || place_meeting(x + lengthdir_x(9, dir), y + lengthdir_y(9, dir), objDoorV))
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
                    my_id = instance_create(x + lengthdir_x(20, dir - 3), y + lengthdir_y(20, dir - 3), objBullet);
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
                        my_id.bullet = 1;
                    }
                }
                my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShell);
                my_id.sprite_index = sprUziShell;
                my_id.image_angle = dir;
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackSilencer;
                image_speed = griffinspd + 0.5;
                image_index = 0;
                light = 12;
                impact = 0.75;
                impside = -8;
                break;
            case sprPWalk9mm:
                audio_play_sound(snd9mm, 0, false);
                scrSoundWhileShooting();
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
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttack9mm;
                image_speed = griffinspd + 0.5;
                image_index = 0;
                light = 12;
                impact = 0.85;
                impside = -8;
                break;
            case sprPWalkUzi:
                audio_play_sound(sndUzi, 0, false);
                scrSoundWhileShooting();
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
                    my_id = instance_create(x + lengthdir_x(20, dir - 7), y + lengthdir_y(20, dir - 7), objBullet);
                    scrMuzzle(x + myxspeed + lengthdir_x(26, dir - 1), y + myyspeed + lengthdir_y(26, dir - 1), dir, 2002, 1, 1);
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
                my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShell);
                my_id.sprite_index = sprUziShell;
                my_id.image_angle = dir;
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackUzi;
                image_speed = griffinspd + 1;
                image_index = 0;
                light = 12;
                impact = 0.75;
                impside = -8;
                break;
            case sprPWalkM60:
                audio_play_sound(sndM60, 0, false);
                audio_sound_pitch(audio_play_sound(m60, 0, false), 0.5 + HotWeaponAlpha);
                scrSoundWhileShooting();
                scrHearPlayer();
                ammo -= 1;
                reload = 4 + round(random(2)) + round(HotWeaponAlpha * 2);
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
                }
                else
                {
                    my_id = instance_create(x + lengthdir_x(18, dir - 8), y + lengthdir_y(18, dir - 8), objBullet);
                    scrMuzzle(x + myxspeed + lengthdir_x(32, dir - 3), y + myyspeed + lengthdir_y(32, dir - 3), dir, 1999, 1, 1);
                    if (instance_exists(my_id))
                    {
                        my_id.direction = (dir - 3) + random(6);
                        my_id.speed = 16;
                        my_id.image_angle = my_id.direction;
                        my_id.bullets = 2;
                        my_id.bullet = 2;
                    }
                }
                my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
                my_id.sprite_index = sprM16Shell;
                my_id.image_angle = dir;
                my_id.direction = (dir - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackM60;
                image_speed = 0.55;
                image_index = 0;
                light = 12;
                impact = clamp(1.25 - HotWeaponAlpha, 0, 2);
                impside = -8;
                HotWeaponSwitch = 0;
                HotWeaponAlpha += 0.05;
                HotWeaponSpeed = 0.005;
                break;
            case sprPWalkSilencedUzi:
                audio_play_sound(sndSilencedUzi, 0, false);
                scrSoundWhileShooting();
                ammo -= 1;
                reload = 3;
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
                    my_id = instance_create(x + lengthdir_x(20, dir + 2), y + lengthdir_y(20, dir + 2), objBullet);
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
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackSilencedUzi;
                image_speed = griffinspd + 1;
                image_index = 0;
                light = 12;
                impact = 0.35;
                impside = -8;
                break;
            case sprPWalkAks:
                audio_play_sound(sndAks, 0, false);
                scrSoundWhileShooting();
                scrHearPlayer();
                ammo -= 1;
                reload = 6;
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
                    my_id = instance_create(x + lengthdir_x(26, dir - 1), y + lengthdir_y(26, dir - 1), objBullet);
                    scrMuzzle(x + myxspeed + lengthdir_x(40, dir - 1), y + myyspeed + lengthdir_y(40, dir - 1), dir, 1998, 1, 1);
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
                            my_id.direction = (dir - 6) + random(12);
                        }
                        my_id.speed = 16;
                        my_id.image_angle = my_id.direction;
                    }
                }
                my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShell);
                my_id.sprite_index = sprUziShell;
                my_id.image_angle = dir;
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackAks;
                image_speed = griffinspd + 1;
                image_index = 0;
                light = 12;
                impact = 1;
                impside = -8;
                break;
            case sprPWalkMP5:
                audio_play_sound(sndMP5, 0, false);
                scrSoundWhileShooting();
                scrHearPlayer();
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
                    scrMuzzle(x + myxspeed + lengthdir_x(32, dir - 1), y + myyspeed + lengthdir_y(32, dir - 1), dir, 1998, 1, 1);
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
                my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShell);
                my_id.sprite_index = sprUziShell;
                my_id.image_angle = dir;
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackMP5;
                image_speed = griffinspd + 1;
                image_index = 0;
                light = 12;
                impact = 0.75;
                impside = -8;
                break;
            case sprPWalkToyMP5:
            case sprPAttackToyMP5:
                audio_play_sound(sndWaterMP5, 0, false);
                ammo -= 1;
                reload = 3;
                if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSolid) || place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objDoorV))
                {
                    repeat (5 + round(random(2)))
                    {
                        my_id = instance_create(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objWaterPuddle2);
                        my_id.direction = dir - 140 - random(80);
                        my_id.speed = 0.15 + random(3.5);
                        my_id.image_blend = image_blend;
                        my_id.image_alpha = image_alpha;
                        my_id.image_xscale = 0.5;
                        my_id.image_yscale = my_id.image_xscale;
                    }
                    global.dir = dir;
                    with (my_id)
                    {
                        move_contact_solid(global.dir, 16);
                    }
                }
                else
                {
                    my_id = instance_create(x + lengthdir_x(38, dir), y + lengthdir_y(38, dir), objWaterBullet);
                    scrMuzzle(x + myxspeed + lengthdir_x(36, dir - -4), y + myyspeed + lengthdir_y(36, dir - -4), dir, 2851, 1, 1);
                    if (instance_exists(my_id))
                    {
                        my_id.direction = dir - lengthdir_x(2, global.dir * 5);
                        my_id.image_blend = merge_color(merge_color(c_teal, c_white, 0.75), c_white, 0.5 + lengthdir_x(0.5, global.dir * 4));
                        my_id.speed = 9;
                        my_id.image_angle = my_id.direction;
                    }
                }
                sprite_index = sprPAttackToyMP5;
                image_speed = 0.45;
                image_index = 0;
                light = 6;
                break;
            case sprPigButcherWalkMP5:
                image_index = 0;
                sprite_index = sprPigButcherShoot;
                break;
            case sprPigButcherShoot:
                if (image_index < 2)
                {
                    image_index += 0.25;
                }
                else
                {
                    image_index = 2;
                    audio_play_sound(sndMP5, 0, false);
                    ammo -= 1;
                    reload = 5;
                    global.shake = 5;
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
                        my_id = instance_create(x + lengthdir_x(20, dir - 18), y + lengthdir_y(20, dir - 18), objBullet);
                        if (instance_exists(my_id))
                        {
                            my_id.direction = ((griffinaccuracy + dir) - 5) + random(10);
                            my_id.speed = 16;
                            my_id.image_angle = my_id.direction;
                        }
                    }
                    my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShell);
                    my_id.sprite_index = sprUziShell;
                    my_id.image_angle = dir;
                    my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                    my_id.speed = 1 + random(3);
                    image_speed = griffinspd + 0;
                    light = 12;
                }
                break;
            case sprPWalkMagnum:
                audio_play_sound(sndMagnum, 0, false);
                scrHearPlayer();
                ammo -= 1;
                reload = 14;
                global.shake = 10;
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
                    my_id = instance_create(x + lengthdir_x(20, dir - 7), y + lengthdir_y(20, dir - 7), objBullet);
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
                sprite_index = sprPAttackMagnum;
                image_speed = griffinspd + 0.4;
                image_index = 0;
                light = 12;
                impact = 2.5;
                impside = -8;
                break;
            case sprPWalkScorpion:
                audio_play_sound(sndScorpion, 0, false);
                scrSoundWhileShooting();
                scrHearPlayer();
                ammo -= 1;
                reload = 3;
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
                    my_id = instance_create(x + lengthdir_x(20, dir - 7), y + lengthdir_y(20, dir - 7), objBullet);
                    scrMuzzle(x + myxspeed + lengthdir_x(30, dir - 1), y + myyspeed + lengthdir_y(30, dir - 1), dir, 2002, 1, 1);
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
                my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShell);
                my_id.sprite_index = sprUziShell;
                my_id.image_angle = dir;
                my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                my_id.speed = 1 + random(3);
                sprite_index = sprPAttackScorpion;
                image_speed = griffinspd + 1;
                image_index = 0;
                light = 12;
                impact = 0.5;
                impside = -8;
                break;
            case sprPIdleFlameThrower:
            case sprPWalkFlameThrower:
                HotWeaponAlpha += 0.05;
                HotWeaponSwitch = 0;
                HotWeaponSpeed = 0.01;
                if (flamethrower == 0)
                {
                    audio_play_sound(sndFlameThrowerStart, 0, false);
                }
                if (!audio_is_playing(sndFlameThrower))
                {
                    audio_play_sound(sndFlameThrower, 0, true);
                }
                scrHearPlayer();
                ammo -= 1;
                reload = 0;
                if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid) || place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objDoorV))
                {
                    repeat (3)
                    {
                        my_id = instance_create(x, y, objFireBall);
                        my_id.image_angle = image_angle;
                        global.dir = dir + random_range(-3, 3);
                        with (my_id)
                        {
                            move_contact_solid(global.dir, 16);
                        }
                    }
                }
                else
                {
                    my_id = instance_create(x + lengthdir_x(25, dir - 7), y + lengthdir_y(25, dir - 5), objFlame);
                    if (instance_exists(my_id))
                    {
                        my_id.direction = dir + random_range(-1, 1);
                        my_id.speed = 7 + random(1);
                        my_id.image_angle = my_id.direction;
                        my_id.wavelerp = lengthdir_x(10, global.dir * 14);
                    }
                    my_id = instance_create(x + lengthdir_x(25, dir - 7), y + lengthdir_y(25, dir - 5), objFlameParticle);
                    my_id.direction = dir + random_range(-2, 2);
                    my_id.image_xscale = 0.75 + random(0.5);
                    my_id.image_yscale = my_id.image_xscale;
                    my_id.speed = 3 + random(4);
                    my_id.friction = 0.15;
                    my_id.flamethrower = 1;
                }
                sprite_index = sprPAttackFlameThrower;
                image_speed = griffinspd + 1;
                image_index = 0;
                light = 14;
                break;
            case sprPWalkNailgun:
                audio_sound_pitch(audio_play_sound(sndNailGun, 0, false), 1 + random_range(0.05, -0.05));
                ammo -= 1;
                reload = 10;
                global.shake = 2;
                if (collision_line(x, y, x + lengthdir_x(17, dir), y + lengthdir_y(17, dir), objSolid, false, true) || collision_line(x, y, x + lengthdir_x(17, dir), y + lengthdir_y(17, dir), objDoorV, false, true))
                {
                    audio_play_sound(sndHitWall, 0, false);
                    my_id = instance_create(x, y, objNailAmmo);
                    my_id.speed = 2 + random(2);
                    my_id.direction = dir - 140 - random(80);
                    global.dir = dir;
                    with (my_id)
                    {
                        move_contact_solid(global.dir, 16);
                    }
                }
                else
                {
                    my_id = instance_create(x + lengthdir_x(20, dir - 3), y + lengthdir_y(20, dir - 3), objNail);
                    if (instance_exists(my_id))
                    {
                        my_id.direction = (griffinaccuracy + dir) - random_range(2.5, -2.5);
                        my_id.speed = 16;
                        my_id.image_angle = my_id.direction;
                        my_id.angle = round(my_id.image_angle / 90) * 90;
                    }
                }
                sprite_index = sprPAttackNailgun;
                image_speed = griffinspd + 0.5;
                image_index = 0;
                light = 12;
                impact = 0.15;
                impside = -8;
                break;
            case sprPWalkSkippyAim:
                if (global.chargeSkippy >= 0.9)
                {
                    audio_play_sound(sndSkippyBig, 0, false);
                    scrHearPlayer();
                    ammo -= 1;
                    global.shake = 15;
                    if (place_meeting(x + lengthdir_x(11, dir), y + lengthdir_y(11, dir), objSolid) || place_meeting(x + lengthdir_x(11, dir), y + lengthdir_y(11, dir), objDoorV))
                    {
                        my_id = instance_create(x, y, objBulletSkippyLaser);
                        my_id.direction = -direction;
                        my_id.speed = 16;
                        my_id.image_angle = my_id.direction;
                        my_id.collision = 1;
                    }
                    else
                    {
                        my_id = instance_create(x + lengthdir_x(20, dir - 2), y + lengthdir_y(20, dir - 2), objBulletSkippyLaser);
                        scrMuzzle(x + myxspeed + lengthdir_x(24, dir - 1), y + myyspeed + lengthdir_y(24, dir - 1), dir, 2122, 1, 1);
                        if (instance_exists(my_id))
                        {
                            my_id.direction = (griffinaccuracy + dir) - 3;
                            my_id.speed = 16;
                            my_id.image_angle = my_id.direction;
                        }
                    }
                    my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShellSkippy);
                    my_id.image_angle = dir;
                    my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
                    my_id.speed = 1 + random(3);
                    my_id.glow = 3;
                    my_id.wait = 100;
                    my_id.color0 = 16777215;
                    my_id.color1 = 16777215;
                    sprite_index = sprPAttackSkippyBig;
                    image_speed = 0.25;
                    image_index = 0;
                    light = 20;
                    impact = 8;
                    impside = -8;
                }
                break;
        }
        if ((sprite_index == sprPWalkSkippy || (sprite_index == sprPKillSkippyEnd && image_index >= 5)) && click == 0 && global.DebuffSkippy <= 0)
        {
            audio_play_sound(sndSkippyMedium, 0, false);
            scrHearPlayer();
            ammo -= 0.5;
            global.shake = 8 + round(global.BuffSkippy);
            if (place_meeting(x + lengthdir_x(11, dir), y + lengthdir_y(11, dir), objSolid) || place_meeting(x + lengthdir_x(11, dir), y + lengthdir_y(11, dir), objDoorV))
            {
                global.BuffSkippy = 0;
                if (instance_exists(objBackgroundColor) && objBackgroundColor.lifeIgel != 0)
                {
                    objBackgroundColor.lifeIgel -= 1;
                }
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
                my_id = instance_create(x + lengthdir_x(20, dir - 2), y + lengthdir_y(20, dir - 2), objBulletSkippy);
                scrMuzzle(x + myxspeed + lengthdir_x(24, dir - 1), y + myyspeed + lengthdir_y(24, dir - 1), dir, 2122, 1, 1);
                if (instance_exists(my_id))
                {
                    my_id.direction = ((griffinaccuracy + dir) - 3) + random(2);
                    my_id.speed = 13;
                    my_id.image_angle = my_id.direction;
                    my_id.bullet = 2;
                    my_id.bullets = 2;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShellSkippy);
            my_id.image_angle = dir;
            my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            my_id.glow = 1;
            my_id.wait = 80;
            sprite_index = sprPAttackSkippyMedium;
            image_speed = 0.25;
            image_index = 0;
            light = 12;
            impact = 4 + global.BuffSkippy;
            impside = -8;
            global.DebuffSkippy = 1;
            global.soundDebuff = 0;
            click = 1;
        }
        if ((sprite_index == sprPWalkSkippy || (sprite_index == sprPKillSkippyEnd && image_index >= 5)) && click == 0 && global.DebuffSkippy > 0)
        {
            audio_sound_pitch(audio_play_sound(sndSkippyLow, 0, false), 1 + random_range(0.25, -0.25));
            ammo -= clamp(0.25 - debuffammo, 0.05, 0.25);
            reload = round(debuffammo * 6);
            global.shake = 3;
            if (place_meeting(x + lengthdir_x(11, dir), y + lengthdir_y(11, dir), objSolid) || place_meeting(x + lengthdir_x(11, dir), y + lengthdir_y(11, dir), objDoorV))
            {
                global.BuffSkippy = 0;
                if (instance_exists(objBackgroundColor) && objBackgroundColor.lifeIgel != 0)
                {
                    objBackgroundColor.lifeIgel -= 1;
                }
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
                my_id = instance_create(x + lengthdir_x(20, dir - 2), y + lengthdir_y(20, dir - 2), objBulletSkippy);
                scrMuzzle(x + myxspeed + lengthdir_x(24, dir - 1), y + myyspeed + lengthdir_y(24, dir - 1), dir, 2122, 1, 1);
                if (instance_exists(my_id))
                {
                    my_id.direction = ((griffinaccuracy + dir) - 3) + random(8 + (global.DebuffSkippy * 4));
                    my_id.speed = 6 - global.DebuffSkippy;
                    my_id.image_angle = my_id.direction;
                    my_id.bullet = 0;
                    my_id.bullets = 1;
                }
            }
            my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShellSkippy);
            my_id.image_angle = dir;
            my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
            my_id.speed = 1 + random(3);
            sprite_index = sprPAttackSkippyLow;
            image_speed = 0.5;
            image_index = 0;
            light = 5;
            impact = 2;
            impside = -8 + random_range(-global.DebuffSkippy * 2, global.DebuffSkippy * 2);
            global.DebuffSkippy += 5;
            global.BuffSkippy -= 0.05;
            debuffammo += 0.5;
            click = 1;
        }
    }
    else if (instance_exists(objEffector) && emptyclick == 0 && objEffector.showammo == 1 && (global.ammotype == 0 || global.ammotype == 1 || global.ammotype == 2))
    {
        audio_sound_pitch(audio_play_sound(sndGunEmpty, 0, false), random_range(0.8, 1.5));
        emptyclick = 1;
    }
    if (global.maskindex == 5 && scrIsAttacking(sprite_index))
    {
        impact *= 1.85;
        impside = clamp(impside, -10, 10);
    }
    if (global.maskindex == 16)
    {
        image_speed += (global.combotime / 1000);
        reload = floor(clamp(reload - (global.combotime / 1000), 0, reload));
    }
    mask_index = sprite;
    image_angle = 0;
}
