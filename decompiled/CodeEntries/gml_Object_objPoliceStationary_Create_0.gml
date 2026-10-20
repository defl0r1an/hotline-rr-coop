bloodsled = 0;
bloodstep = 0;
bloodscale = 1;
scrPoliceStaticInit();
image_speed = 0;
image_index = random(1000);
angle = random(360);
direction = angle;
alarm[0] = 120 + random(120);
if (global.hardmode == 1)
{
    energie = round(random(2));
}
else
{
    energie = round(random(1));
}
checkreload = floor(random(30));
ammo = 20;
alert = 0;
reload = 13;
light = 0;
start_x = x;
start_y = y;
weaponfind = 0;
shake = 0;
