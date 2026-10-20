if (gettrigger_r(0) > 100 || gettrigger_l(0) > 100)
{
    if (!instance_exists(objPlayerMouseHouse) || talked == 1)
    {
        exit;
    }
    if (place_meeting(x + lengthdir_x(32, 270), y + lengthdir_y(32, 270), objPlayer))
    {
        objPlayer.image_index = 0;
        objPlayer.active = 0;
        image_index = 1;
        scrGetMessage(0);
        talked = 1;
    }
}
