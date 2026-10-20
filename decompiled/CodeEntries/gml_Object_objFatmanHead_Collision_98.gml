if (!instance_exists(objPlayer))
{
    exit;
}
if (!scrMovingPlayerExists())
{
    exit;
}
if (abs(other.myxspeed) > 0 || abs(other.myyspeed) > 0)
{
    direction = point_direction(objPlayer.x, objPlayer.y, x, y);
    image_angle = direction;
    speed = 3;
}
