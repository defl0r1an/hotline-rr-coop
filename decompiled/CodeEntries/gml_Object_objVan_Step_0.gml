if (global.xbox == 1)
{
    scrXboxRestart();
}
if (keyboard_check_pressed(ord(global.restartkey)))
{
    event_perform(ev_keypress, ord("R"));
}
if (place_meeting(x, y, objPlayerMouse))
{
    global.dir = point_direction(x, y, objPlayer.x, objPlayer.y);
    with (objPlayer)
    {
        repeat (6 + round(random(2)))
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, global.dir), (y - 3) + random(6) + lengthdir_y(8, global.dir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, global.dir), y + lengthdir_y(8, global.dir), my_id.x, my_id.y);
            my_id.sprite_index = sprBloodSplatSmall;
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(2);
            my_id.decadenced = 1;
        }
        repeat (4 + round(random(2)))
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, global.dir), (y - 3) + random(6) + lengthdir_y(16, global.dir), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = (global.dir - 20) + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
            my_id.decadenced = 1;
        }
        my_id = instance_create(x, y, objPlayerDead);
        my_id.sprite_index = sprPBackCar;
        my_id.image_angle = global.dir;
        my_id.speed = 3;
        my_id.direction = global.dir;
        my_id.decadenced = 1;
        audio_play_sound(sndCarHit, 0, false);
        instance_destroy();
    }
}
if (speed > 0)
{
    if (y > 72)
    {
        if (brake == 0)
        {
            tile = tile_layer_find(-99, 320, 128);
            if (tile_exists(tile))
            {
                tile_delete(tile);
            }
            tile = tile_layer_find(-99, 384, 128);
            if (tile_exists(tile))
            {
                tile_delete(tile);
            }
            tile = tile_layer_find(-99, 320, 192);
            if (tile_exists(tile))
            {
                tile_delete(tile);
            }
        }
    }
    if (y > 216)
    {
        if (brake == 0)
        {
            brake = 1;
            audio_play_sound(sndCarSkid, 0, false);
            audio_stop_sound(sndCarThrottle);
        }
        friction = 0.38;
        direction += (speed * 0.4);
        image_angle += (speed * 0.45);
        image_yscale = 1;
    }
}
else
{
    if (!instance_exists(objPlayer))
    {
        if (reload > 0)
        {
            exit;
        }
    }
    solid = 1;
    if (state == 0)
    {
        sprite_index = sprVanOpenDoor;
        if (image_index < 12)
        {
            image_index += 0.5;
        }
        else
        {
            sprite_index = sprVanTop;
            my_id = instance_create(x, y, objVanBottom);
            my_id.image_angle = image_angle;
            state = 1;
        }
    }
    if (state == 1)
    {
        if (instance_exists(objPlayer))
        {
            if (objPlayer.y > 384)
            {
                if (objPlayer.y < 448)
                {
                    if (reload > 0)
                    {
                        reload -= 1;
                    }
                    else
                    {
                        reload = 2;
                        audio_play_sound(sndM16, 0, false);
                        headx = lengthdir_x(30.2, 325.8 + image_angle);
                        heady = lengthdir_y(30.2, 325.8 + image_angle);
                        my_id = instance_create(x + headx, y + heady + 9, objEBullet);
                        my_id.direction = point_direction(x + headx, y + heady, objPlayer.x, objPlayer.y);
                        my_id.speed = 12;
                        my_id.image_angle = my_id.direction;
                    }
                }
            }
            else
            {
                sprite_index = sprVanDoorsOpen;
                if (image_index < 63)
                {
                    image_index += 0.25;
                }
                else
                {
                    image_index = 0;
                    thrown = 0;
                    if ((instance_number(objEnemy) + instance_number(objKnockedOut)) == 0)
                    {
                        state = 3;
                    }
                }
                if (image_index > 43 && thrown == 0)
                {
                    if (instance_exists(objPlayer))
                    {
                        dir = point_direction(x + headx, y + heady, objPlayer.x, objPlayer.y);
                        dist = point_distance(x + headx, y + heady, objPlayer.x, objPlayer.y);
                    }
                    else
                    {
                        dir = 90;
                        dist = 80;
                    }
                    my_id = instance_create(x + headx + lengthdir_x(10, dir), y + heady + lengthdir_y(10, dir), objMolotov);
                    my_id.limit = dist;
                    my_id.speed = 8;
                    my_id.direction = dir;
                    audio_play_sound(sndMolotovThrow, 0, false);
                    thrown = 1;
                }
                if (reload > 0)
                {
                    reload -= 1;
                }
                else if (MaxEnemies > 3)
                {
                    reload = 60;
                    my_id = instance_create(x + lengthdir_x(24, image_angle + 90), y + lengthdir_y(24, image_angle + 90), Enemy[enemies]);
                    if (EnemySprite[enemies] != -1)
                    {
                        my_id.sprite_index = EnemySprite[enemies];
                    }
                    if (EnemyAmmo[enemies] != -1)
                    {
                        my_id.ammo = EnemyAmmo[enemies];
                    }
                    my_id.direction = 90;
                    enemies += 1;
                    MaxEnemies -= 1;
                }
            }
        }
    }
    if (state == 3)
    {
        if (image_index < 63)
        {
            image_index += 0.25;
        }
        else
        {
            image_index = 0;
            thrown = 0;
            if ((instance_number(objEnemy) + instance_number(objKnockedOut)) == 0)
            {
                state = 5;
            }
        }
        if (image_index > 43 && thrown == 0)
        {
            if (instance_exists(objPlayer))
            {
                dir = point_direction(x + headx, y + heady, objPlayer.x, objPlayer.y);
                dist = point_distance(x + headx, y + heady, objPlayer.x, objPlayer.y);
            }
            else
            {
                dir = 90;
                dist = 80;
            }
            my_id = instance_create(x + headx + lengthdir_x(10, dir), y + heady + lengthdir_y(10, dir), objMolotov);
            my_id.limit = dist + 8;
            my_id.speed = 8;
            my_id.direction = dir;
            audio_play_sound(sndMolotovThrow, 0, false);
            if (global.hardmode == 1)
            {
                with (objEnemy)
                {
                    if (alert == 0)
                    {
                        reload = 0;
                        alert = 1;
                    }
                }
            }
            thrown = 1;
        }
        if (reload > 0)
        {
            reload -= 1;
        }
        else if (MaxEnemies > 0)
        {
            reload = 60;
            my_id = instance_create(x + lengthdir_x(24, image_angle + 90), y + lengthdir_y(24, image_angle + 90), Enemy[enemies]);
            if (EnemySprite[enemies] != -1)
            {
                my_id.sprite_index = EnemySprite[enemies];
            }
            if (EnemyAmmo[enemies] != -1)
            {
                my_id.ammo = EnemyAmmo[enemies];
            }
            my_id.direction = 90;
            enemies += 1;
            MaxEnemies -= 1;
        }
    }
    if (state == 5)
    {
        if (instance_exists(objPlayerMouse))
        {
            if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objBurningGuy)) == 0)
            {
                with (objBoss3Spawn)
                {
                    instance_destroy();
                }
                objEffector.brus = 10;
                with (objBottleExplosion)
                {
                    my_id = instance_create(x, y, objBombGround);
                    my_id.image_angle = random(360);
                    instance_destroy();
                }
                with (objWeapon)
                {
                    instance_destroy();
                }
                my_id = instance_create(x + lengthdir_x(24, image_angle + 90), y + lengthdir_y(24, image_angle + 90), objBoss3);
                my_id.direction = 90;
                viewx = view_xview[0];
                viewy = view_yview[0];
                with (objPlayerMouse)
                {
                    my_id = instance_create(x, y, objPlayerMouseHouse);
                    my_id.dir = dir;
                    my_id.maskon = 1;
                    global.maskon = 1;
                    instance_destroy();
                }
                objPlayer.active = 0;
                view_xview[0] = viewx;
                view_yview[0] = viewy;
                state = 6;
                sxeasy_play(global.Static);
            }
        }
    }
}
