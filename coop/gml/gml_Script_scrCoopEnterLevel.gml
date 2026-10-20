// Enters a level the way objLevelTitle does, without its title card and save write.
// argument0 level (room index of the first floor), argument1 sequence, argument2 hardmode, argument3 title, argument4 pretitle
external_call(global.coop_f_log, "entering level " + string(argument0) + " from " + room_get_name(room));
// The main menu calls scrInitScore before START GAME / CHAPTERS; floors crash without it (global.combo etc.).
scrInitScore();
global.level = argument0;
global.sequence = argument1;
global.hardmode = argument2;
global.title = argument3;
global.pretitle = argument4;
// The per-level resets objLevelTitle_Create does (without its unlock / save writes); floors read these, and a
// mask.nfo left by an earlier run otherwise reached objEffector with them unset (fatal "not set before reading").
global.firsttime = 1;
global.pickedtrunk = 0;
global.overright = 0;
global.maskonsaved = 0;
global.checkpointx = 0;
global.checkpointy = 0;
if (global.hardmode == 1)
{
    global.limitreload = 15;
}
else
{
    global.limitreload = 30;
}
global.sranklock = 0;
global.NotSaved = 1;
global.shells = 0;
if (global.level != 148)
{
    global.PauseRestart = 1;
}
room_goto(global.level);
