if (state == "Init")
{
    with (objHeadDoctorPath)
    {
        if (alt == 0)
        {
            objHeadDoctor.pathaltx[index] = x;
            objHeadDoctor.pathalty[index] = y;
            objHeadDoctor.pathx[index] = x;
            objHeadDoctor.pathy[index] = y;
        }
        else if (alt == 1)
        {
            objHeadDoctor.pathaltx[index] = x;
            objHeadDoctor.pathalty[index] = y;
        }
        else
        {
            objHeadDoctor.pathx[index] = x;
            objHeadDoctor.pathy[index] = y;
        }
        instance_destroy();
    }
    with (objHeadDoctorCloset)
    {
        if (target == 1)
        {
            objHeadDoctor.closetend = id;
        }
        else
        {
            objHeadDoctor.closetstart = id;
        }
    }
    table = instance_nearest(x, y, objHospitalDesk);
    table.visible = false;
    state = "Typing";
    if (global.hardmode)
    {
        if (global.talkedhospital == 0)
        {
            global.doctor = id;
            if (instance_exists(objPlayer))
            {
                objPlayer.active = 0;
            }
            global.headdoctor = 1;
            alarm[0] = 210;
        }
        else
        {
            alarm[0] = 10;
        }
    }
    image_speed = 0.15;
}
if (state == "Typing" && !global.hardmode)
{
    if (collision_circle(304, 112, 8, objPlayer, 0, 1) != -4)
    {
        image_speed = 0;
        sprite_index = sprHeadDoctorTypingBody;
        state = "CaughtTyping";
        if (!instance_exists(objPhoneConversation))
        {
            scrGetMessage(2);
        }
        global.doctor = id;
        objPlayer.active = 0;
    }
}
if (state == "CaughtTyping")
{
    if (!instance_exists(objPhoneConversation))
    {
        objEffector.fade = 1;
    }
}
if (state == "EndTyping")
{
    if (sprite_index == sprHeadDoctorTypingEnd && image_index >= 5)
    {
        if (round(x) > 270)
        {
            x = lerp(x, 270, 0.1);
        }
        else
        {
            chair = instance_create(x - 7, y, objHospitalArmChair);
            chair.image_angle = direction + 90;
            sprite_index = sprHeadDoctorGetUpSit;
            image_index = 0;
            image_speed = 0.15;
        }
    }
}
if (state == "GoToClosetTarget")
{
    speed = 1;
    image_angle = direction;
    image_speed = speed * 0.1;
    if (!documents)
    {
        if (round(point_distance(x, y, closetstart.x, closetstart.y)) != 0)
        {
            direction = scrRotate(direction, point_direction(x, y, closetstart.x, closetstart.y), 10);
        }
        else
        {
            searchloop = 0;
            state = "SearchCloset";
            sprite_index = sprHeadDoctorPickUpStart;
            image_speed = 0.15;
            closetstart.visible = false;
            speed = 0;
            direction = 90;
        }
    }
    else if (point_distance(x, y, pathcurrentx[progress], pathcurrenty[progress]) >= 2)
    {
        direction = scrRotate(direction, point_direction(x, y, pathcurrentx[progress], pathcurrenty[progress]), 10);
    }
    else if (progress == (array_length_1d(pathx) - 1))
    {
        state = "GoToClosetStart";
        alt = choose(0, 1);
        if (alt)
        {
            pathcurrentx = pathaltx;
            pathcurrenty = pathalty;
        }
        else
        {
            pathcurrentx = pathx;
            pathcurrenty = pathy;
        }
    }
    else
    {
        progress++;
    }
}
if (state == "GoToClosetStart")
{
    speed = 1;
    image_angle = direction;
    image_speed = speed * 0.1;
    if (documents)
    {
        if (round(point_distance(x, y, closetend.x, closetend.y)) != 0)
        {
            direction = scrRotate(direction, point_direction(x, y, closetend.x, closetend.y), 10);
        }
        else
        {
            state = "PlaceCloset";
            sprite_index = sprHeadDoctorLayDown;
            image_speed = 0.15;
            closetend.visible = false;
            speed = 0;
            direction = -90;
        }
    }
    else if (point_distance(x, y, pathcurrentx[progress], pathcurrenty[progress]) >= 2)
    {
        direction = scrRotate(direction, point_direction(x, y, pathcurrentx[progress], pathcurrenty[progress]), 10);
    }
    else if (progress == 0)
    {
        state = "GoToClosetTarget";
        alt = choose(0, 1);
        if (alt)
        {
            pathcurrentx = pathaltx;
            pathcurrenty = pathalty;
        }
        else
        {
            pathcurrentx = pathx;
            pathcurrenty = pathy;
        }
    }
    else
    {
        progress--;
    }
}
if (state == "GoToClosetStart" || state == "GoToClosetTarget" || state == "Caught")
{
    angle = direction;
    if (!caught)
    {
        if (point_distance(x, y, objPlayer.x, objPlayer.y) > 200 || scrCheckBack(point_direction(objPlayer.x, objPlayer.y, x, y), angle))
        {
            test = 1;
        }
        else
        {
            test = scrLook(objPlayer.x, objPlayer.y, 4);
        }
        if ((test == 0 || test == 2 || place_meeting(x, y, objPlayer)) && objPlayer.plant == 0)
        {
            if (reload > 0)
            {
                reload -= 1;
            }
            else
            {
                image_index = 0;
                if (sprite_index == sprHeadDoctorWalk)
                {
                    sprite_index = sprHeadDoctorPoint;
                }
                else
                {
                    sprite_index = sprHeadDoctorPointDocument;
                }
                image_speed = 0.15;
                objPlayer.active = 0;
                caught = 1;
                if (!instance_exists(objPhoneConversation))
                {
                    scrGetMessage(2);
                }
                global.doctor = id;
                speed = 0;
                state = "Caught";
            }
            direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
        }
        else
        {
            reload = 15;
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
}
