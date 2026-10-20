if (global.gotbeaten == 1)
{
    image_speed = 0.2;
    if (global.jacketpath == 0)
    {
        motion_add(point_direction(x, y, objJacketPath1.x, objJacketPath1.y), 0.5);
        if (speed > 3)
        {
            speed = 3;
        }
    }
    if (global.jacketpath == 1)
    {
        motion_add(point_direction(x, y, objJacketPath2.x, objJacketPath2.y), 0.5);
        if (speed > 3)
        {
            speed = 3;
        }
    }
    if (global.jacketpath == 2)
    {
        motion_add(point_direction(x, y, objJacketPath3.x, objJacketPath3.y), 0.5);
        if (speed > 3)
        {
            speed = 3;
        }
    }
    if (global.jacketpath == 3)
    {
        motion_add(point_direction(x, y, objJacketPath4.x, objJacketPath4.y), 0.5);
        if (speed > 3)
        {
            speed = 3;
        }
    }
    if (global.jacketpath == 4)
    {
        motion_add(point_direction(x, y, objJacketPath5.x, objJacketPath5.y), 0.5);
        if (speed > 3)
        {
            speed = 3;
        }
    }
    if (global.jacketpath == 5)
    {
        motion_add(point_direction(x, y, objJacketPath6.x, objJacketPath6.y), 0.5);
        if (speed > 3)
        {
            speed = 3;
        }
    }
}
