snd = global.mvol;
if (!unmuffle)
{
    mufflesound += 0.2;
    currentsound -= 0.2;
}
else
{
    mufflesound -= 0.2;
    currentsound += 0.2;
}
mufflesound = clamp(mufflesound, 0, global.mvol);
currentsound = clamp(currentsound, 0, global.mvol);
audio_sound_gain(global.currentsongmuffled, mufflesound, 0);
audio_sound_gain(global.currentsong, currentsound, 0);
