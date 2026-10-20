speed = 0;
if (global.blood == 0 || global.surfaces == 1)
{
    if (global.maskindex != 19 && surface && !place_meeting(x, y, objSewerWaterWave))
    {
        image_xscale = 1;
        image_yscale = image_xscale;
        addToSurface(global.surf2, 0);
    }
}
