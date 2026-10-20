if (other.speed > 0 || other.path_index >= 0)
{
    direction = point_direction(objPlayerDead.x, objPlayerDead.y, x, y);
    image_angle = direction;
    speed = 3;
}
