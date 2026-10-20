xskeleton = 7;
yskeleton = 46;
skeletonbroken = 0;
global.PhotoNegativeCircle = 30;
global.PhotoNegativeCircleSize = 30;
angleswitch = choose(2, -2);
global.IgelEmotions = "IgelBlink";
global.IgelEmotionsimageindex = 0;
global.IgelEmotionsEnd = 0;
global.IgelEmotionsWait = 0;
global.deadIgel = 0;
global.flickerspeed = 0.15;
global.flicker = 0;
global.flickerCharge = 0;
global.PShaking = 0;
global.soundDebuff = 1;
global.GlowDebuff = 0;
global.GlowSkippy = 0;
global.GlowCharge = 0;
global.chargeSkippy = 0;
if (!(room == rmDream2 || room == rmSequence5))
{
    global.igelcutscenes = 0;
}
global.DebuffSkippy = 0;
global.zoom = 0;
global.zoomwview = 0;
global.zoomhview = 0;
global.colorEyes = 0;
global.trailspawn = 0;
if (global.language == 1)
{
    dialoguefont = 8;
    scorefont = 43;
    restartfont = 44;
}
else
{
    if (global.dialoguestyle == 0)
    {
        dialoguefont = 44;
    }
    else
    {
        dialoguefont = 7;
    }
    scorefont = 6;
    restartfont = 44;
}
maxammo = 0;
showammo = 0;
alpha = 1;
lastgrade = "";
global.enemy = -124123;
coldir = 0;
amount = 0;
fade = 0;
my_y = 0;
global.dir = 0;
restart = 0;
global.restart = restart;
update = 0;
dir = 0;
time = 1;
baseheight = room_height * 0.2;
lines = 0;
ammox = 0;
stats_x = 128;
ammoy = -32;
text_y = 0;
next = 0;
showfinished = 0;
image_speed = 0.4;
ammoaddx = -32;
pluscombo = -10;
showextraammo = 0;
action = 0;
wait = 0;
phonex = 0;
blackx = -15;
line1x = 0;
line2x = 0;
carred = 0;
nextroom = room_next(room);
newsong = 0;
song = global.DeepCover;
index = 0;
show_date = 0;
sprite = 1297;
shouldscreenshot = 0;
bamount = 0;
restartstring = "";
cdir = 0;
cdirpol = 0;
shake = 0;
shellsline = -6.5;
shellsstring = 0;
letterbox = 0;
showextraammo = 0;
bottleexplayer = 0;
playeroncareffector = 0;
if (global.scorestatseffector == 1)
{
    grade = "F";
    stats_y = 0;
    scoretimer = "--:--.--";
    mls = floor(global.time * 16.666666666666668) % 1000;
    sec = (global.time div 60) % 60;
    mnt = (global.time div 3600) % 60;
    hrs = (global.time div 216000) % 24;
}
levelres = 0;
if (room == rmSequence1 || room == rmSequence2 || room == rmSequence3 || room == rmSequence4 || room == rmSequence5 || room == rmSequence6 || room == rmSequence7 || room == rmSequence8 || room == rmSequence9 || room == rmSequence10 || room == rmSequence11 || room == rmSequence12 || room == rmSequence14 || room == rmHospitalTopFloor || room == rmMCBar || room == rmMCSequence2 || room == rmMCSequence3 || room == rmMCSequence4)
{
    scrShowDate(room);
    start = 1;
}
else
{
    start = 0;
}
if (room == rmSequence13Downstairs)
{
    start = 1;
}
global.loaded = 0;
width = display_get_width();
height = display_get_height();
global.pause_player_view_x = -1;
global.pause_player_view_y = -1;
global.mousex = ((display_mouse_get_x() - (width * 0.5)) * view_wview[0]) / width;
global.mousey = ((display_mouse_get_y() - (height * 0.5)) * view_hview[0]) / height;
lastbrus = 0;
brus = 0;
levelshow = 240;
if (room == rmMansionMainHall)
{
    save = 1;
}
else
{
    save = 0;
}
leveltitle = "";
if (instance_exists(objPlayerBiker))
{
    if (room == rmNoodleShop)
    {
        leveltitle = "North East 56th St";
    }
    if (room == rmArcadeDownstairs)
    {
        leveltitle = "South West 107th Place";
    }
    if (room == rmPhoneHomEntranceBiker)
    {
        leveltitle = "North West 342nd St";
    }
    if (room == rmJanitors)
    {
        leveltitle = "North 87th Place";
    }
}
scrLevelRestart();
