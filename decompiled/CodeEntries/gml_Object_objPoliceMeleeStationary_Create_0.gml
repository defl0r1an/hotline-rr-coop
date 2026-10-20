scrPoliceMeleeStationaryInit();
image_speed = 0;
image_index = random(1000);
image_speed = 0;
if (global.hardmode == 1)
{
    energie = round(random(2));
}
else
{
    energie = round(random(1));
}
direction = random(360);
my_path = path_add();
path_set_kind(my_path, 1);
path_set_precision(my_path, 2);
checkreload = floor(random(30));
ammo = 20;
ammoget = 0;
alert = 0;
reload = 13;
light = 0;
start_x = x;
start_y = y;
weaponfind = 0;
