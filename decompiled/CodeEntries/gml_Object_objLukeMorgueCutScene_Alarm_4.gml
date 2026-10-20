indexTruck++;
if (indexTruck == 1)
{
    indexTruck = 0;
}
alarm[4] = 80;
audio_sound_gain(global.currentsong, 0, 0);
if (indexTruck == 7)
{
    indexTruck = 0;
    spriteTruck = 2945;
    alarm[4] = 0;
}
objEffectorHospital.blackout = 12;
view_xview[0] = xTruck - (view_wview[0] / 2);
view_yview[0] = yTruck - (view_hview[0] / 2);
