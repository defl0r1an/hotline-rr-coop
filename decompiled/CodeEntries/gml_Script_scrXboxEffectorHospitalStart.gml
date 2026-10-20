if (fade == 0 && amount == 180)
{
    if (instance_exists(objPlayer))
    {
        if (objPlayer.persistent == true)
        {
            objPlayer.persistent = false;
        }
    }
    global.lastroom = room;
    room_persistent = true;
    screen_save(working_directory + "\pause.bmp");
    global.sprite = sprite_add(working_directory + "\pause.bmp", 0, false, false, 0, 0);
    room = rmPause;
}
