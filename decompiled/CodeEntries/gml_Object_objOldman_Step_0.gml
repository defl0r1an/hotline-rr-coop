if (sprite_index == sprOldmanDeath)
{
    if (image_index < 18)
    {
        image_index += 0.5;
    }
}
if (state == 0)
{
    if (objPlayer.y < 224)
    {
        with (objPlayerMouse)
        {
            my_id = instance_create(x, y, objPlayerMouseHouse);
            my_id.image_index = image_index;
            my_id.dir = dir;
            my_id.maskindex = global.maskindex;
            my_id.maskon = 1;
            my_id.sprite_index = sprite_index;
            my_id.active = 0;
            my_id.aimon = 0;
            instance_destroy();
        }
        state = 1;
    }
}
if (state == 1)
{
    with (objPlayerMouseHouse)
    {
        lastx = x;
        lasty = y;
        if (x < 240)
        {
            x += 1;
        }
        if (y > 144)
        {
            y -= 1;
        }
        scrRotate(dir, point_direction(x, y, objOldman.x, objOldman.y), 6);
        if (lastx == x && lasty == y)
        {
            objOldman.state = 2;
        }
        else
        {
            image_index += 0.15;
            legindex += 0.25;
            dir = point_direction(lastx, lasty, x, y);
            legdir = dir;
        }
    }
}
if (state == 2)
{
    objPlayer.image_index = 0;
    objPlayer.legindex = 0;
    objPlayer.aimon = 0;
    objPlayer.dir = point_direction(objPlayer.x, objPlayer.y, x, y);
    scrGetMessage(0);
    state = 3;
    wait = 100;
}
if (state == 3)
{
    if (!instance_exists(objPhoneConversation))
    {
        if (wait > 0)
        {
            wait -= 1;
        }
        else
        {
            if (global.maskindex == 27)
            {
                my_id = instance_create(x, y, objBigIgel);
                my_id.Emotion = "KillOldMan";
                state = 4;
                wait = 75;
            }
            else
            {
                objPlayer.sprite_index = sprPAttackBossgun;
                if (objPlayer.image_index < 19)
                {
                    objPlayer.image_index += 0.15;
                }
                else
                {
                    state = 4;
                    objPlayer.sprite_index = sprPWalkUnarmed;
                    objPlayer.image_index = 0;
                    wait = 60;
                    with (objPlayer)
                    {
                        my_id = instance_create(x + 5, y + 5, objBossgun);
                        my_id.friction = 0.1;
                        my_id.speed = 1;
                        my_id.direction = -45;
                    }
                }
            }
            if (objPlayer.image_index > 9 && shoot == 0)
            {
                shoot = 1;
                global.shake = 5;
                with (objPlayer)
                {
                    my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBullet);
                    audio_play_sound(snd9mm, 0, false);
                    my_id.direction = dir;
                    my_id.speed = 12;
                    my_id.image_angle = dir;
                }
            }
        }
    }
    else
    {
        image_index += 0.1;
    }
}
if (state == 4)
{
    if (wait > 0)
    {
        wait -= 1;
        sxeasy_setVolume(wait * 0.016666666666666666);
        if (wait == 0)
        {
            sxeasy_setVolume(1);
            sxeasy_play(global.ElectricDreams);
        }
    }
    else
    {
        with (objPlayer)
        {
            lastx = x;
            lasty = y;
            if (x > 224)
            {
                x -= 1;
            }
            if (y > 28)
            {
                y -= 1;
            }
            if (lastx == x && lasty == y)
            {
                objOldman.state = 5;
                wait = 20;
                image_index = 0;
                legindex = 0;
            }
            else
            {
                image_index += 0.15;
                legindex += 0.25;
                dir = point_direction(lastx, lasty, x, y);
                legdir = dir;
            }
        }
    }
}
if (state == 5)
{
    if (wait > 0)
    {
        objPlayer.image_index = 0;
        objPlayer.legindex = 0;
        wait -= 1;
    }
    else
    {
        if (global.maskindex == 26 && russell == 0)
        {
            tiles = tile_get_ids();
            _tile = tiles[1];
            tiles = tile_get_ids_at_depth(100);
            if (array_length_1d(tiles) > 1)
            {
                for (i = 0; i < array_length_1d(tiles); i++)
                {
                    _back = tile_get_background(tiles[i]);
                    if (_back == 29)
                    {
                        tile_set_background(tiles[i], background0);
                    }
                    if (_back == 30)
                    {
                        tile_set_background(tiles[i], Corners);
                    }
                }
            }
            tiles = tile_get_ids_at_depth(1000);
            if (array_length_1d(tiles) > 1)
            {
                for (i = 0; i < array_length_1d(tiles); i++)
                {
                    _back = tile_get_background(tiles[i]);
                    if (_back == 29)
                    {
                        tile_set_background(tiles[i], background0);
                    }
                    if (_back == 30)
                    {
                        tile_set_background(tiles[i], Corners);
                    }
                }
            }
            tiles = tile_get_ids_at_depth(-99);
            if (array_length_1d(tiles) > 1)
            {
                for (i = 0; i < array_length_1d(tiles); i++)
                {
                    _back = tile_get_background(tiles[i]);
                    if (_back == 29)
                    {
                        tile_set_background(tiles[i], background0);
                    }
                    if (_back == 30)
                    {
                        tile_set_background(tiles[i], Corners);
                    }
                }
            }
            russell = 1;
        }
        with (objPlayer)
        {
            sprite_index = sprPThrowMask;
            global.maskon = 0;
            maskon = 0;
            if (image_index < 20.85)
            {
                image_index += 0.15;
            }
            else
            {
                objOldman.wait = 30;
                objOldman.state = 6;
                objPlayer.sprite_index = sprPEnding;
                objPlayer.image_index = 0;
            }
            if (global.throw == 0 && image_index > 16)
            {
                if (global.maskindex == 1 && global.hardmode == 1 && sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[1], "Mask")) == "sprMasksHard")
                {
                    my_id = instance_create(x - 12, y, objMaskOwlDrop);
                    my_id.direction = 180 + random(10);
                    my_id.speed = 3;
                    my_id.image_angle = 270;
                }
                else
                {
                    my_id = instance_create(x - 12, y, objMaskDrop);
                    my_id.direction = 180 + random(10);
                    my_id.speed = 3;
                    my_id.image_angle = 270;
                    my_id.sprite_index = scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], "DropBack");
                }
                global.throw = 1;
            }
        }
    }
}
if (state == 6)
{
    if (wait > 0)
    {
        objPlayer.image_index = 0;
        objPlayer.legindex = 0;
        wait -= 1;
    }
    else
    {
        with (objRain)
        {
            max_raindrops = lerp(max_raindrops, 0, 0.025);
            max_splashes = lerp(max_splashes, 0, 0.025);
        }
        objPlayer.sprite_index = sprPEnding;
        with (objPlayer)
        {
            if (image_index < 160)
            {
                image_index += 0.15;
            }
            if (image_index >= 13 && (image_index - 0.15) < 13)
            {
                audio_play_sound(sndLighter, 0, false);
            }
            if (image_index > 52 && global.smoke == 0)
            {
                global.smoke = 1;
                my_id = instance_create(x + lengthdir_x(3, dir), y + lengthdir_y(3, dir), objSmokeExhale);
                my_id.direction = dir;
                my_id.image_angle = dir - random_range(6, -6);
                my_id.speed = 0.5 - random_range(0.15, -0.15);
            }
            if (image_index > 92 && global.smoke == 1)
            {
                global.smoke = 2;
                my_id = instance_create(x + lengthdir_x(7, dir), y + lengthdir_y(7, dir), objSmokeExhale);
                my_id.direction = dir;
                my_id.image_angle = dir - random_range(6, -6);
                my_id.speed = 0.5 - random_range(0.15, -0.15);
            }
            if (image_index > 122 && global.picture == 0)
            {
                global.picture = 1;
                my_id = instance_create(x - 7, y - 13, objPicture);
                my_id.direction = 90;
                my_id.speed = 1.5;
            }
        }
    }
}
if (global.picture == 1)
{
    with (objPicture)
    {
        valid = 0;
        speedcam = lerp(speedcam, 1, 0.015);
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x, y);
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x, y);
        view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), speedcam);
        view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), speedcam);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
}
