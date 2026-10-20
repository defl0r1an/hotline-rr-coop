angle = direction;
if (!caught)
{
    if (sprite_index == sprDoctorWalk)
    {
        scrPatrol();
    }
    if (point_distance(x, y, objPlayer.x, objPlayer.y) > 120 || scrCheckBack(point_direction(objPlayer.x, objPlayer.y, x, y), direction))
    {
        test = 1;
    }
    else
    {
        test = scrLook(objPlayer.x, objPlayer.y, 4);
    }
    if ((test == 0 || test == 2) && objPlayer.plant == 0)
    {
        if (sprite_index == sprDoctorWalk)
        {
            sprite_index = choose(sprDoctorAlarm1, sprDoctorAlarm2);
            image_speed = 0.15;
            speed = 0;
            pathdir = direction;
        }
        if (reload > 0)
        {
            reload -= 1;
        }
        else
        {
            sprite_index = sprDoctorPoint;
            image_speed = 0.15;
            objPlayer.active = 0;
            caught = 1;
            if (!instance_exists(objPhoneConversation))
            {
                scrGetMessage(0);
            }
            global.doctor = id;
            speed = 0;
        }
        direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
    }
    else
    {
        reload = 30;
    }
}
else
{
    direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
    if (!instance_exists(objPhoneConversation))
    {
        objEffector.fade = 1;
    }
}
