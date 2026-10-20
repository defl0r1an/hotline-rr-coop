if (gettrigger_r(0) > 100 || gettrigger_l(0) > 100)
{
    if (seen == 1)
    {
        exit;
    }
    if (place_meeting(x + lengthdir_x(12, objPlayer.dir - 180), y + lengthdir_y(12, objPlayer.dir - 180), objPlayer))
    {
        scrGetMessage(2);
        seen = 1;
    }
}
