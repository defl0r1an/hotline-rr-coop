if (sprite_index == sprPAttackPunch || sprite_index == sprPAttackBag || sprite_index == sprPAttackDrill || sprite_index == sprPPushing)
{
    lastx = x;
    lasty = y;
    global.spacex = lengthdir_x(12, dir);
    global.spacey = lengthdir_y(12, dir);
    x += global.spacex;
    y += global.spacey;
    global.my_id = id;
    if (sprite_index != sprPPushing)
    {
        with (objGlassPanelH)
        {
            if (place_meeting(x, y, global.my_id))
            {
                SteamIncStat("Windows", 1);
                if (global.my_id.lasty < (y + 2))
                {
                    add = -1;
                }
                else
                {
                    add = 1;
                }
                i = 0;
                repeat (24)
                {
                    my_id = instance_create(x + (i * 1.5), y, objShard);
                    my_id.speed = random(5);
                    my_id.direction = ((add * 90) - 8) + random(16);
                    i += 1;
                }
                instance_create(x, y, objGlassPanelHBroken);
                global.shake = 5;
                instance_destroy();
                audio_play_sound(choose(sndGlass1, sndGlass2), 1, false);
            }
        }
        with (objGlassPanelV)
        {
            if (place_meeting(x, y, global.my_id))
            {
                SteamIncStat("Windows", 1);
                if (global.my_id.lastx < (x + 2))
                {
                    add = -1;
                }
                else
                {
                    add = 1;
                }
                i = 0;
                repeat (24)
                {
                    my_id = instance_create(x, y + (i * 1.5), objShard);
                    my_id.speed = random(5);
                    my_id.direction = ((90 + (add * 90)) - 8) + random(16);
                    i += 1;
                }
                instance_create(x, y, objGlassPanelVBroken);
                global.shake = 5;
                instance_destroy();
                audio_play_sound(choose(sndGlass1, sndGlass2), 1, false);
            }
        }
    }
    x += lengthdir_x(12, dir);
    y += lengthdir_y(12, dir);
    if ((global.maskindex == 2 && global.hardmode == 1) || (global.maskindex == 27 && global.powerIgel == 1 && sprite_index == sprPPushing))
    {
        with (objEnemy)
        {
            if (object_index == objEnemyFat || object_index == objInspector || object_index == objEFatGunner)
            {
                if (place_meeting(x, y, objPlayer) || place_meeting(x + global.spacex, y + global.spacey, objPlayer))
                {
                    mask_index = sprWeaponMask;
                    if (scrCollisionLineExt(x, y, objPlayer.lastx, objPlayer.lasty, 4, 309, 99, 131))
                    {
                        scrMoveSolidOff();
                        mask_index = sprMask;
                        objPlayer.x = objPlayer.lastx;
                        objPlayer.y = objPlayer.lasty;
                        exit;
                    }
                    mask_index = sprMask;
                    edir = point_direction(objPlayer.lastx, objPlayer.lasty, x, y);
                    audio_play_sound(sndDoorHit, 1, false);
                    global.shake = 5;
                    my_id = instance_create(x, y, objFatKnockedOut);
                    my_id.type = object_index;
                    if (global.maskindex == 27)
                    {
                        my_id.speed = 2;
                        my_id.reload = 30 + round(random(60));
                    }
                    if (scrIsPolice(object_index))
                    {
                        if (object_index == objInspector)
                        {
                            my_id.sprite_index = sprEInspectorGetUp;
                        }
                        else
                        {
                            my_id.sprite_index = sprPoliceGetUp;
                        }
                    }
                    else if (object_index == objEFatGunner)
                    {
                        my_id.sprite_index = sprEFatGunGetUp;
                        my_id.ammo = ammo;
                    }
                    my_id.direction = (edir - 10) + random(20);
                    my_id.angle = my_id.direction;
                    with (my_id)
                    {
                        move_outside_solid(angle - 180, 16);
                    }
                    my_id.speed = 3;
                    scrIdleGetEnemy();
                    if (sprite_index == sprEFatWalk || sprite_index == sprEFatAttack || sprite_index == sprPInspectorWalk || sprite_index == sprPInspectorAttack || sprite_index == sprEFatGunWalk || sprite_index == sprEFatGunAttack)
                    {
                        noweapon = 1;
                    }
                    else
                    {
                        noweapon = 0;
                    }
                    if (noweapon == 0)
                    {
                        global.test = 0;
                        with (objEnemy)
                        {
                            if (alert == 1)
                            {
                                global.test += 1;
                            }
                        }
                        my_id = instance_create(x, y - 12, objScore);
                        my_id.text = "+" + string(200 + (400 * global.factor)) + "pts";
                        global.myscore += (200 + (400 * global.factor));
                        global.boldscore += (200 + (400 * global.factor));
                        global.combotime += 100;
                        global.killx[global.kills] = x;
                        global.killy[global.kills] = y;
                        global.kills += 1;
                        my_id = instance_create(x, y, objWeaponThrow);
                        my_id.direction = (direction - 70) + random(40);
                        my_id.speed = 2 + random(2);
                        if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
                        {
                            my_id2 = instance_create(x, y, objWeaponThrow);
                            my_id2.image_index = 29;
                            my_id2.direction = (other.direction - 70) + random(40);
                            my_id2.speed = 2 + random(2);
                            my_id.image_index = 29;
                            my_id.ammo = ammo / 2;
                            my_id2.ammo = ammo / 2;
                        }
                        else
                        {
                            my_id.image_index = scrCurrentWeaponExt(sprite_index);
                            my_id.ammo = ammo;
                        }
                    }
                    instance_destroy();
                }
            }
        }
    }
    with (objEnemy)
    {
        if (scrCantGetHit(object_index) || ((object_index == objEDodger || object_index == objEDodgerPatrol) && global.maskindex != 2) || ((object_index == objEDodgerG || object_index == objEDodgerGPatrol) && global.maskindex != 2))
        {
            valid = 0;
        }
        else
        {
            valid = 1;
        }
        if (global.maskindex == 27 && (object_index == objEDodgerG || object_index == objEDodgerGPatrol || object_index == objEDodger || object_index == objEDodgerPatrol || object_index == objDogPatrol))
        {
            valid = 1;
        }
        if ((place_meeting(x, y, objPlayer) || place_meeting(x + global.spacex, y + global.spacey, objPlayer)) && valid == 1)
        {
            mask_index = sprWeaponMask;
            if (scrCollisionLineExt(x, y, objPlayer.lastx, objPlayer.lasty, 4, 309, 99, 131))
            {
                scrMoveSolidOff();
                mask_index = sprMask;
                objPlayer.x = objPlayer.lastx;
                objPlayer.y = objPlayer.lasty;
                exit;
            }
            mask_index = sprMask;
            edir = point_direction(objPlayer.lastx, objPlayer.lasty, x, y);
            audio_play_sound(sndDoorHit, 1, false);
            global.shake = 5;
            my_id = instance_create(x, y, objKnockedOut);
            my_id.speed = 3;
            if (global.maskindex == 27)
            {
                my_id.speed = 2;
                my_id.reload = 100 + round(random(120));
            }
            my_id.type = object_index;
            if (scrIsPolice(object_index))
            {
                my_id.sprite_index = sprPoliceGetUp;
            }
            my_id.direction = (edir - 10) + random(20);
            my_id.angle = my_id.direction;
            if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
            {
                my_id.reload = 90 + random(60);
                my_id.sprite_index = sprEMafiaGunDodgerGetUp;
                my_id.start_x_static = start_x;
                my_id.start_y_static = start_y;
            }
            if (object_index == objEDodger || object_index == objEDodgerPatrol)
            {
                my_id.reload = 90 + random(60);
                my_id.sprite_index = sprEMafiaDodgerGetUp;
                my_id.start_x_static = start_x;
                my_id.start_y_static = start_y;
            }
            if (object_index == objDogPatrol)
            {
                my_id.reload = 45 + random(30);
                my_id.sprite_index = sprEDogGetUp;
                my_id.speed = 3.5;
            }
            with (my_id)
            {
                move_outside_solid(angle - 180, 16);
            }
            scrIdleGetEnemy();
            if (scrNoweapon(sprite_index) == 1 || object_index == objEDodger || object_index == objEDodgerPatrol || object_index == objEDodgerG || object_index == objEDodgerGPatrol)
            {
                noweapon = 1;
            }
            else
            {
                noweapon = 0;
            }
            if (noweapon == 0 && (global.maskindex != 11 || (global.maskindex == 11 && objPlayer.sprite_index != sprPAttackPunch)))
            {
                global.test = 0;
                with (objEnemy)
                {
                    if (alert == 1)
                    {
                        global.test += 1;
                    }
                }
                my_id = instance_create(x, y - 12, objScore);
                my_id.text = "+" + string(200 + (400 * global.factor)) + "pts";
                global.myscore += (200 + (400 * global.factor));
                global.boldscore += (200 + (400 * global.factor));
                global.combotime += 100;
                global.killx[global.kills] = x;
                global.killy[global.kills] = y;
                global.kills += 1;
                my_id = instance_create(x, y, objWeaponThrow);
                my_id.direction = (direction - 70) + random(40);
                my_id.speed = 2 + random(2);
                if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
                {
                    my_id2 = instance_create(x, y, objWeaponThrow);
                    my_id2.image_index = 28;
                    my_id2.direction = (other.direction - 70) + random(40);
                    my_id2.speed = 2 + random(2);
                    my_id.image_index = 28;
                    my_id.ammo = round(ammo / 2);
                    my_id2.ammo = round(ammo / 2);
                }
                else
                {
                    my_id.image_index = scrCurrentWeaponExt(sprite_index);
                    my_id.ammo = ammo;
                }
            }
            if (noweapon == 0 && global.maskindex == 11 && objPlayer.sprite_index == sprPAttackPunch)
            {
                global.test = 0;
                with (objEnemy)
                {
                    if (alert == 1)
                    {
                        global.test += 1;
                    }
                }
                my_id = instance_create(x, y - 12, objScore);
                my_id.text = "+" + string(200 + (400 * global.factor)) + "pts";
                global.myscore += (200 + (400 * global.factor));
                global.boldscore += (200 + (400 * global.factor));
                global.combotime += 100;
                global.killx[global.kills] = x;
                global.killy[global.kills] = y;
                global.kills += 1;
                objPlayer.sprite_index = scrIndexToWeapon(scrCurrentWeaponExt(sprite_index));
                objPlayer.ammo = ammo;
                objPlayer.image_speed = 0;
            }
            instance_destroy();
        }
    }
    x = lastx;
    y = lasty;
}
