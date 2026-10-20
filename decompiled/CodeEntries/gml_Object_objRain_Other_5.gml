if (room != rmPoliceHQFloor1 && room != rmPoliceHQFloor2 && room != rmPoliceHQFloor3 && room != rmPoliceHQFloor3TigerHard && room != rmSequence13 && room != rmSequence13Downstairs && room != rmAlley && room != rmPause)
{
    instance_destroy();
}
if (audio_is_playing(sndRainInside))
{
    audio_stop_sound(sndRainInside);
}
if (audio_is_playing(sndRainOutside))
{
    audio_stop_sound(sndRainOutside);
}
