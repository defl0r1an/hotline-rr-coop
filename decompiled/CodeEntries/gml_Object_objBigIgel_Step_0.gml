wait = lerp(wait, 0, 0.25);
if (Emotion == "Start")
{
    if (stage == -1)
    {
        wait = 4;
        stage = 0;
    }
    if (stage == 0 && wait <= 0)
    {
        image_speed = 0.15;
        if (image_xscale >= 1.5)
        {
            stage = 1;
        }
        stagespeed += (0.05 + (stagespeed / 8));
        image_xscale = lerp(image_xscale, 1.5, stagespeed);
        image_yscale = lerp(image_yscale, 1.5, stagespeed);
    }
    if (stage == 2 && wait <= 0)
    {
        sprite_index = sprBigIgelOpens;
        image_speed = 0.15;
        image_xscale = lerp(image_xscale, 1.25, 0.05);
        image_yscale = lerp(image_yscale, 0.85, 0.05);
        scalespeed = 0.5;
    }
    if (stage == 1 || stage == 3)
    {
        stagespeed = 0;
        image_xscale = lerp(image_xscale, 1, scalespeed);
        image_yscale = lerp(image_yscale, 1, scalespeed);
    }
    if (stage == 4 && wait <= 0)
    {
        if (image_xscale == 0)
        {
            instance_destroy();
        }
        stagespeed += (0.05 + (stagespeed / 12));
        image_angle -= stagespeed;
        image_xscale = lerp(image_xscale, 0, stagespeed / 96);
        image_yscale = lerp(image_yscale, 0, stagespeed / 96);
    }
    if (sprite_index == sprBigIgelBite && image_index >= 4)
    {
        depth = -10;
        if (global.maskon == 0)
        {
            global.PhotoNegativeCircleSize = 0;
            global.PhotoNegativeCircle = 0;
        }
    }
    if (sprite_index == sprBigIgelOpens && image_index >= 3 && stage == 2)
    {
        depth = 0;
        global.PhotoNegativeCircleSize = 30;
        with (objPlayer)
        {
            reload = 30;
            image_index = 0;
            image_speed = 0.15;
            sprite_index = sprPStartSkippy;
            ammo = 10;
        }
        stage = 3;
    }
    if ((instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) > 250 && stage == 3) || (!instance_exists(objPlayer) && stage == 3) || (global.deadIgel == 1 && stage == 3))
    {
        sprite_index = sprBigIgelBite;
        image_index = 3;
        image_speed = 0.15;
        wait = 30;
        stage = 4;
    }
}
if (Emotion == "KillPlayerCutScene")
{
    if (instance_exists(objPlayer))
    {
        vol = lerp(vol, 1, 0.15);
        sxeasy_setVolume(vol);
        if (waitsound > 0)
        {
            waitsound -= 1;
        }
        if (waitsound == 0)
        {
            audio_sound_pitch(audio_play_sound(sndDeathBell, 1, false), soundpitch);
            sound += 15;
            soundpitch -= 0.05;
            soundpitch = clamp(soundpitch, 0.5, 1);
            waitsound = clamp(640 + sound, 5, 50);
        }
        if (objPlayer.speeddeadIgel <= 0.0025)
        {
            objPlayer.speeddeadIgel = 0;
            x = objPlayer.x;
            y = objPlayer.y;
            if (sprite_index == sprBigIgelBite && image_index >= 4)
            {
                depth = -10;
                global.PhotoNegativeCircleSize = 0;
                global.PhotoNegativeCircle = 0;
            }
            if (stage == -1)
            {
                wait = 30;
                stage = 0;
            }
            if (stage == 0 && wait <= 0)
            {
                image_speed = 0.15;
                if (image_xscale >= 1.5)
                {
                    stage = 1;
                }
                stagespeed += (0.05 + (stagespeed / 8));
                image_xscale = lerp(image_xscale, 1.5, stagespeed);
                image_yscale = lerp(image_yscale, 1.5, stagespeed);
            }
            if (stage == 1 || stage == 3)
            {
                stagespeed = 0;
                image_xscale = lerp(image_xscale, 1, scalespeed);
                image_yscale = lerp(image_yscale, 1, scalespeed);
            }
        }
    }
    if (image_index >= 4)
    {
        with (objPlayer)
        {
            sprite_index = sprPWalkUnarmed;
        }
    }
    if (stage == 2)
    {
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.01, vdir * 2);
        scrHardMode();
        wait = 30;
        stage = 4;
    }
    if (stage == 4 && wait <= 0)
    {
        if (image_xscale == 0)
        {
            instance_destroy();
        }
        stagespeed += (0.05 + (stagespeed / 12));
        image_angle -= stagespeed;
        image_xscale = lerp(image_xscale, 0, stagespeed / 96);
        image_yscale = lerp(image_yscale, 0, stagespeed / 96);
    }
}
if (Emotion == "KillOldMan")
{
    if (instance_exists(objOldman))
    {
        x = objOldman.x;
        y = objOldman.y;
        if (sprite_index == sprBigIgelBite && image_index >= 4)
        {
            depth = -10;
        }
        if (stage == -1)
        {
            wait = 30;
            stage = 0;
        }
        if (stage == 0 && wait <= 0)
        {
            image_speed = 0.15;
            if (image_xscale >= 1.5)
            {
                stage = 1;
            }
            stagespeed += (0.05 + (stagespeed / 8));
            image_xscale = lerp(image_xscale, 1.5, stagespeed);
            image_yscale = lerp(image_yscale, 1.5, stagespeed);
        }
        if (stage == 1 || stage == 3)
        {
            stagespeed = 0;
            image_xscale = lerp(image_xscale, 1, scalespeed);
            image_yscale = lerp(image_yscale, 1, scalespeed);
        }
    }
    if (image_index >= 4 && instance_exists(objOldman))
    {
        with (objOldman)
        {
            visible = false;
        }
    }
    if (stage == 2)
    {
        wait = 30;
        stage = 4;
    }
    if (stage == 4 && wait <= 0)
    {
        if (image_xscale == 0)
        {
            instance_destroy();
        }
        stagespeed += (0.05 + (stagespeed / 12));
        image_angle -= stagespeed;
        image_xscale = lerp(image_xscale, 0, stagespeed / 96);
        image_yscale = lerp(image_yscale, 0, stagespeed / 96);
    }
}
