if (stage == "Look")
{
    _diff = angle_difference(point_direction(x, y, objPlayer.x, objPlayer.y), image_angle);
    image_angle += (_diff * 0.1);
}
if (stage == "Walk")
{
    if (point_distance(x, y, xstop, ystop) > 1 && !place_free(x + lengthdir_x(13, image_angle), y + lengthdir_y(13, image_angle)))
    {
        if (image_speed < 1)
        {
            image_speed = speed * 0.1;
        }
        move_towards_point(xstop, ystop, speed);
        speed = 0.45;
        _diff = angle_difference(point_direction(x, y, xstop, ystop), image_angle);
        image_angle += (_diff * 0.1);
    }
    else
    {
        image_index = 0;
        image_speed = 0;
        stage = "Look";
        speed = 0;
    }
}
