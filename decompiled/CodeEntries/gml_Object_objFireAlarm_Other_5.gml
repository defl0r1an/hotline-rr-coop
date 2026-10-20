if (audio_is_playing(sndFireAlarm))
{
    audio_stop_sound(sndFireAlarm);
}
if (room == rmPoliceHQFloor1 && global.firealarmer == 1)
{
    global.savedtime = global.firealarmertime;
}
