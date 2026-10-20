image_angle += (diradd * speed * 6);
if (speed == 0)
{
    if (surface_exists(global.surf2) && savingPassing == 0)
    {
        addToSurface(global.surf2, 0);
        speed = 0;
    }
}
