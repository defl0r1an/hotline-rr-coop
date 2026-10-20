// Host: leave the floor through exit argument0 (objTransitioner / objTeleporter) for the partner, or while the
// host's player is dead. Same checkpoint saves as the exits' own Collision_98, but the host's body is not carried
// along: both players start the next floor at its normal start point (code5320 restores the saved weapon).
var tr;
tr = argument0;
global.combosave = global.combo;
global.combotimesave = global.combotime;
if (global.maskindex == 13 && global.hardmode == 1)
{
    global.combotime = 240;
    global.combotimesave = global.combotime;
}
global.drawscoresave = global.drawscore;
global.myscoresave = global.myscore;
global.flexibilityscoresave = global.flexibilityscore;
global.mobilityscoresave = global.mobilityscore;
global.specialscoresave = global.specialscore;
global.killscoresave = global.killscore;
global.boldscoresave = global.boldscore;
global.comboscoresave = global.comboscore;
global.shellssave = global.shells;
global.knivessave = global.knives;
global.meleeenergiesave = global.meleeenergie;
global.bigballssave = global.bigballs;
global.dogsavelife = global.dogsave;
global.BuffSkippysave = global.BuffSkippy;
global.gascount = 0;
if (instance_exists(objPlayerMouse))
{
    global.sprinttime = objPlayerMouse.alarm[3];
    global.coolingtime = objPlayerMouse.alarm[1];
    global.weaponsprite = objPlayerMouse.sprite_index;
    global.ammoweapon = objPlayerMouse.ammo;
    global.throwindex = objPlayerMouse.throwindex;
}
if (tr.object_index == objPlayerCarEnter || tr.object_index == object1052 || tr.object_index == objGriffinCar)
{
    objEffector.nextroom = scrCarNextRoom(room);
    if (!audio_is_playing(sndCarEngine))
    {
        audio_play_sound(sndCarEngine, 1, false);
    }
}
else if (tr.object_index == objMCBike)
{
    objEffector.nextroom = scrGetRoom();
    audio_play_sound(sndBikeStart, 0, false);
}
else
{
    objEffector.nextroom = tr.nextroom;
}
with (objPlayerDead)
{
    instance_destroy();
}
objEffector.next = 1;
objEffector.fade = 1;
external_call(global.coop_f_log, "host: leaving " + room_get_name(room) + " for room " + string(tr.nextroom) + " (partner's exit or host dead)");
