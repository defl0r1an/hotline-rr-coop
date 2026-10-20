objEffectorHospital.blackout = 12;
stage = "DreamPeople";
indexTruck = 7;
spriteTruck = 2846;
moveTruck = 30;
objDreamPeopleMorgue.visible = true;
objLight.visible = true;
objPlayer.visible = false;
sxeasy_play(global.SilverLights);
audio_sound_gain(global.currentsong, 0, 0);
with (objLukeMorgueOpen)
{
    instance_change(objLukeMorgue, true);
}
with (objLukeMorgue)
{
    image_index = 0;
}
with (objSmokeBreathing)
{
    visible = false;
}
