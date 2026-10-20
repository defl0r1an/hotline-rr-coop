if (level == "AUDIO")
{
    if (alt[select] == "MASTER VOLUME")
    {
        if (global.smvol > 0)
        {
            global.smvol -= 0.01;
        }
        sxeasy_setMasterVolume(0);
    }
    else if (alt[select] == "SFX VOLUME")
    {
        if (global.svol > 0)
        {
            global.svol -= 0.01;
        }
        sxeasy_setVolume(0);
    }
    else if (alt[select] == "MUSIC VOLUME")
    {
        if (global.mvol > 0)
        {
            global.mvol -= 0.01;
        }
        sxeasy_setMusicVolume(0);
    }
}
