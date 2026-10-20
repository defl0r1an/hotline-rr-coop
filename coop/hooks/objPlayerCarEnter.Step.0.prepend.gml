// Co-op client: touching the car when floor is cleared asks the host to use the car exit.
if (global.coop_role == 2 && global.coop_active)
{
    if (place_meeting(x, y, objPlayer))
    {
        scrCoopSendReqExit(id);
        exit;
    }
}
