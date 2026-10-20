if (startspeed == 0)
{
    startspeed = speed;
}
image_angle += rotspeed;
if (speed == 0)
{
    speed = 0;
    rotspeed = 0;
}
if (!place_free(x, y))
{
    speed = 0;
}
