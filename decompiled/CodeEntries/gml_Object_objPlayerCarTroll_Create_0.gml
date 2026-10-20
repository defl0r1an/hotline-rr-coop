endcar = 0;
sound = 0;
shake = 0;
yy = 0;
stage = "";
wait = 0;
if (stage == "MegaTroll")
{
    image_speed = 0;
    image_index = 12;
    audio_sound_pitch(audio_play_sound(sndCarThrottle, 1, false), 0.1);
    wait = 10;
}
if (stage == "")
{
    image_speed = 0.25;
    image_index = 8;
    wait = 60;
}
