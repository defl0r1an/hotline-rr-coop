xskeleton = 7;
yskeleton = 46;
skeletonbroken = 0;
angleswitch = choose(2, -2);
global.PhotoNegativeCircle = 30;
global.PhotoNegativeCircleSize = 30;
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
global.igelcutscenes = 0;
global.DebuffSkippy = 0;
global.zoom = 0;
global.zoomwview = 0;
global.zoomhview = 0;
global.colorEyes = 0;
global.trailspawn = 0;
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
if (global.language == 1)
{
    scorefont = 43;
    restartfont = 44;
}
else
{
    scorefont = 6;
    restartfont = 44;
}
music = 0;
vdir = 0;
vdist = 0;
shouldscreenshot = 0;
showammo = 0;
maxammo = 0;
alpha = 1;
coldir = 0;
amount = 0;
ammostring = "";
fade = 0;
my_y = 0;
lastgrade = "";
global.dir = 0;
restart = 0;
update = 0;
dir = 0;
stats_x = 128;
ammoy = -32;
ammox = -96;
text_y = 0;
carred = 0;
next = 0;
cdir = 0;
showfinished = 0;
image_speed = 0.4;
action = 0;
wait = 0;
phonex = 0;
global.loaded = 0;
nextroom = room_next(room);
newsong = 0;
song = -1;
blackx = -10;
bamount = 0;
levelres = 0;
morj = 2;
morjalpha = 0;
morjstep = 0;
redmorj = 1;
knifecombo = 0;
comboknife = 0;
shouldscreenshot = 0;
width = display_get_width();
height = display_get_height();
global.pause_player_view_x = -1;
global.pause_player_view_y = -1;
global.mousex = ((display_mouse_get_x() - (width * 0.5)) * view_wview[0]) / width;
global.mousey = ((display_mouse_get_y() - (height * 0.5)) * view_hview[0]) / height;
vlastx = view_xview[0];
vlasty = view_yview[0];
global.enemy = -1234;
leveltitle = "";
levelshow = 240;
gridon = 0;
uzisnd = 0;
arrowdir = 0;
shellsstring = 0;
pluscombo = -10;
comboline = 0;
movingline = 0;
blankline = 0;
shellsline = 0;
timer = 0;
knifestep = 0;
brus = 0;
lastbrus = 0;
knifemerge = 0;
curknifex = 0;
kcombalpha = 0;
kcombx = view_wview[0];
kurkcombx = view_wview[0];
restartstring = "";
cdir = 0;
cdirpol = 0;
shake = 0;
russianpronouns = "";
showextraammo = 0;
ammoaddx = -32;
ammoaddstep = 0;
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
if (instance_exists(objMaskMenu))
{
    if (global.maskindex == 19)
    {
        if (global.sequence == 44)
        {
            leveltitle = "Station de métro Brickell";
        }
        if (global.sequence == 46)
        {
            leveltitle = "East 7th St";
        }
        if (global.sequence == 48)
        {
            leveltitle = "Nord Ouest 184th St";
        }
        if (global.sequence == 50)
        {
            leveltitle = "Sud Ouest 53ème place";
        }
        if (global.sequence == 52)
        {
            leveltitle = "Nord Ouest 24th St";
        }
        if (global.sequence == 54)
        {
            leveltitle = "Sud Ouest 104th St";
        }
        if (global.sequence == 56)
        {
            leveltitle = "Nord Ouest 151st Place";
        }
        if (global.sequence == 71)
        {
            leveltitle = "Sud East 122nd St";
        }
        if (global.sequence == 73)
        {
            leveltitle = "Nord East 165th ";
        }
        if (global.sequence == 75)
        {
            leveltitle = "Nord East 24th St";
        }
        if (global.sequence == 77)
        {
            leveltitle = "East 7th St";
        }
        if (global.sequence == 79)
        {
            leveltitle = "Sud East 24th St";
        }
        if (global.sequence == 84)
        {
            leveltitle = "Ouest 25th St";
        }
        if (global.sequence == 86)
        {
            leveltitle = "Sud 86th St";
        }
        if (room == rmTestRoom)
        {
            leveltitle = "Jeu vidéo d'action";
        }
    }
    else
    {
        if (global.sequence == 44)
        {
            leveltitle = "Brickell Metro Station";
        }
        if (global.sequence == 46)
        {
            leveltitle = "East 7th St";
        }
        if (global.sequence == 48)
        {
            leveltitle = "North West 184th St";
        }
        if (global.sequence == 50)
        {
            leveltitle = "South West 53rd Place";
        }
        if (global.sequence == 52)
        {
            leveltitle = "North West 24th St";
        }
        if (global.sequence == 54)
        {
            leveltitle = "South West 104th St";
        }
        if (global.sequence == 56)
        {
            leveltitle = "North West 151st Place";
        }
        if (global.sequence == 71)
        {
            leveltitle = "South East 122nd St";
        }
        if (global.sequence == 73)
        {
            leveltitle = "North East 165th ";
        }
        if (global.sequence == 75)
        {
            leveltitle = "North East 24th St";
        }
        if (global.sequence == 77)
        {
            leveltitle = "East 7th St";
        }
        if (global.sequence == 79)
        {
            leveltitle = "South East 24th St";
        }
        if (global.sequence == 84)
        {
            leveltitle = "West 25th St";
        }
        if (global.sequence == 86)
        {
            leveltitle = "South 86th St";
        }
        if (room == rmTestRoom)
        {
            leveltitle = "Action videogame";
        }
    }
}
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
if (instance_exists(objPlayerGriffin))
{
    if (room == rmGriffin)
    {
        leveltitle = "Somewhere in nevada...";
    }
}
scrLevelRestart();
if (global.strah == 1 && instance_exists(objPlayerMouse))
{
    instance_create(objPlayerMouse.x, objPlayerMouse.y, object1488);
}
