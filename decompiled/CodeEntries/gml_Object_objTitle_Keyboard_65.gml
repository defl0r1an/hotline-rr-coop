if (level == 2)
{
    if (fade == 1 || wait > 0)
    {
        exit;
    }
    wait = 2;
    if (select == 0)
    {
        if (global.smvol > 0)
        {
            global.smvol -= 0.01;
        }
        sxeasy_setMasterVolume(1);
    }
    if (select == 1)
    {
        if (global.svol > 0)
        {
            global.svol -= 0.01;
        }
        sxeasy_setVolume(1);
    }
    if (select == 2)
    {
        if (global.mvol > 0)
        {
            global.mvol -= 0.01;
        }
        sxeasy_setMusicVolume(1);
    }
}
