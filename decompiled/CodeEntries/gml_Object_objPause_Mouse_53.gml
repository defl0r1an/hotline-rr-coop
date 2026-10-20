if (global.xbox == 1)
{
    exit;
}
if (state == 0)
{
    if (select == 0)
    {
        if (fade == 0)
        {
            global.paused = 1;
            if (blacky >= 1)
            {
                on = 0;
            }
        }
    }
    if (select == 1)
    {
        on = 2;
        state = 1;
    }
    if (select == 2)
    {
        if (global.NotSaved == 1)
        {
            if ((global.done == 1 && global.maskon == 1) || (global.done == 1 && global.helmet == 1))
            {
                sxeasy_stop(0);
                sxeasy_play(song);
            }
            global.paused = 1;
            if (blacky >= 1)
            {
                on = 0;
            }
            global.PauseRestart = 1;
            global.lockedcardpolice = 0;
        }
    }
    if (select == 3)
    {
        on = 3;
        state = 1;
    }
    if (select == 4)
    {
        if (on == 1)
        {
            fade = 1;
        }
        surface_free(global.surf1);
    }
}
