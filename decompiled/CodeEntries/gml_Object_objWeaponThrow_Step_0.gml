angle += (speed * 5 * diradd);
if (speed <= 0)
{
    my_id = instance_create(x, y, objWeapon);
    if (decadenced == 1 || instance_exists(objVan))
    {
        my_id.decadenced = 0;
    }
    if (room == rmTrainstationEntrance && objTrain.visible == true)
    {
        my_id.train = 1;
    }
    my_id.image_angle = angle;
    my_id.image_index = image_index;
    my_id.image_yscale = left;
    my_id.ammo = ammo;
    my_id.hotalpha = hotalpha;
    my_id.const = 1;
    my_id.enemyused = enemyused;
    instance_destroy();
}
if (speed > 2.5)
{
    mask_index = sprite_index;
    global.my_id = id;
    if (lerp(hotalpha, 0, 0.05) > 0)
    {
        hotalpha = lerp(hotalpha, 0, 0.05);
    }
    with (objEnemy)
    {
        if (scrCantGetHit(object_index))
        {
            nothing = 1;
        }
        else if (place_meeting(x, y, global.my_id))
        {
            if (object_index == objEnemyFat)
            {
                global.my_id.direction = point_direction(x, y, global.my_id.x, global.my_id.y);
                global.my_id.speed *= 0.8;
                exit;
            }
            if (object_index == objEDodger || object_index == objEDodgerG || object_index == objEDodgerPatrol || object_index == objEDodgerGPatrol)
            {
                exit;
            }
            if ((global.my_id.image_index == 5 && round(random(5)) < 4) || (global.my_id.image_index == 5 && global.maskindex == 6) || global.my_id.image_index == 47 || global.my_id.image_index == 49)
            {
                if (global.my_id.bounce == 1)
                {
                    scrAchievementSet("Playing Pool");
                }
                scrKnifeThrowHits();
            }
            else if (global.maskindex == 24)
            {
                if (global.my_id.bounce == 1)
                {
                    scrAchievementSet("Playing Pool");
                }
                global.blink = 1;
                audio_play_sound(sndHit, 0, false);
                audio_play_sound(sndPunch, 0, false);
                audio_play_sound(sndBonesBreak, 0, false);
                scrEnemyDieMelee();
                global.shake = 4;
            }
            else
            {
                if (global.my_id.bounce == 1)
                {
                    scrAchievementSet("Playing Pool");
                }
                audio_play_sound(sndDoorHit, 0, false);
                global.shake = 3;
                scrIdleGetEnemy();
                my_id = instance_create(x, y, objKnockedOut);
                if (global.my_id.enemy == 1)
                {
                    scrAchievementSet("Domino Effect");
                }
                my_id.type = object_index;
                if (scrIsPolice(object_index))
                {
                    my_id.sprite_index = sprPoliceGetUp;
                }
                my_id.direction = (global.my_id.direction - 10) + random(20);
                my_id.angle = my_id.direction;
                with (my_id)
                {
                    move_outside_solid(angle - 180, 16);
                }
                my_id.speed = global.my_id.speed * 0.25;
                global.my_id.speed *= -0.8;
                if (sprite_index == sprEWalkUnarmed || sprite_index == sprPoliceWalkUnarmed)
                {
                    noweapon = 1;
                }
                else
                {
                    noweapon = 0;
                }
                scrIdleGetEnemy();
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
                    my_id.text = "+" + string(300 * global.factor) + "pts";
                    global.myscore += (300 * global.factor);
                    global.boldscore += (300 * global.factor);
                    global.combotime += 100;
                    global.killx[global.kills] = x;
                    global.killy[global.kills] = y;
                    global.kills += 1;
                    my_id = instance_create(x, y, objWeaponThrow);
                    my_id.direction = (direction - 70) + random(40);
                    my_id.image_index = scrCurrentWeaponExt(sprite_index);
                    my_id.speed = 2 + random(2);
                    my_id.ammo = ammo;
                    my_id.enemy = 1;
                }
                instance_destroy();
            }
        }
    }
}
if (image_index == 43)
{
    my_id = instance_create(x, y, objThrowingWeaponSkippy);
    my_id.direction = direction;
    my_id.image_index = 8;
    my_id.depth = -4;
    instance_destroy();
}
mask_index = sprWeaponMask;
