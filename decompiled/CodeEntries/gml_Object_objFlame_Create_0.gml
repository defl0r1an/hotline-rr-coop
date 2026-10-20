image_speed = 0.3;
alarm[0] = 16 + round(random(6));
if (instance_exists(objPlayerMouse))
{
    flame = objPlayerMouse.flame;
    objPlayerMouse.flame = id;
}
wave = 0;
wavelerp = 0;
image_xscale = 0.65;
image_yscale = image_xscale;
dir = 0;
alpha = 0;
