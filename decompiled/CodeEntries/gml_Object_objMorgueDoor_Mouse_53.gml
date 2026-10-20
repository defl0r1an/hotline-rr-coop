if (solid == 1)
{
    if (place_meeting(x, y - 8, objPlayer))
    {
        if (objPlayer.sprite_index == sprPWalkHospital)
        {
            if (global.locked == 2)
            {
                objPlayer.x = x - 16;
                objPlayer.y = y - 16;
                audio_play_sound(sndKeycard, 0, false);
                objPlayer.sprite_index = sprPKeyHeadLockOpen;
                objPlayer.dir = -90;
                objPlayer.image_index = 0;
                objPlayer.active = 0;
                solid = 0;
            }
        }
    }
}
