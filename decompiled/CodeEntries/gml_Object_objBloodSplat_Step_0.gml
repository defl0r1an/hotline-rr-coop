if (image_index < 3)
{
    image_index += advancespeed;
}
else
{
    image_speed = 0;
    if (global.maskindex != 19 && surface_exists(global.surf2) && surface && !place_meeting(x, y, objSewerWaterWave))
    {
        addToSurface(global.surf2, 0);
    }
    speed = 0;
}
