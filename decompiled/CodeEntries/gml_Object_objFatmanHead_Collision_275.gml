if (!instance_exists(objPlayer))
{
    exit;
}
if (other.speed > 0 || other.path_index >= 0)
{
    direction = point_direction(objPlayer.x, objPlayer.y, x, y);
    image_angle = direction;
    speed = 3;
}
