image_yscale = image_xscale;
if (image_index <= 5)
{
    global.ExplosionAnim = 0.035;
    image_xscale = lerp(image_xscale, 4, 0.25);
    scale = lerp(scale, 2, 0.25);
}
else
{
    global.ExplosionAnim = 0.15;
    image_xscale = lerp(image_xscale, 0, 0.05);
    scale = lerp(scale, 0, 0.05);
    mask_index = sprNothing;
    if (scale <= 0.1)
    {
        instance_destroy();
    }
}
global.ExplosionImpact = lerp(global.ExplosionImpact, 0, 0.25);
circlescale = lerp(circlescale, 60, 0.5);
circlealpha = lerp(circlealpha, 0, 0.15);
Explosionend = lerp(Explosionend, 10, 0.005);
