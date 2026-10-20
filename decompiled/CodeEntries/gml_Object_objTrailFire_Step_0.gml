image_xscale = image_yscale;
image_alpha = lerp(image_alpha, 0, 0.15);
image_yscale = lerp(image_yscale, 1.25, 0.075);
if (image_alpha <= 0.1)
{
    instance_destroy();
}
blend = merge_color(merge_color(c_white, c_orange, random(1)), c_red, image_alpha);
