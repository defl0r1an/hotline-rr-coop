if (speed > 0)
{
    if (wait > 0)
    {
        wait -= 1;
    }
    else
    {
        wait = 2;
        image_index += 2;
    }
}
if (speed < speedlimit || !place_free(x, y))
{
    if (speed > 0)
    {
        image_index += 1;
    }
    speed = 0;
    if (global.maskindex != 19 && !place_meeting(x, y, objSewerWaterWave) && surface)
    {
        addToSurface(global.surf2, 0);
    }
}
image_blend = c_maroon;
