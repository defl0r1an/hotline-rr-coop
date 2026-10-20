image_index = 1;
image_xscale = 0.8 + random(0.4);
image_yscale = 0.8 + random(0.4);
image_angle = random(360);
image_speed = 0.1 + random(0.3);
image_blend = merge_color(c_red, c_maroon, 0.5 + random(0.1));
train = 1;
decadenced = 1;
deadlined = 1;
surface = 1;
if (global.maskindex == 19)
{
    instance_destroy();
    exit;
}
if (place_meeting(x, y, objSewerWaterWave))
{
    image_alpha = 0;
}
