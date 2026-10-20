objEffectorHospital.blackout = 65;
spriteTruck = 2799;
stage = "Girlfriend";
lightTruck = 16777215;
audio_stop_sound(sndPhoneCallReverb);
audio_play_sound(sndPhoneReverb, 0, false);
alarm[2] = 480;
with (objUndead)
{
    stage = "Walk";
    y = 2640 + random_range(25, -25);
}
with (objLukeMorgueOpen)
{
    instance_change(objLukeMorgue, true);
}
with (objLukeMorgue)
{
    image_index = 0;
}
moveTruck = -20;
