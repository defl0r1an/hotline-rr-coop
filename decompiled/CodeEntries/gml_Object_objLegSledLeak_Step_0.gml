image_alpha = lerp(image_alpha, 0, 0.15);
if (image_alpha <= 0.05)
{
    instance_destroy();
}
