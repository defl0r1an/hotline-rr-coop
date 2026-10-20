if (global.hlm2hud == 0)
{
    text = "CHAPTER CLEAR";
}
else
{
    text = "LEVEL CLEAR";
}
dir = 0;
dir2 = 0;
surf = surface_create(global.viewwview, global.viewhview);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
surface_reset_target();
amount = 1;
i = 0;
repeat (string_length(text))
{
    on[i] = 0;
    i += 1;
}
dir = 120;
if (global.barehanded == 1 && room == rmHouse2Upstairs)
{
    SteamSetAchievement("ACH_THESE_ARE_MY_GUNS");
}
if (room == rmSwatUpstairs)
{
    audio_stop_sound(global.currentsong);
    sxeasy_setVolume(1);
    sxeasy_play(global.Release);
    file = file_text_open_write(working_directory + "\restartmusic");
    file_text_writeln(file);
    file_text_close(file);
}
else
{
    audio_play_sound(sndComplete, 0, false);
    sxeasy_setVolume(1);
    sxeasy_play(global.Static);
}
scrSetRasmusEvent(choose("Look around...Isnt that beautiful?", "It turned out pretty well", "Is that all?", "It was way too easy", "Wheres my prize?", "I have lost count"), 1, 50);
