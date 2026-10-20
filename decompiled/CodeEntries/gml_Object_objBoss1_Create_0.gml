image_speed = 0;
image_index = random(1000);
weaponget = -1;
if (global.hardmode == 0)
{
    ammo = 0;
    energie = 2;
}
else
{
    energie = 4;
    ammo = 6;
}
state = 0;
hit = 0;
dir = 0;
killstage = 0;
if (instance_number(objBoss1) > 1)
{
    instance_destroy();
}
light = 0;
angle = direction;
shake = 0;
chasereload = -1;
lookreload = random(10);
checkreload = random(30);
pathcreate = 0;
alert = 0;
reloadshoot = 10;
reload = 35;
throwweapon = 0;
kill = -1;
randomkill = choose(0, 1);
knife = 0;
