ammo = 26;
reload = 15;
alert = 0;
checkreload = random(30);
lookreload = random(10);
angle = random(360);
path = path_add();
path_set_closed(path, 0);
check = 1;
start_x = x;
start_y = y;
starty = y;
startx = x;
startdir = direction;
image_speed = 0;
shot = 0;
returning = 0;
armed = 1;
turn = 0;
alertwait = -1;
left = 1;
killed = 0;
chasereload = -1;
energie = 1;
seen = 1;
angle = direction;
light = 0;
clip = 0;
if (object_index == objEDodgerGPatrol)
{
    scrEPatrolInit();
}
