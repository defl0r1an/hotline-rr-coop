if (image_index < 2)
{
    image_index += addspeed;
}
else if (global.blood == 0 || global.surfaces == 1)
{
    speed = 0;
    if (global.maskindex != 19 && surface && !place_meeting(x, y, objSewerWaterWave))
    {
        addToSurface(global.surf2, 0);
    }
}
