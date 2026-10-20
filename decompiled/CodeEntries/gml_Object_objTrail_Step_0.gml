image_xscale = image_yscale;
image_alpha = lerp(image_alpha, 0, 0.15);
image_yscale = lerp(image_yscale, 1.5, 0.05);
if (image_alpha <= 0.1)
{
    instance_destroy();
}
blend = merge_color(c_purple, image_blend, image_alpha);
