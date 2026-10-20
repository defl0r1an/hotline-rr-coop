if (!instance_exists(objEnemy) && !instance_exists(objEnemyBash) && !instance_exists(objKnockedOut))
{
    if (room == rmNew15)
    {
        if (global.newmasks > 0)
        {
            sxeasy_stop(0);
            room_goto(rmUnlock);
        }
        else
        {
            game_restart();
            audio_play_sound(sndComplete, 0, false);
        }
    }
    else
    {
        fade = 1;
        next = 1;
    }
}
