if (spriteTruck == 2803)
{
    indexTruck += 0.15;
}
volume = clamp(1 - (point_distance(x, y, objPlayer.x, objPlayer.y) / 780), 0, 1);
if (collision_ellipse(272, 2720, 448, 2784, objPlayer, 0, 1) && open == 0)
{
    image_speed = 0.125;
    stage = "Start";
    audio_play_sound(sndMorgueCell, 0, false);
    objPlayer.active = 0;
    open = 1;
}
if (stage == "Start")
{
    volumemusic = lerp(volumemusic, 1, 0.015);
    audio_sound_gain(global.currentsong, clamp(global.mvol - volumemusic, 0, 1), 0);
    if (image_index > 8)
    {
        moveTruck = lerp(moveTruck, -20, 0.15);
    }
    with (objPlayer)
    {
        if (point_distance(x, y, 368, 2784) > 1)
        {
            move_towards_point(368, 2784, speed);
            image_index += 0.15;
            legindex += 0.25;
            speed = 0.85;
            legdir = dir;
        }
        else
        {
            other.stage = "PhoneEnd";
            other.alarm[1] = 165;
            image_index = 0;
            legindex = 0;
            speed = 0;
        }
    }
    objPlayer.dir = point_direction(objPlayer.x, objPlayer.y, x, y);
}
if (stage == "Girlfriend")
{
    if (sound == 0)
    {
        audio_play_sound(sndMadnessNoise, 0, false);
        sound = 1;
    }
    objShadowDebug.image_alpha = lerp(objShadowDebug.image_alpha, 0, 0.15);
    if (round(random(145)) <= 10)
    {
        objEffectorHospital.blackout = 4 + round(random(3));
        if (objPlayer.alphaundead == 0)
        {
            objPlayer.alphaundead = 1;
            objPlayer.bloodsled = 0;
            audio_sound_gain(global.currentsong, global.mvol, 0);
            with (objSmokeBreathing)
            {
                global.comboflash = 10;
                visible = false;
                audio_stop_sound(sndExhale1);
                audio_stop_sound(sndExhale2);
                audio_stop_sound(sndExhale3);
            }
            with (objUndead)
            {
                if (head == 2804)
                {
                    head = 2950;
                }
            }
        }
        else
        {
            audio_sound_gain(global.currentsong, 0, 0);
            global.comboflash = 0;
            objPlayer.alphaundead = 0;
            with (objSmokeBreathing)
            {
                visible = true;
            }
            with (objUndead)
            {
                if (head == 2950)
                {
                    head = 2804;
                }
            }
        }
    }
}
if (stage == "Player")
{
    objShadowDebug.image_alpha = 1;
    objPlayer.alphaundead = 0;
    with (objUndead)
    {
        instance_destroy();
    }
    with (objPlayer)
    {
        sprite_index = sprPHospitalHeadache2;
        if (image_index < 9)
        {
            image_index += 0.15;
        }
        else if (other.alarm[3] == -1)
        {
            other.alarm[3] = 35;
        }
    }
}
if (stage == "DreamPeople")
{
    if (objEffectorHospital.blackout == 0)
    {
        audio_sound_gain(global.currentsong, global.mvol, 0);
    }
    with (objGurneyHospitalDeadBody2)
    {
        instance_destroy();
    }
    with (objUndead)
    {
        instance_destroy();
    }
    if (global.my_id == 367)
    {
        moveTruck = lerp(moveTruck, -20, 0.05);
    }
    objShadowDebug.image_alpha = 1;
}
if (stage == "PlayerStory")
{
    if (objEffectorHospital.blackout == 0 && spriteTruck != 2945)
    {
        audio_sound_gain(global.currentsong, global.mvol, 0);
    }
    if (spriteTruck == 2945)
    {
        if (indexTruck < 5)
        {
            indexTruck += 0.15;
        }
        else if (alarm[5] == -1)
        {
            alarm[5] = 20;
        }
    }
    objPlayer.alphaundead = 0;
    with (objSmokeBreathing)
    {
        visible = true;
    }
}
