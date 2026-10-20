scrEPatrolInit();
image_speed = 0;
image_index = random(1000);
speed = 1;
image_speed = 0.1;
if (global.hardmode == 1)
{
    energie = round(random(2));
}
else
{
    energie = round(random(1));
}
checkreload = floor(random(30 / (1 + global.hardmode)));
ammo = 20;
alert = 0;
reload = 13;
light = 0;
start_x = x;
start_y = y;
weaponfind = 0;
angle = direction;
shake = 0;
ammoget = 0;
bloodsled = 0;
bloodstep = 0;
bloodscale = 1;
