if (abs(lengthdir_x(speed, dir)) == 0 && sound == 0)
{
    audio_play_sound(choose(sndCasing1, sndCasing2, sndCasing3, sndCasingPistol1, sndCasingPistol2, sndCasingPistol3), 0, false);
    rotspeed *= 2;
    sound = 1;
}
if (wait > 0)
{
    wait -= 1;
}
if (wait == 0)
{
    glow = lerp(glow, 0, 0.15);
}
else
{
    glow = lerp(glow, 0, 0.005);
}
image_angle += rotspeed;
if (speed == 0)
{
    speed = 0;
    rotspeed = 0;
}
