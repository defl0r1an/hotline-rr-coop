if (startspeed == 0)
{
    startspeed = speed;
}
image_angle += rotspeed;
if (speed == 0)
{
    speed = 0;
    rotspeed = 0;
    addToSurface(global.surf3, 1);
}
