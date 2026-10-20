if (time > 0)
{
    time -= 1;
}
if (time < 580 && rasmus == 0)
{
    global.maskindex = 1;
    scrSetRasmusEvent("Finally...we are together", 5, 100, "mystical");
    audio_play_sound(sndEndNightmare, 0, false);
    rasmus = 1;
}
if (time < 60 && rasmus == 1)
{
    audio_stop_sound(sndEndNightmare);
    brus = 20;
    rasmus = 2;
}
if (brus == 0 && rasmus == 2)
{
    audio_sound_gain(global.currentsong, global.mvol, 0);
    sxeasy_play(global.Static);
    room_goto(rmSequence13Downstairs);
    global.RasmusMadnes = 1;
}
view_wview[0] = 442;
view_hview[0] = 249;
