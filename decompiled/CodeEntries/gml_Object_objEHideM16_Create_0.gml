image_speed = 0;
shake = 0;
image_index = 5;
energie = 0;
ammo = 20;
reload = 20;
path = 0;
my_path = 0;
if (global.hardmode == 1)
{
    energie = round(random(2));
}
else
{
    energie = round(random(1));
}
checkreload = floor(random(30 / (1 + global.hardmode)));
speed = 0;
ammo = 20;
alert = 0;
reload = 0;
light = 0;
start_x = x;
start_y = y;
stopchase = 0;
weaponfind = 0;
lastsprite = sprite_index;
bloodsled = 0;
bloodstep = 0;
bloodscale = 1;
angle = 0;
dir = 0;
mags = 6;
