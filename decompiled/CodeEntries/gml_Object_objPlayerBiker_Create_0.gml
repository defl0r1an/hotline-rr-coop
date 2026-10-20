global.maskindex = 0;
global.maskon = 0;
global.skinmask[0] = "0Biker";
global.flickerCharge = 0;
global.igelcutscenes = 0;
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
global.pigkill = 0;
image_speed = 0;
talkto = 0;
dir = 0;
movex = 0;
movey = 0;
move = 0;
global.helmet = 1;
viewspeed = 0;
myxspeed = 0;
myyspeed = 0;
myspeed = 0;
reload = 20;
light = 0;
legdir = 0;
melenergie = 0;
legindex = 0;
left = 1;
meleeenergie = 2;
cooldown = 0;
impside = 0;
impx = 0;
impy = 0;
impact = 0;
ammo = global.ammoweapon;
energie = 1;
global.enemy = -1234;
clear = 0;
aim = 0;
if (!place_free(x, y))
{
    x = global.executionx;
    y = global.executiony;
}
aimfar = 0;
if (audio_is_playing(sndTyping))
{
    audio_pause_sound(sndTyping);
}
bloodsled = 0;
bloodstep = 0;
bloodscale = 1;
