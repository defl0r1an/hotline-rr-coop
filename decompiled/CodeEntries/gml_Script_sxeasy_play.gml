if (file_exists(working_directory + "\restartmusic"))
{
    nothing = 1;
}
else
{
    audio_stop_sound(global.currentsong);
}
lastsong = global.currentsong;
thissong = string_replace(argument0, "mp3", "ogg");
global.currentsong = audio_create_stream(thissong);
my_id0 = audio_play_sound(global.currentsong, 100, true);
if (argument0 == global.Knock)
{
    global.currentsongmuffled = audio_create_stream(string_replace(global.KnockMuffled, "mp3", "ogg"));
    audio_play_sound(global.currentsongmuffled, 100, true);
    audio_sound_gain(global.currentsongmuffled, 0, 0);
}
audio_sound_gain(global.currentsong, global.mvol, 0);
if (string(lastsong) == "")
{
    nothing = 1;
}
else if (file_exists(working_directory + "\restartmusic"))
{
    nothing = 1;
}
else
{
    audio_destroy_stream(lastsong);
}
if (is_string(argument0))
{
    _intendedSong = argument0;
}
else
{
    _intendedSong = "Static.mp3";
}
