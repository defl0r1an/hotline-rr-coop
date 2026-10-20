alpha = 1;
if (room == rmMadnessMorgue)
{
    audio_sound_gain(global.currentsong, clamp(global.mvol, 0, 1), 0);
    sxeasy_play(global.TheKnockOfTheCoffin);
}
