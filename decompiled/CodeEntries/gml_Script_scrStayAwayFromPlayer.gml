if (instance_exists(objPlayer) && global.notarget == 0)
{
    dist = point_distance(x, y, objPlayer.x, objPlayer.y);
    if (alert != 0)
    {
        if (dist < 64)
        {
            dir = point_direction(objPlayer.x, objPlayer.y, x, y);
            direction = dir - 180;
            if (place_free(x + lengthdir_x(1, dir), y + lengthdir_y(1, dir)))
            {
                x += lengthdir_x(1, dir);
                y += lengthdir_y(1, dir);
            }
            image_speed = 0.1;
        }
    }
}
