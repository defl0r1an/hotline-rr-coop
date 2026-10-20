if (global.hardmode == 1)
{
    if (room == rmPoliceHQFloor1)
    {
        if (instance_exists(objPlayer))
        {
            if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32 && !event)
            {
                scrSetRasmusEvent(choose("Fire show", "Pull the lever", "Release him"), 10, 100, "mystical");
                event = 1;
            }
        }
        if (place_meeting(x, y, objPlayer) && (mouse_check_button(mb_left) || mouse_check_button(mb_right)))
        {
            global.firealarmer = 1;
        }
    }
    if (global.firealarmer == 1 && !(global.firealarmertime <= 0))
    {
        global.firealarmertime -= 0.1;
    }
    if (global.firealarmertime <= 0)
    {
        if (audio_is_playing(sndFireAlarm))
        {
            audio_stop_sound(sndFireAlarm);
        }
    }
    if (global.firealarmer == 1)
    {
        if (room == rmPoliceHQFloor2)
        {
            if (door_wasnt_open)
            {
                if (global.firealarmertime <= 0)
                {
                    if (audio_is_playing(sndFireAlarm))
                    {
                        audio_stop_sound(sndFireAlarm);
                    }
                    with (objCellDoor)
                    {
                        if (touch == 0)
                        {
                            solid = 1;
                        }
                    }
                    global.firealarmer = 0;
                }
                else
                {
                    with (objCellDoor)
                    {
                        solid = 0;
                    }
                }
            }
            else
            {
                if (audio_is_playing(sndFireAlarm))
                {
                    audio_sound_gain(sndFireAlarm, 0, 6);
                }
                with (objCellDoor)
                {
                    solid = 0;
                }
            }
        }
        if (!audio_is_playing(sndFireAlarm))
        {
            audio_play_sound(sndFireAlarm, 1, true);
        }
        if (audio_is_playing(sndFireAlarm))
        {
            audio_sound_gain(sndFireAlarm, audio, 0);
        }
        if (global.firealarmertime <= 0)
        {
            if (audio_is_playing(sndFireAlarm))
            {
                audio_stop_sound(sndFireAlarm);
            }
            global.firealarmer = 0;
        }
    }
    else if (room == rmPoliceHQFloor2)
    {
        with (objCellDoor)
        {
            if (touch == 0)
            {
                solid = 1;
            }
        }
    }
}
if (room == rmPoliceHQFloor2)
{
    if (door_wasnt_open == 0)
    {
        with (objCellDoor)
        {
            solid = 0;
        }
    }
}
