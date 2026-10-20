if (image_index < 2)
{
    image_index += 0.15;
}
else if (global.maskindex != 19 && surface_exists(global.surf2) && surface && !place_meeting(x, y, objSewerWaterWave))
{
    addToSurface(global.surf2, 0);
}
