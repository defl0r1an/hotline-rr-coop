if (state == 2)
{
    audio_play_sound(sndVinylSlideIn, 0, false);
    state = 1;
    exit;
}
if (state == 1)
{
    audio_play_sound(sndVinylSlideOut, 0, false);
    state = 0;
    time = 1;
    exit;
}
restart = 1;
fade = 1;
