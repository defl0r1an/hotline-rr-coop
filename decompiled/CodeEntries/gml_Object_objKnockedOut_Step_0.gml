scrMoveSolidOn();
xfix = x;
yfix = y;
if (sprite_index == sprEGetUpLean || sprite_index == sprPoliceGetUpLean)
{
    mask_index = sprEGetUpLeanMask;
    if (instance_exists(objPlayer))
    {
        if (objPlayer.sprite_index == sprPAttackClub || objPlayer.sprite_index == sprPigButcherAttackClub || objPlayer.sprite_index == sprPigButcherAttackPipe || objPlayer.sprite_index == sprPigButcherAttackKnife || objPlayer.sprite_index == sprPigButcherAttackBat || objPlayer.sprite_index == sprPigButcherAttackHammer || (objPlayer.sprite_index == sprPAttackBag && (global.maskindex == 2 || global.maskindex == 27)) || objPlayer.sprite_index == sprGriffinAttackKnife || objPlayer.sprite_index == sprGriffinAttack9mm || objPlayer.sprite_index == sprPAttackCrowbar || objPlayer.sprite_index == sprPAttackSledgeHammer || objPlayer.sprite_index == sprPAttackPan || objPlayer.sprite_index == sprPAttackMachete || objPlayer.sprite_index == sprPAttackChainsaw || objPlayer.sprite_index == sprPAttackPot || objPlayer.sprite_index == sprBoss2AttackCleaver || objPlayer.sprite_index == sprBikerAttackCleaver2 || objPlayer.sprite_index == sprPAttackSledgeHammer || objPlayer.sprite_index == sprPAttackPot || objPlayer.sprite_index == sprPAttackMachete || objPlayer.sprite_index == sprPAttackChainsaw || objPlayer.sprite_index == sprPAttackPan || objPlayer.sprite_index == sprPAttackBat || objPlayer.sprite_index == sprPAttackPipe || objPlayer.sprite_index == sprPAttackButterfly || objPlayer.sprite_index == sprPAttackKnife || objPlayer.sprite_index == sprPAttackSword || objPlayer.sprite_index == sprPAttackNightStick || objPlayer.sprite_index == sprPAttackAxe || (objPlayer.sprite_index == sprPAttackPunch && global.maskindex == 27) || objPlayer.sprite_index == sprPSprintChainsaw || objPlayer.sprite_index == sprPJacketAttackKnuckles || objPlayer.sprite_index == sprPAttackTaser || objPlayer.sprite_index == sprPAttackPool || (objPlayer.sprite_index == sprPSkippyPunch && objPlayer.image_index <= 7) || objPlayer.sprite_index == sprPJacketAttackSkateboard || objPlayer.sprite_index == sprPJacketAttackCleaver || objPlayer.sprite_index == sprPJacketAttackCleaver2)
        {
            addx = lengthdir_x(12, objPlayer.dir);
            addy = lengthdir_y(12, objPlayer.dir);
            objPlayer.x += addx;
            objPlayer.y += addy;
            if (place_meeting(x, y, objPlayer))
            {
                if (objPlayer.sprite_index != sprPAttackTaser)
                {
                    audio_play_sound(sndHit, 0, false);
                    audio_play_sound(sndPunch, 0, false);
                    global.myx = x + lengthdir_x(8, image_angle);
                    global.myy = y + lengthdir_y(8, image_angle);
                    my_id = instance_create(global.myx - 12, global.myy, objBloodPool);
                    repeat (8)
                    {
                        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, dir), (y - 3) + random(6) + lengthdir_y(8, dir), objBloodDrop);
                        my_id.image_xscale = 1 - random(0.2);
                        my_id.image_yscale = my_id.image_xscale;
                        my_id.image_angle = point_direction(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), my_id.x, my_id.y);
                        my_id.sprite_index = sprBloodSplatSmall;
                        my_id.direction = my_id.image_angle;
                        my_id.speed = 2 + random(4);
                        if (room == rmTrainstationEntrance && objTrain.visible == true)
                        {
                            my_id.train = 1;
                        }
                    }
                    repeat (8)
                    {
                        dir = random(360);
                        my_id = instance_create(global.myx + lengthdir_x(4, dir), global.myy + lengthdir_y(4, dir), objBloodSmoke);
                        my_id.direction = dir;
                        my_id.speed = 2 + random(1);
                        my_id.friction = 0.1;
                        if (room == rmTrainstationEntrance && objTrain.visible == true)
                        {
                            my_id.train = 1;
                        }
                    }
                    repeat (4)
                    {
                        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, dir), (y - 3) + random(6) + lengthdir_y(8, dir), objBloodSmudge);
                        my_id.image_xscale = 1 - random(0.2);
                        my_id.image_yscale = my_id.image_xscale;
                        my_id.image_angle = point_direction(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), my_id.x, my_id.y);
                        my_id.direction = random(360);
                        my_id.speed = 1 + random(1);
                        if (room == rmTrainstationEntrance && objTrain.visible == true)
                        {
                            my_id.train = 1;
                        }
                    }
                    repeat (4)
                    {
                        my_id = instance_create(x, y, objBloodSplat);
                        my_id.image_xscale = 1 - random(0.2);
                        my_id.image_yscale = my_id.image_xscale;
                        my_id.image_angle = point_direction(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), my_id.x, my_id.y);
                        my_id.direction = random(360);
                        if (room == rmTrainstationEntrance && objTrain.visible == true)
                        {
                            my_id.train = 1;
                        }
                    }
                }
                my_id = instance_create(x, y - 12, objScore);
                my_id.text = "+" + string(100 + (100 * global.factor)) + "pts";
                global.myscore += (100 + (100 * global.factor));
                global.boldscore = 100 * global.factor;
                global.killscore += 100;
                global.combo += 1;
                global.combotime = 240;
                global.killx[global.kills] = x;
                global.killy[global.kills] = y;
                global.kills += 1;
                global.blink = 1;
                global.shake = 7;
                if (objPlayer.sprite_index == sprPSkippyPunch)
                {
                    switch (global.EnergieSkippyGun)
                    {
                        case 3:
                            audio_play_sound(sndPunchSkippy0, 0, false);
                            break;
                        case 2:
                            audio_play_sound(sndPunchSkippy1, 0, false);
                            break;
                        case 1:
                            audio_play_sound(sndPunchSkippy2, 0, false);
                            break;
                    }
                    global.EnergieSkippyGun -= 1;
                }
                my_id = instance_create(x, y, objDeadBody);
                if (objPlayer.sprite_index == sprPAttackPool)
                {
                    objPlayer.sprite_index = sprPWalkPoolBroke;
                    objPlayer.image_index = 0;
                    objPlayer.image_speed = 0;
                }
                if (objPlayer.sprite_index == sprPAttackTaser)
                {
                    if (sprite_index == sprPoliceGetUpLean)
                    {
                        my_id.sprite_index = sprEPoliceDeadTaserLean;
                    }
                    else
                    {
                        my_id.sprite_index = sprEMafiaDeadTaserLean;
                    }
                    my_id.life = 240 + random(60);
                    my_id.image_speed = 0.25;
                    i = 0;
                    sparks = 10 + floor(random(20));
                    repeat (sparks)
                    {
                        my_id1 = instance_create(x, y, objSpark1);
                        my_id1.direction = (i * 360) / sparks;
                        my_id1.speed = 1.6 + lengthdir_x(0.2, my_id1.direction * sparks * 0.25);
                        my_id1.image_angle = my_id1.direction;
                        i += 1;
                    }
                    repeat (8 + random(8))
                    {
                        my_id1 = instance_create(x, y, objSpark2);
                        my_id1.direction = random(360);
                        my_id1.speed = random(0.6);
                    }
                    instance_create(x, y, objElectricLight);
                    audio_play_sound(sndElectric, 0, false);
                }
                else if (objPlayer.sprite_index == sprPAttackSword || objPlayer.sprite_index == sprPAttackAxe || objPlayer.sprite_index == sprPAttackMachete || objPlayer.sprite_index == sprPAttackChainsaw || objPlayer.sprite_index == sprPSprintChainsaw || objPlayer.sprite_index == sprBoss2AttackCleaver || objPlayer.sprite_index == sprBikerAttackCleaver2 || objPlayer.sprite_index == sprPJacketAttackCleaver || objPlayer.sprite_index == sprPJacketAttackCleaver2)
                {
                    if (sprite_index == sprPoliceGetUpLean)
                    {
                        my_id.sprite_index = sprPoliceShootLean;
                        my_id.image_index = 2;
                        my_id1 = instance_create(x, y, objSeveredHead);
                        my_id1.direction = image_angle - (90 * choose(-1, 1));
                        my_id1.speed = 1.5 + random(1.5);
                        my_id1 = instance_create(x, y, objPoliceHat);
                        my_id1.direction = (image_angle + random_range(-5, 5)) - (90 * objPlayer.left);
                        my_id1.speed = 1.5 + random(1.5);
                    }
                    else
                    {
                        my_id.sprite_index = sprEDeadLean;
                        my_id.image_index = 1;
                        my_id1 = instance_create(x, y, objSeveredHead);
                        my_id1.direction = image_angle - (90 * choose(-1, 1));
                        my_id1.speed = 1.5 + random(1.5);
                    }
                }
                else if (sprite_index == sprPoliceGetUpLean)
                {
                    my_id.sprite_index = sprPoliceDeadWall;
                    my_id.image_index = floor(random(9));
                    my_id1 = instance_create(x, y, objPoliceHat);
                    my_id1.direction = (image_angle + random_range(-5, 5)) - (90 * objPlayer.left);
                    my_id1.speed = 1.5 + random(1.5);
                }
                else
                {
                    my_id.sprite_index = sprEDeadWall;
                    my_id.image_index = 3 + floor(random(6));
                }
                my_id.image_angle = angle;
                my_id.image_yscale = objPlayer.left;
                instance_destroy();
                scrMoveSolidOff();
                objPlayer.x -= addx;
                objPlayer.y -= addy;
                exit;
            }
            objPlayer.x -= addx;
            objPlayer.y -= addy;
        }
    }
    mask_index = sprMask;
}
if (image_speed > 0)
{
    exit;
}
if (!place_free(x, y))
{
    if (speed > 0)
    {
        move_outside_solid(direction - 180, 8);
    }
    else if (place_free(x + lengthdir_x(7, direction - 180), y + lengthdir_y(7, direction - 180)))
    {
        dir = direction;
        if (sprite_index == sprEGetUp)
        {
            sprite_index = sprEGetUpLean;
        }
        if (sprite_index == sprPoliceGetUp)
        {
            sprite_index = sprPoliceGetUpLean;
        }
        direction = round(direction * 0.011111111111111112) * 90;
        if (place_free(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction)))
        {
            direction = dir;
            if (sprite_index == sprEGetUpLean)
            {
                sprite_index = sprEGetUp;
            }
            if (sprite_index == sprPoliceGetUpLean)
            {
                sprite_index = sprPoliceGetUp;
            }
        }
    }
    speed = 0;
}
else if (!place_free(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction)))
{
    move_contact_solid(direction, 8);
    dir = direction;
    if (sprite_index == sprEGetUp)
    {
        sprite_index = sprEGetUpLean;
    }
    if (sprite_index == sprPoliceGetUp)
    {
        sprite_index = sprPoliceGetUpLean;
    }
    direction = round(direction * 0.011111111111111112) * 90;
    if (place_free(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction)))
    {
        direction = dir;
        if (sprite_index == sprEGetUpLean)
        {
            sprite_index = sprEGetUp;
        }
        if (sprite_index == sprPoliceGetUpLean)
        {
            sprite_index = sprPoliceGetUp;
        }
    }
}
scrMoveSolidOff();
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
angle = direction;
