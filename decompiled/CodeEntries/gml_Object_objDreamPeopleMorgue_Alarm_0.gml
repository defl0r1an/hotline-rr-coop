objEffectorHospital.blackout = 12;
objDreamPeopleMorgue.visible = false;
objLight.visible = false;
with (objLukeMorgueCutScene)
{
    spriteTruck = 2846;
    stage = "PlayerStory";
    indexTruck = 1;
    sxeasy_play(global.Static);
    audio_sound_gain(global.currentsong, 0, 0);
    alarm[4] = 80;
    global.my_id = id;
}
