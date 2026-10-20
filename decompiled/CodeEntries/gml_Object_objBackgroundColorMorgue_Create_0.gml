if (room == rmSecretSewer)
{
    instance_destroy();
    exit;
}
dir = random(1000);
lastbonus = global.bonustime;
surf1 = surface_create(room_width, room_height);
surf2 = surface_create(room_width, room_height);
i = 0;
dir = random(360);
repeat (16)
{
    xspeed[i] = lengthdir_x(0.15, dir);
    yspeed[i] = lengthdir_y(0.15, dir);
    spreadx[i] = random(192);
    spready[i] = random(104);
    spreadangle[i] = random(360);
    spreadscale[i] = 1 + random(1);
    spreadindex[i] = random(28);
    i += 1;
}
cdir = 0;
global.blink = 0;
rain_drops = ds_list_create();
scaleable = 0;
hitted = 0;
alpha = 1;
global.EnergieSkippyGun = 2 + global.hardmode;
if (global.hardmode == 0)
{
    lifeIgel = 4;
}
else
{
    lifeIgel = 1;
}
