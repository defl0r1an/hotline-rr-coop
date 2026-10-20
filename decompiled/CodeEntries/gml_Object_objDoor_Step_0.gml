if (global.done == 1 || room == rmStore1 || room == rmPizzaHut1 || room == rmVideoStore1 || room == rmBar1 || room == rmStore2 || room == rmPizzaHut2 || room == rmVideoStore2 || room == rmBar2 || room == rmStore3 || room == rmPizzaHut3 || room == rmVideoStore3 || room == rmBar3)
{
    if (point_distance(x + lengthdir_x(6, image_angle), y, objPlayer.x, objPlayer.y) < 80 && objPlayer.visible == true)
    {
        if (enter == 0)
        {
            if (doorindex < 6)
            {
                if (doorindex == 0)
                {
                    doorindex += 0.5;
                }
            }
        }
        else if (doorindex > 0.25)
        {
            doorindex -= 0.25;
        }
        else if (doorindex > 0)
        {
            doorindex = 0;
        }
    }
    else if (doorindex > 0.25)
    {
        doorindex -= 0.25;
    }
    else if (doorindex > 0)
    {
        doorindex = 0;
    }
}
