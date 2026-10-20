if (global.xbox == 1)
{
    scrInitXboxButtons();
}
randomexhale = round(random_range(1, 3));
image_speed = 0;
currentweapon = 0;
dir = 0;
viewspeed = 0;
reload = 0;
light = 0;
legdir = 0;
legindex = 0;
left = 1;
ammo = 0;
energie = 1;
throwreload = 0;
keycard = 0;
changeroom = 0;
plant = 0;
if (global.controller == 1)
{
    instance_create(x, y, objPlayerController);
    instance_destroy();
}
active = 1;
myxspeed = 0;
myyspeed = 0;
myspeed = 0;
last_sprite = 174;
view_xview[0] = x - (view_wview[0] / 2);
view_yview[0] = y - (view_hview[0] / 2);
xview = view_xview[0];
yview = view_yview[0];
alarm[1] = 2;
meleeenergie = 0;
global.my_id = id;
leaksled = 0;
leakstep = 0;
leakscale = 1;
breathtime = 230 + round(random(90));
bloodsled = 0;
bloodstep = 0;
bloodscale = 1;
alphaundead = 0;
