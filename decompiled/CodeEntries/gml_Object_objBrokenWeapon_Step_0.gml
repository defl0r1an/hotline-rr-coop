image_angle += (speed * rotspeed);
scrMoveSolidOn();
if (!place_free(x, y))
{
    lastx = x - hspeed;
    lasty = y - vspeed;
    move_bounce_solid(0);
    x = lastx;
    y = lasty;
    speed *= 0.5;
}
scrMoveSolidOff();
