if (!instance_exists(objPlayer))
{
    exit;
}
if (room == rmSequence8 || room == rmSequence9 || room == rmSequence10 || room == rmSequence11 || room == rmSequence12)
{
    if (file_exists(working_directory + "\gameunlock"))
    {
        if (place_meeting(x - lengthdir_x(12, objPlayer.dir), y - lengthdir_y(12, objPlayer.dir), objPlayer))
        {
            audio_play_sound(sndPickupWeapon, 0, false);
            audio_play_sound(sndComplete, 0, false);
            sxeasy_play(global.Lady);
            room = rmTestRoom;
        }
    }
}
