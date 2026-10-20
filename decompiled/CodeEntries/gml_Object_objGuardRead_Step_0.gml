if (point_distance(x, y, objPlayer.x, objPlayer.y) < 56 && objPlayer.x > 192)
{
    state = "Caught";
}
if (state == "Look")
{
    if (image_index < 3)
    {
        image_index += 0.25;
    }
    else if (alarm[0] == -1)
    {
        alarm[0] = 120 + random_range(-40, 40);
    }
    if (point_distance(x, y, objPlayer.x, objPlayer.y) > 200)
    {
        test = 1;
    }
    else
    {
        test = scrLook(objPlayer.x, objPlayer.y, 4);
    }
    if ((test == 0 || test == 2) && objPlayer.plant == 0)
    {
        if (reload == 0)
        {
            speed = 0;
            state = "Caught";
        }
        else
        {
            reload -= 1;
            headdir = scrRotate(headdir, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
        }
    }
    else
    {
        reload = 30;
    }
}
if (state == "Read")
{
    headdir = direction;
    if (image_index > 0)
    {
        image_index -= 0.25;
    }
    else if (alarm[0] == -1)
    {
        alarm[0] = 240 + random_range(-40, 40);
    }
}
if (state == "Caught")
{
    if (sprite_index == sprGuardReading)
    {
        state = "Caught";
        sprite_index = sprGuardPoint;
        image_index = 0;
        objPlayer.active = 0;
        if (global.talked == 0)
        {
            scrGetMessage(1);
            global.talked = 1;
            global.doctor = id;
        }
    }
    direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
    if (image_index < 6)
    {
        image_index += 0.15;
    }
    if (!instance_exists(objPhoneConversation))
    {
        objEffector.fade = 1;
    }
}
