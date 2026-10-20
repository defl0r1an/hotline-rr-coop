global.maddx = x;
global.maddy = y;
Lighter = 0;
Spark = 0;
xaura = x;
yaura = y;
drank = 0;
global.dog = 0;
global.dogcheck = instance_number(objDogPatrol) + instance_number(objDogPatrolFriend);
speeddeadIgel = 3;
zoomdeadIgel = 1;
global.deadIgel = 0;
waitdeadIgel = 0;
deadIgel = 0;
dog = instance_number(objEnemy);
HotWeapon = "";
HotWeaponAlpha = 0;
HotWeaponSwitch = 0;
HotWeaponSpeed = 0;
click = 0;
clampClick = 0;
soundCharge = 0;
blockSkippy = 0;
global.deadScreenIgelSpeed = 0;
global.deadScreenIgel = 0;
waitidle = 0;
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
image_speed = 0;
currentweapon = 0;
dir = 0;
aimon = 1;
speeddeadIgel = 3;
viewspeed = 0;
reload = 0;
light = 0;
legdir = 0;
legindex = 0;
left = 1;
ammo = 0;
energie = 1;
throwreload = 0;
cooldown = 0;
bled = 0;
global.knives = global.knivessave;
global.meleeenergie = global.meleeenergiesave;
if (global.controller == 1)
{
    instance_create(x, y, objPlayerController);
    instance_destroy();
}
scrInitThrowPos();
scrInitMaskPos();
throwindex = 0;
alarm[0] = 18;
last_sprite = sprite_index;
maskon = 0;
maskindex = 0;
previousx = x;
meleeenergie = 2;
previousy = y;
active = 1;
knifeammo = 3;
colorredux = 0;
if (room == rmSequence13Downstairs)
{
    active = 0;
}
myxspeed = 0;
myyspeed = 0;
myspeed = 0;
if (room == rmSecretSewer)
{
    global.checkpointx = x;
    global.checkpointy = y;
    maskon = 1;
    maskindex = global.maskindex;
    global.maskon = 1;
}
bloodsled = 0;
bloodstep = 0;
bloodscale = 1;
