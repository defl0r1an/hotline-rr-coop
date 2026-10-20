if (room == rmTutorial)
{
    exit;
}
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
    shouldscreenshot = 1;
}
