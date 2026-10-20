global.maddx = x;
global.maddy = y;
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
huy = 0;
click = 0;
clampClick = 0;
soundCharge = 0;
blockSkippy = 0;
idletimer = 900 + random_range(-100, 100);
global.rasmusEmCd = 360;
global.rasmusEmIndex = 0;
global.emspr = 2372;
global.deadScreenIgelSpeed = 0;
global.deadScreenIgel = 0;
waitidle = 0;
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
if (room == rmTutorial)
{
    global.maskindex = 3;
    global.maskon = 1;
    global.done = 1;
}
if (room == rmGriffin)
{
    global.maskindex = 26;
    global.maskon = 1;
    global.done = 1;
}
Lighter = 0;
Spark = 0;
xaura = x;
yaura = y;
global.pigkill = 0;
image_speed = 0;
currentweapon = 0;
dir = 0;
movex = 0;
movey = 0;
move = 0;
viewspeed = 0;
prevsprite = sprite_index;
myxspeed = 0;
myyspeed = 0;
myspeed = 0;
reload = 20;
emptyclick = 0;
light = 0;
meleeenergie = 2;
bloodsled = 0;
bloodstep = 0;
bloodscale = 1;
watersled = 0;
legdir = 0;
legindex = 0;
left = 1;
ammo = 0;
knifeammo = 3;
debuffammo = 0;
colorredux = 0;
shell = 0;
active = 1;
cooldown = 0;
slowhit = 0;
flame = 0;
flamethrower = 0;
impside = 0;
impx = 0;
impy = 0;
impact = 0;
bled = 0;
audioskippy = 0;
energie = round(random(1));
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 3;
    }
}
throwreload = 0;
if (global.controller == 1)
{
    instance_create(x, y, objPlayerController);
    instance_destroy();
}
scrInitThrowPos();
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
lastdir = 0;
turnwait = 0;
last_sprite = sprite_index;
throwindex = global.throwindex;
masksprite = -1;
decadenced = 0;
maskindex = global.maskindex;
maskon = global.maskon;
release = 0;
shieldwait = 0;
aim = 0;
GeorgeCamX = 0;
GeorgeCamY = 0;
GeorgeCamW = 0;
GeorgeCamH = 0;
George = 0;
bled = 0;
alarm[3] = global.sprinttime;
alarm[1] = global.coolingtime;
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 5;
    }
}
if (global.maskindex == 21 && global.maskon == 1)
{
    energie = 1;
}
global.enemy = -1234;
clear = 0;
if (!place_free(x, y))
{
    x = global.executionx;
    y = global.executiony;
}
