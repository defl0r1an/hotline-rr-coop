if (global.deadIgel == 1)
{
    if (instance_exists(objPlayer))
    {
        _diff = angle_difference(point_direction(x, y, objPlayer.x, objPlayer.y), direction);
        direction += (_diff * 0.1);
    }
    image_index = 0;
    speed = 0;
    exit;
}
if (sprite_index == sprBoss1PryKnife && knife == 0 && image_index > 19)
{
    my_id = instance_create(x + lengthdir_x(8, direction), y + lengthdir_y(8, direction), objDennisThrowingKnife);
    global.dir = direction;
    with (my_id)
    {
        move_contact_solid(global.dir, 12);
    }
    my_id.direction = direction;
    my_id.image_angle = direction;
    my_id.speed = 12;
    my_id.enemy = 1;
    audio_play_sound(sndThrow, 0, false);
    knife = 1;
}
lastammo = ammo;
if (weaponget == 1 && (throwweapon == 1 || throwweapon == 2))
{
    if (throwweapon != 2)
    {
        sprite_index = sprBoss1Walk;
    }
    my_id = instance_create(x, y, objWeaponThrow);
    my_id.image_index = 1;
    my_id.direction = direction + 70 + random(40);
    my_id.speed = 0.5 + random(0.75);
    my_id.ammo = lastammo;
    my_id.decadenced = 0;
    weaponget = -2;
    throwweapon = 0;
}
if (!instance_exists(objPlayer))
{
    speed = 0;
    state = 1000;
    if (sprite_index == sprBoss1Walk)
    {
        image_speed = 0;
    }
    path_end();
}
if (sprite_index == sprBoss1Taunt)
{
    image_speed = 0;
    speed = 0;
    path_end();
    if (image_index < 4)
    {
        image_index += 0.15;
    }
    else
    {
        sprite_index = sprBoss1Walk;
        alert = 1;
    }
    exit;
}
if (sprite_index == sprBoss1TauntShotgun)
{
    image_speed = 0;
    speed = 0;
    path_end();
    if (image_index < 4)
    {
        image_index += 0.15;
    }
    else
    {
        sprite_index = sprBoss1WalkShotgun;
        alert = 1;
    }
    exit;
}
if (sprite_index == sprBoss1KillPlayer)
{
    if (image_index >= 9 && killstage == 0)
    {
        repeat (8)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, direction), (y - 3) + random(6) + lengthdir_y(8, direction), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, direction), y + lengthdir_y(8, direction), my_id.x, my_id.y);
            my_id.sprite_index = sprBloodSplatSmall;
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(4);
            my_id.decadenced = 1;
        }
        repeat (2 + random(3))
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, direction), (y - 3) + random(6) + lengthdir_y(8, direction), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, direction), y + lengthdir_y(8, direction), my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = 1 + random(5);
            my_id.decadenced = 1;
        }
        repeat (4)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, direction), (y - 3) + random(6) + lengthdir_y(16, direction), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = (direction - 20) + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
            my_id.decadenced = 1;
        }
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndPunch, 0, false);
        killstage = 1;
    }
    if (image_index >= 11 && killstage == 1)
    {
        my_id = instance_create(x + lengthdir_x(12, direction), y + lengthdir_y(12, direction), objPlayerDead);
        my_id.sled = 0;
        my_id.speed = 2 + random(0.5);
        my_id.direction = direction;
        my_id.image_angle = direction;
        my_id.sprite_index = sprPJacketDeadBoss1;
        my_id.image_index = 0;
        killstage = 2;
    }
    path_end();
    exit;
}
if (instance_exists(objPlayer) && (kill == 1 || kill == 2))
{
    sound_play(choose(sndSwing1, sndSwing2));
    if ((kill == 2 || randomkill == 1) && instance_exists(objPlayer))
    {
        image_index = 0;
        sprite_index = sprBoss1KillPlayer;
        image_speed = 0.25;
        my_id = instance_create(x, y, objMaskDrop);
        my_id.image_index = global.maskindex;
        my_id.speed = 2 + random(1);
        my_id.direction = direction + random_range(-30, 30);
        with (objPlayer)
        {
            lastweapon = scrCurrentWeapon();
            lastammo = ammo;
            global.exposed = 0;
            release = 0;
            if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch)
            {
                nothing = 1;
            }
            else
            {
                my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
                if (room == rmHouse1Downstairs && decadenced == 1)
                {
                    my_id.decadenced = 1;
                }
                my_id.image_index = lastweapon;
                my_id.direction = dir + 70 + random(40);
                my_id.speed = 1 + random(2);
                my_id.ammo = lastammo;
                decadenced = 0;
                sprite_index = sprPWalkUnarmed;
            }
            instance_destroy();
        }
        audio_play_sound(sndSwing2, 0, false);
        speed = 0;
        state = 1000;
        global.my_id = id;
        kill = 0;
        exit;
    }
    if (randomkill == 0)
    {
        sprite_index = sprBoss1Attack;
        image_speed = 0.25;
        image_index = 0;
        speed = 0;
        global.my_id = id;
        if (instance_exists(objPlayer))
        {
            scrPlayerDieMelee();
        }
        kill = 0;
        exit;
    }
}
if (state == 0)
{
    if (objEffector.amount >= 180)
    {
        if (instance_exists(objPlayerMouse))
        {
            with (objPlayerMouse)
            {
                my_id = instance_create(x, y, objPlayerMouseHouse);
                my_id.active = 0;
                my_id.sprite_index = sprite_index;
                my_id.image_speed = image_speed;
                my_id.image_index = image_index;
                my_id.ammo = ammo;
                global.maskon = 1;
                my_id.maskon = 1;
                instance_destroy();
            }
        }
        sxeasy_play(global.Release);
        scrGetMessage(0);
        state = 1;
        test = objPlayer.persistent;
        objPlayer.persistent = false;
        global.loaded = 1;
        global.loaded = 0;
        with (objWeapon)
        {
            decadenced = 1;
        }
        objPlayer.persistent = test;
    }
}
if (state == 1)
{
    if (!instance_exists(objPhoneConversation))
    {
        state = 2;
        if (global.hardmode == 1)
        {
            weaponget = 0;
        }
        with (objPlayer)
        {
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.active = 0;
            my_id.sprite_index = sprite_index;
            my_id.ammo = ammo;
            my_id.maskon = 1;
            my_id.decadenced = 1;
            my_id.maskindex = global.maskindex;
            instance_destroy();
        }
        with (objBackgroundColor)
        {
            if (global.hardmode == 0)
            {
                lifeIgel = 4;
            }
            else
            {
                lifeIgel = 1;
            }
        }
        global.IgelEmotions = "IgelBlink";
        scrSetRasmusEvent(choose("Kill that fatass", "Not a huge problem", "Is there any shotguns?"), 8, 75);
    }
}
if (state == 2)
{
    if (weaponget == 0)
    {
        inst = instance_nearest(x, y, objStoika);
        if (point_distance(x, y, inst.x, inst.y) < 24)
        {
            inst.image_index = 1;
            audio_play_sound(sndShotgunPulling, 0, false);
            sprite_index = sprBoss1WalkShotgun;
            speed = 0;
            weaponget = 1;
        }
        else
        {
            direction = point_direction(x, y, inst.x, inst.y);
            speed = 2.5;
            image_index += 0.3;
            image_speed = 0;
        }
    }
    if (weaponget == 0)
    {
        exit;
    }
    if (pathcreate == 0)
    {
        scrEMeleeInit();
        state = 2;
        alert = 1;
        pathcreate = 1;
    }
    if (instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) < 24)
    {
        if ((objPlayer.sprite_index == sprPJacketAttackKnuckles && global.maskindex == 2 && global.hardmode == 1) || (objPlayer.sprite_index == sprPAttackPunch && global.maskindex == 27) || (objPlayer.sprite_index == sprPAttackAxe && global.maskindex == 17) || (objPlayer.sprite_index == sprPAttackSledgeHammer && global.maskindex == 17) || (objPlayer.sprite_index == sprPAttackSword && global.maskindex == 17) || (objPlayer.sprite_index == sprPAttackMachete && global.maskindex == 17) || objPlayer.sprite_index == sprPAttackChainsaw || objPlayer.sprite_index == sprPPushing)
        {
            global.test = 0;
            with (objPlayer)
            {
                global.test = 1;
            }
            if (global.test == 1)
            {
                if (objPlayer.sprite_index != sprPPushing)
                {
                    audio_play_sound(sndHit, 0, false);
                }
                audio_play_sound(sndPunch, 0, false);
                global.shake = 5;
                my_id = instance_create(x, y, objBoss1Down);
                my_id.direction = point_direction(global.my_id.x, global.my_id.y, x, y);
                my_id.ammo = ammo;
                my_id.image_angle = my_id.direction;
                my_id.speed = 1;
                my_id.friction = 0.1;
                if (objPlayer.sprite_index != sprPPushing)
                {
                    my_id.energie = energie - 1;
                }
                else
                {
                    my_id.image_index = 2;
                    my_id.energie = energie;
                }
                if (weaponget == 1)
                {
                    my_id.sprite_index = sprBoss1ShotShotgun;
                }
                if (energie <= 1)
                {
                    my_id.image_index = 1;
                }
                if (energie <= 0)
                {
                    my_id.dead = 1;
                    my_id.wait = 90;
                }
                instance_destroy();
            }
        }
        else if (instance_exists(objPlayer) && scrIsSwinging(objPlayer.sprite_index))
        {
            audio_play_sound(sndKnifeWall, 0, false);
            if (global.maskindex != 6 && global.hardmode == 1)
            {
                with (objPlayer)
                {
                    lastweapon = scrCurrentWeapon();
                    lastammo = ammo;
                    global.exposed = 0;
                    release = 0;
                    if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch)
                    {
                        nothing = 1;
                    }
                    else
                    {
                        my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
                        if (room == rmHouse1Downstairs && decadenced == 1)
                        {
                            my_id.decadenced = 1;
                        }
                        my_id.image_index = lastweapon;
                        my_id.direction = dir + 70 + random(40);
                        my_id.speed = 1 + random(2);
                        my_id.ammo = lastammo;
                        decadenced = 0;
                        sprite_index = sprPWalkUnarmed;
                    }
                }
            }
            if (hit < 2)
            {
                if (weaponget == 1)
                {
                    sprite_index = sprBoss1TauntShotgun;
                }
                else
                {
                    sprite_index = sprBoss1Taunt;
                }
                image_index = 0;
                hit = 2;
                exit;
            }
        }
    }
    if (x < 0)
    {
        hspeed = abs(hspeed);
    }
    if (x > room_width)
    {
        hspeed = -abs(hspeed);
    }
    if (y < 0)
    {
        vspeed = abs(vspeed);
    }
    if (y > room_height)
    {
        vspeed = -abs(vspeed);
    }
    if (sprite_index == sprEWalkUnarmed)
    {
        nothing = 0;
    }
    else
    {
        global.factor += sign(alert);
    }
    scrMoveSolidOn();
    if (!place_free(x + (hspeed * 3), y + (vspeed * 3)))
    {
        if (!place_free(x + (hspeed * 3), y))
        {
            hspeed = -hspeed;
        }
        if (!place_free(x, y + (vspeed * 3)))
        {
            vspeed = -vspeed;
        }
    }
    if (path_index > 0)
    {
        if (path_position == 1)
        {
            path_end();
        }
    }
    else
    {
        image_speed = speed * 0.1;
    }
    scrMoveSolidOff();
    if (!instance_exists(objPlayer))
    {
        alert = 0;
        speed = 0;
        exit;
    }
    if (global.notarget == 0)
    {
        if (alertwait > -1)
        {
            if (alertwait == 0)
            {
                path_end();
                alert = 1;
            }
            alertwait -= 1;
        }
        if (path_position == 1)
        {
            path_end();
            alert = 2;
            lookreload = 0;
        }
        if (lookreload > 0)
        {
            lookreload -= 1;
        }
        else
        {
            seen = scrLook(objPlayer.x, objPlayer.y, 12);
            if (seen == 0)
            {
                path_end();
                alert = 1;
            }
            if (seen == 2)
            {
                path_end();
                alert = 2;
            }
            if (seen == 1 && alert > 0)
            {
                if (alert < 3)
                {
                    alert = 2;
                    chasereload = 0;
                }
            }
            lookreload = 8;
        }
        if (alert < 2 && alert > 0)
        {
            if (weaponget == 1)
            {
                if (instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) <= 20)
                {
                    kill = 2;
                    throwweapon = 1;
                    reload = 0;
                    alert = 1;
                }
                if (reload > 0)
                {
                    reload -= 1;
                }
                else if (kill != 2)
                {
                    mask_index = sprWeaponMask;
                    if (!scrCollisionLineDouble(x, y, objPlayer.x, objPlayer.y, 4, 309, 309))
                    {
                        if (!scrCollisionLine(x, y, objPlayer.x, objPlayer.y, 4, 317))
                        {
                            path_end();
                            if (point_distance(x, y, objPlayer.x, objPlayer.y) > 40)
                            {
                                speed = 3;
                                image_index += 0.3;
                                image_speed = 0;
                            }
                            else
                            {
                                speed = 0;
                                image_speed = 0;
                            }
                        }
                        direction = point_direction(x, y, objPlayer.x, objPlayer.y);
                        if (reloadshoot > 0)
                        {
                            reloadshoot -= 1;
                        }
                        else if (ammo > 0 && point_distance(x, y, objPlayer.x, objPlayer.y) > 20)
                        {
                            if (sprite_index == sprBoss1WalkShotgun)
                            {
                                audio_play_sound(sndShotgun, 0, false);
                                ammo -= 1;
                                shake = 3;
                                reloadshoot = 10;
                                angle = direction;
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
                                my_id.deadlined = 1;
                                my_id.image_angle = angle;
                                my_id.direction = (angle - (90 * image_yscale) - 20) + random(30);
                                my_id.speed = 1 + random(3);
                                light = 20;
                                sprite_index = sprBoss1AttackShotgun;
                                mask_index = sprMask;
                                image_speed = 0.5;
                            }
                        }
                        if (ammo == 0)
                        {
                            throwweapon = 1;
                        }
                    }
                    else
                    {
                        reload = 20;
                        path_end();
                        if (mp_grid_path(global.grid, path, x, y, (objPlayer.x - 32) + random(64), (objPlayer.y - 32) + random(64), true) > 0)
                        {
                            path_start(path, 2.5, path_action_stop, 1);
                            image_speed = 0.3;
                            speed = 0;
                        }
                        else
                        {
                            image_speed = 0;
                            speed = 0;
                        }
                    }
                    mask_index = sprMask;
                }
            }
            else
            {
                scrAttack(objPlayer.x, objPlayer.y, 10, 4);
                if (reload > 0)
                {
                    reload -= 1;
                }
                else if (point_distance(x, y, objPlayer.x, objPlayer.y) < 22)
                {
                    kill = 1;
                }
            }
        }
        if (alert == 2)
        {
            scrChase(path, objPlayer.x, objPlayer.y);
            alert = 3;
        }
        if (alert == 3)
        {
            scrMeleeChaseSearch(objPlayer.x, objPlayer.y, 4);
        }
        if (sprite_index != sprBoss1Attack)
        {
            if (path_index >= 0)
            {
                image_speed = path_speed * 0.1;
            }
            else
            {
                image_speed = speed * 0.1;
            }
        }
    }
    if (sprite_index == sprBoss1AttackShotgun)
    {
        image_speed = 0.5;
    }
    scrMoveSolidOff();
}
if (state == 1001)
{
    if (instance_exists(objPlayer))
    {
        global.check = scrLook(objPlayer.x, objPlayer.y, 4);
        if (global.check == 0 || global.check == 2)
        {
            _diff = angle_difference(point_direction(x, y, objPlayer.x, objPlayer.y), direction);
            direction += (_diff * 0.5);
        }
    }
    image_speed = 0.25;
    if (instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) < 22)
    {
        if (objPlayer.sprite_index == sprPAttackButterfly && global.maskindex == 6)
        {
            global.test = 0;
            with (objPlayer)
            {
                if (place_meeting(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBoss1))
                {
                    global.test = 1;
                }
            }
            if (global.test == 1)
            {
                my_id = instance_create(x + lengthdir_x(8, random(360)), y + lengthdir_y(8, random(360)), objDennisThrowingKnife);
                global.dir = direction;
                with (my_id)
                {
                    move_contact_solid(global.dir, 12);
                }
                my_id.direction = random(360);
                my_id.image_angle = random(360);
                my_id.speed = 0;
                audio_play_sound(sndHit, 0, false);
                audio_play_sound(sndHitWall, 0, false);
                global.shake = 5;
                my_id = instance_create(x, y, objBoss1Down);
                my_id.direction = point_direction(global.my_id.x, global.my_id.y, x, y);
                my_id.image_angle = my_id.direction;
                my_id.speed = 1;
                my_id.friction = 0.1;
                my_id.energie = energie - 1;
                if (energie <= 1)
                {
                    my_id.image_index = 1;
                }
                if (energie <= 0)
                {
                    my_id.dead = 1;
                    my_id.wait = 90;
                }
                instance_destroy();
                exit;
            }
        }
    }
}
