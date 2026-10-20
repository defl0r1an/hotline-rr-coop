if (abs(lengthdir_x(speed, dir)) == 0 && sound == 0)
{
    if (sprite_index != sprShotgunShell)
    {
        audio_play_sound(choose(sndCasing1, sndCasing2, sndCasing3, sndCasingPistol1, sndCasingPistol2, sndCasingPistol3), 0, false);
    }
    else
    {
        audio_play_sound(choose(sndShotgunShell, sndShotgunShell2, sndShotgunShell3), 0, false);
    }
    rotspeed *= 2;
    sound = 1;
}
image_angle += rotspeed;
if (speed == 0)
{
    speed = 0;
    rotspeed = 0;
    addToSurface(global.surf3, 1);
}
