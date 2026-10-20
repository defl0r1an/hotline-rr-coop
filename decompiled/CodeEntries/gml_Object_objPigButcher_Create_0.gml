drank = 0;
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
global.pigkill = 0;
image_speed = 0;
currentweapon = 0;
dir = 0;
movex = 0;
movey = 0;
move = 0;
viewspeed = 0;
myxspeed = 0;
myyspeed = 0;
myspeed = 0;
reload = 20;
light = 0;
meleeenergie = 2;
legdir = 0;
legindex = 0;
left = 1;
ammo = 0;
active = 1;
energie = round(random(1));
throwreload = 0;
bloodsled = 0;
bloodstep = 0;
bloodscale = 1;
if (global.controller == 1)
{
    instance_create(x, y, objPlayerController);
    instance_destroy();
}
global.maskindex = 0;
scrInitThrowPos();
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
last_sprite = sprite_index;
throwindex = 0;
masksprite = -1;
maskindex = global.maskindex;
maskon = global.maskon;
release = 0;
shieldwait = 0;
aim = 0;
global.enemy = -1234;
clear = 0;
if (!place_free(x, y))
{
    x = global.executionx;
    y = global.executiony;
}
