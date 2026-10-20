if (global.xbox == 1)
{
    scrXboxRestartDead();
}
global.my_id = id;
global.test = 0;
if (keyboard_check_pressed(ord(global.restartkey)))
{
    event_perform(ev_keypress, ord("R"));
}
if (speed > 0)
{
    legindex += (speed * 0.2);
}
else
{
    legindex = 0;
}
if (state == 0)
{
    if (y < (objPlayerBikerHack.y - 80))
    {
        vspeed = 1 + addspeed;
        image_index += 0.15;
        direction = 270;
    }
    else
    {
        vspeed = 0;
        direction = 270;
        with (objPlayerBikerHack)
        {
            my_id = instance_create(x, y, objPlayerBikerHouse);
            my_id.active = 0;
            instance_destroy();
        }
        with (objDoorH)
        {
            solid = 1;
            image_angle = 0;
        }
        with (objDoorH2)
        {
            solid = 1;
            image_angle = 0;
        }
        state = 1;
    }
}
if (state == 1)
{
    scrGetMessage(1);
    state = 2;
}
if (state == 2)
{
    if (!instance_exists(objPhoneConversation))
    {
        with (objPlayerBikerHouse)
        {
            my_id = instance_create(x, y, objPlayerBiker);
            instance_destroy();
        }
        if ((global.masksavedbiker == 2 || global.masksavedbiker == 6 || global.masksavedbiker == 11) && global.hardmode == 1)
        {
            state = 3;
            exit;
        }
        if (point_distance(x, y, objGolfBag.x, objGolfBag.y) > 12)
        {
            direction = point_direction(x, y, objGolfBag.x, objGolfBag.y);
            if (speed < 3)
            {
                speed += 0.5;
            }
            else
            {
                speed = 3 + addspeed;
            }
            image_index += (speed * 0.1);
        }
        else
        {
            audio_play_sound(sndPickupWeapon, 1, false);
            objGolfBag.image_index = 1;
            sprite_index = sprPWalkClub;
            image_index += (speed * 0.1);
            state = 3;
        }
    }
    else
    {
        with (objPlayerBikerHouse)
        {
            viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir)) * 0.1;
            viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir));
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            vdist = point_distance(x, y, room_width / 2, room_height / 2);
            vdir = point_direction(room_width / 2, room_height / 2, x, y);
            if (global.hardmode == 1)
            {
                view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2) - 180;
            }
            else
            {
                view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            }
        }
    }
}
if (state == 3)
{
    if (instance_exists(objPlayer))
    {
        motion_add(point_direction(x, y, objPlayer.x, objPlayer.y), 0.5);
        if (speed > 3)
        {
            speed = 3 + addspeed;
            image_speed = 0.25;
        }
        if (point_distance(x, y, objPlayer.x, objPlayer.y) < 12)
        {
            sprite_index = style[1];
            image_speed = 0.35;
            audio_play_sound(choose(sndSwing1, sndSwing2), 1, false);
            global.my_id = id;
            scrBikerGetsKnocked();
            if (global.masksavedbiker == 11 && global.hardmode == 1)
            {
                sprite_index = sprPWalkCleaver;
                audio_play_sound(sndPickupWeapon, 1, false);
                global.CleaverSteel = 0;
            }
            with (objElevator)
            {
                if (index != 0)
                {
                    my_id = instance_create(x, y, objJacketPath6);
                    my_id = instance_create(x + 60, y, objJacketPath5);
                }
            }
            state = 4;
        }
    }
    else
    {
        state = 4;
    }
}
if (state == 4)
{
    friction = 0.35;
    image_speed = speed * 0.1;
}
global.my_id = id;
if (state == 5)
{
    image_speed = 0;
    if (speed > 0)
    {
        exit;
    }
    if (image_index < 4)
    {
        image_index += 0.15;
    }
    else
    {
        with (objPlayerBikerHouse)
        {
            active = 1;
        }
        if (place_meeting(x, y, objPlayerBiker))
        {
            with (objPlayerBiker)
            {
                instance_create(x, y, objPlayerBikerKick);
                instance_destroy();
            }
        }
    }
}
if (place_meeting(x, y, objJacketPath6))
{
    image_alpha = lerp(image_alpha, 0, 0.15);
    if (global.masksavedbiker == 11 && global.hardmode == 1 && cleaver == 0)
    {
        sprite_index = style[0];
        my_id = instance_create(x, y, objCleaverDrop);
        my_id.speed = -3;
        my_id.direction = direction + random_range(5, -5);
        audio_play_sound(sndThrow, 0, false);
        cleaver = 1;
    }
    if (image_alpha <= 0)
    {
        instance_destroy();
    }
}
scrBikerIsDead();
