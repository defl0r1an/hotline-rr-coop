if (ammo <= (objEffector.maxammo / 2.3))
{
    audio_play_sound(sndGunClick, 10, false);
    audio_sound_pitch(sndGunClick, random_range(0.8, 2));
}
