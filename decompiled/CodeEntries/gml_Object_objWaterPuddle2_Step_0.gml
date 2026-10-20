image_alpha = lerp(image_alpha, 0, 0.15);
image_xscale = lerp(image_xscale, 1, 0.25);
image_yscale = image_xscale;
if (speed == 0)
{
    speed = 0;
    addToSurface(global.surf3, 0);
}
