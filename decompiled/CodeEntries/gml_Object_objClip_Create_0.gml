friction = 0.1;
image_speed = 0;
rotspeed = (-1 + (round(random(1)) * 2)) * random(5);
startspeed = 0.1;
if (!audio_is_playing(sndMagFall1))
{
    audio_play_sound(sndMagFall1, 0, false);
}
