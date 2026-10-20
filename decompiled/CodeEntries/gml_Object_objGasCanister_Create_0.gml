image_speed = 0;
if (global.hardmode == 0)
{
    image_index = ceil(random(3));
}
else
{
    image_index = ceil(random(7));
}
if (image_index <= 3)
{
    fuel = 25;
    pitch = 1;
}
else
{
    fuel = 15;
    pitch = 1.35;
}
image_angle = random(360);
jones = 0;
light = 0;
dir = 0;
