if (instance_exists(objPlayer))
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 28 && !((global.maskindex == 2 || global.maskindex == 6) && global.hardmode == 1))
    {
        if (!active)
        {
            audio_play_sound(sndDoorOpen, 0, false);
            active = 1;
        }
    }
}
