image_index = 0;
angle = random(360);
direction = angle;
speed = round(random(1));
image_speed = 0.2;
alarm[0] = 60 + random(60);
energie = round(random(1));
alert = 0;
light = 0;
legs = 0;
on = 0;
checkreload = 5;
reload = floor(random(80));
if (global.hardmode == 1)
{
    checkreload = 5;
    reload = floor(random(15));
}
path = path_add();
ammo = 0;
