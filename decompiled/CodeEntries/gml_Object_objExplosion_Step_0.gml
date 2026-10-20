global.test = 0;
if (instance_exists(objPlayerMouse) && global.maskindex == 2 && global.hardmode == 1)
{
    switch (tony)
    {
        case 0:
            global.test = 1;
            tony = 1;
            break;
        case 1:
            global.test = 0;
            break;
    }
}
with (objDoorH)
{
    if (sprite_index == sprBombDoorH)
    {
        if (image_angle > 0 || image_angle < 0)
        {
            global.test = 1;
            instance_destroy();
        }
    }
}
with (objDoorH2)
{
    if (sprite_index == sprBombDoorH)
    {
        if (image_angle > 0 || image_angle < 0)
        {
            global.test = 1;
            instance_destroy();
        }
    }
}
with (objDoorV2)
{
    if (sprite_index == sprBombDoorV)
    {
        if (image_angle > 0 || image_angle < 0)
        {
            global.test = 1;
        }
    }
}
if (global.test == 1 || RPGJOKE == 1)
{
    if (on == 0)
    {
        image_index = 2;
        audio_play_sound(sndBigExplosion, 0, false);
        if (room == rmTensionUpstairs)
        {
            vol = global.mvol / 0.5;
            audio_sound_gain(global.currentsong, clamp(global.mvol - vol, 0, 1), 0);
        }
        starttime = current_time;
        with (objBombGuy)
        {
            repeat (12)
            {
                my_id = instance_create(x, y, objDoorDebris);
                my_id.direction = random(360);
                my_id.speed = 2 + random(3);
                my_id.friction = 0.1;
            }
            repeat (24)
            {
                my_id = instance_create((x - 3) + random(6), (y - 3) + random(6), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x, y, my_id.x, my_id.y);
                my_id.sprite_index = sprBloodSplatSmall;
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(4);
            }
            instance_create(x, y, objBombGround);
            instance_create(x, y, objBombGuyDie);
            instance_destroy();
        }
        with (objTigerBombGuy)
        {
            repeat (12)
            {
                my_id = instance_create(x, y, objDoorDebris);
                my_id.direction = random(360);
                my_id.speed = 2 + random(3);
                my_id.friction = 0.1;
            }
            repeat (24)
            {
                my_id = instance_create((x - 3) + random(6), (y - 3) + random(6), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x, y, my_id.x, my_id.y);
                my_id.sprite_index = sprBloodSplatSmall;
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(4);
            }
            instance_create(x, y, objBombGround);
            instance_create(x + 26, y + 20, objBombGuyDie);
            my_id = instance_create(x, y, objLetterFound);
            my_id.text = '"' + scrMaskGetName(28) + '"';
            global.hardmodemasks[2] = 1;
            scrSaveUnlocked();
            scrAchievementSet("Tiger Claws");
            instance_destroy();
        }
        with (objEBombTinker)
        {
            scrExplosionDie(1032, 1, 209, 302);
        }
        with (objMafiaKill)
        {
            scrExplosionDie(1032, 1, 209, 302);
        }
        with (objBombCables)
        {
            sprite_index = sprBombCablesBroken;
            image_speed = 0.12;
        }
        with (objWindowV)
        {
            if (x == 128 && y == 288)
            {
                instance_create(x, y, objWindowExplode);
                instance_destroy();
            }
        }
        with (objEStandGuardBomb)
        {
            repeat (8)
            {
                my_id = instance_create(x, y, objBloodSmoke);
                my_id.image_xscale = 1.2 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
                {
                    my_id.decadenced = 1;
                }
                my_id.image_angle = random(360);
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(1);
                my_id.friction = 0.15;
            }
            my_id = instance_create(x, y - 12, objScore);
            my_id.text = "+" + string(100 + (160 * global.factor)) + "pts";
            global.myscore += (100 + (160 * global.factor));
            global.killscore += 100;
            global.boldscore += 120;
            global.combo += 1;
            global.combotime = 240;
            global.killx[global.kills] = x;
            global.killy[global.kills] = y;
            global.kills += 1;
            global.blink = 1;
            global.gunkill += 1;
            if (global.bonustime < (12 + (global.factor * 4)))
            {
                global.bonustime = 12 + (global.factor * 4);
            }
            if (global.factor == 2)
            {
                ds_list_add(global.bonuslist, "Exposure");
            }
            if (global.factor == 3)
            {
                ds_list_add(global.bonuslist, "Double Exposure");
            }
            if (global.factor == 4)
            {
                ds_list_add(global.bonuslist, "Triple Exposure");
            }
            if (global.factor > 4)
            {
                ds_list_add(global.bonuslist, "Severe Exposure");
            }
            if (global.bonustime < 12)
            {
                global.bonustime = 12;
            }
            global.combo += 1;
            edir = point_direction(x, y, 209, 302) - 180;
            global.my_id = id;
            global.myx = x + lengthdir_x(8, image_angle);
            global.myy = y + lengthdir_y(8, image_angle);
            my_id = instance_create(global.myx - 8, global.myy, objBloodPool);
            my_id = instance_create(x + 1, y, objDeadBody);
            my_id.sprite_index = sprEMafiaDeadLeanExplosion;
            my_id.image_index = choose(0, 1);
            my_id.image_angle = image_angle - 180;
            scrGoreShotgun(x + 4, y, edir - 180, 0, 0, 0, 0, 0, 1);
            part = instance_create(x, y, objBodyPartShotgun);
            part.sprite_index = sprEMafiaDeadExplosionPieces;
            if (sprite_index == sprPoliceGetUpLean)
            {
                part.sprite_index = sprEPoliceDeadExplosionPieces;
            }
            part.image_angle = direction + random_range(-30, 30);
            part.direction = part.image_angle;
            part.speed = 3.5 + random(1.5);
            part.image_index = choose(2, 3);
            part.sled = 0;
            part.depth = 2;
            repeat (2)
            {
                part = instance_create(x + 4, y, objBodyPartShotgun);
                part.sprite_index = sprEMafiaDeadExplosionPieces;
                part.image_angle = direction + random_range(-30, 30);
                part.direction = part.image_angle;
                part.speed = 2.5 + random(1.5);
                part.image_index = choose(4, 5);
                part.depth = 2;
            }
            instance_destroy();
        }
        with (objDoorH2)
        {
            if (sprite_index == sprBombDoorH)
            {
                my_id = instance_create(x, y, objDestroyedDoor);
                my_id.direction = 90;
                my_id.speed = 3 + random(1);
                instance_destroy();
            }
            else
            {
                my_id = instance_create(x, y, objDestroyedDoor);
                my_id.direction = -90;
                my_id.speed = 3 + random(1);
                instance_destroy();
            }
        }
        with (objDoorV2)
        {
            if (sprite_index == sprBombDoorV)
            {
                my_id = instance_create(x, y, objDestroyedDoor);
                my_id.direction = 0;
                my_id.speed = 3 + random(1);
                my_id.image_angle = -90;
                instance_destroy();
            }
        }
        image_index = 9;
        if (RPGJOKE == 0)
        {
            with (objPlayer)
            {
                if (place_meeting(x, y, objExplosion))
                {
                    my_id = instance_create(x, y, objPlayerBombDead);
                    my_id.direction = point_direction(x, y, objExplosion.x, objExplosion.y) - 180;
                    my_id.image_angle = my_id.direction;
                    my_id.speed = 5;
                    with (my_id)
                    {
                        repeat (24)
                        {
                            my_id = instance_create((x - 3) + random(6), (y - 3) + random(6), objBloodDrop);
                            my_id.image_xscale = 1 - random(0.2);
                            my_id.image_yscale = my_id.image_xscale;
                            my_id.image_angle = point_direction(x, y, my_id.x, my_id.y);
                            my_id.sprite_index = sprBloodSplatSmall;
                            my_id.direction = (direction - 90) + random(180);
                            my_id.speed = 2 + random(4);
                        }
                    }
                    instance_destroy();
                }
            }
        }
        if (RPGJOKE == 0)
        {
            with (objEnemy)
            {
                if (place_meeting(x, y, objExplosion))
                {
                    scrExplosionDie(1032, 0, 0, 0);
                }
            }
            with (objKnockedOut)
            {
                if (place_meeting(x, y, objExplosion))
                {
                    scrExplosionDie(1032, 0, 0, 0);
                }
            }
            with (objBoss1)
            {
                if (place_meeting(x, y, objExplosion))
                {
                    scrExplosionDie(1032, 0, 0, 0);
                }
            }
        }
        else
        {
            with (objEnemy)
            {
                if (place_meeting(x, y, objExplosion) || collision_circle(x, y, 8, objExplosion, 0, 1))
                {
                    scrExplosionDie(1032, 0, 0, 0);
                }
            }
            with (objKnockedOut)
            {
                if (place_meeting(x, y, objExplosion) || collision_circle(x, y, 8, objExplosion, 0, 1))
                {
                    scrExplosionDie(1032, 0, 0, 0);
                }
            }
            with (objBoss1)
            {
                if (place_meeting(x, y, objExplosion) || collision_circle(x, y, 8, objExplosion, 0, 1))
                {
                    scrExplosionDie(1032, 0, 0, 0);
                }
            }
        }
        image_index = 2;
    }
    on = 1;
}
if (on == 1)
{
    if ((current_time - starttime) > 4000)
    {
        vol = lerp(vol, 0, 0.025);
        audio_sound_gain(global.currentsong, clamp(global.mvol - vol, 0, 1), 0);
    }
}
