if (global.xbox == 1)
{
    scrInitXboxButtons();
}
image_speed = 0;
talkto = 0;
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
legdir = 0;
legindex = 0;
left = 1;
griffinspd = 0;
griffinaccuracy = 0;
ammo = 17;
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
