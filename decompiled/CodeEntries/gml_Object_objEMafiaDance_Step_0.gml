if (!instance_exists(objPlayer))
{
    speed = 0;
    exit;
}
scrMoveSolidOn();
if (instance_exists(objPlayer))
{
    if (checkreload > 0)
    {
        checkreload -= 1;
    }
    else
    {
        checkreload = 5;
        global.check = scrLook(objPlayer.x, objPlayer.y, 4);
        if (global.check == 0 || global.check == 2)
        {
            alert = 1;
            speed = 0;
        }
    }
    if (alert == 1)
    {
        if (reload > 0)
        {
            reload -= 1;
        }
    }
    if ((alert == 1 && reload <= 0) || on == 1)
    {
        if (global.maskindex == 3 && global.hardmode == 1)
        {
            type = choose(275, 277);
        }
        else
        {
            type = 279;
        }
        my_id = instance_create(x, y, type);
        my_id.alert = 1;
        my_id.checkreload = 15;
        if (global.enemy == id)
        {
            global.enemy = my_id;
        }
        instance_destroy();
    }
}
if (alert == 0)
{
    if (!place_free(x + (hspeed * 4), y) || scrMeetDoor(x + (hspeed * 4), y))
    {
        hspeed = -hspeed;
    }
    if (!place_free(x, y + (vspeed * 4)) || scrMeetDoor(x, y + (vspeed * 4)))
    {
        vspeed = -vspeed;
    }
}
if (speed == 0)
{
    image_speed = 0.25;
    direction = lerp(direction, angle, 0.15);
}
else
{
    image_speed = 0.15;
}
scrMoveSolidOff();
