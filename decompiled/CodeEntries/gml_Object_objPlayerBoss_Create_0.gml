image_speed = 0;
alert = 0;
state = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
lastsprite = sprite_index;
maskindex = 0;
global.maskindex = 0;
maskon = 1;
global.maskon = 1;
legindex = 0;
sxeasy_stop(0);
sxeasy_play(global.Release);
test = objPlayer.persistent;
objPlayer.persistent = false;
global.loaded = 1;
global.loaded = 0;
objPlayer.persistent = test;
global.jacketpath = 0;
global.gotbeaten = 0;
global.CleaverSteel = 1;
scrMasksINIT();
style[0] = 15;
style[1] = 62;
addspeed = 0;
cleaver = 0;
if (global.masksavedbiker == 5)
{
    addspeed = 0.3;
}
if (global.masksavedbiker == 16)
{
    addspeed = 0.425;
}
if ((global.masksavedbiker == 2 || global.masksavedbiker == 11) && global.hardmode == 1)
{
    style[0] = 45;
    style[1] = 80;
}
if (global.masksavedbiker == 6 && global.hardmode == 1)
{
    style[0] = 2511;
    style[1] = 2504;
    sprite_index = style[0];
}
