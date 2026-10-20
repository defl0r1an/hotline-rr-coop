if (global.xbox == 1)
{
    exit;
}
if (reload > 0)
{
    exit;
}
reload = 10;
if (current < messages)
{
    if (face[current] > face[current + 1])
    {
        change = 1;
    }
    if (face[current] < face[current + 1])
    {
        change = 1;
    }
    current += 1;
}
else
{
    stop = 1;
}
if (line1[current] == "'I was born in the usa'?")
{
    audio_play_sound(sndComplete, 0, false);
    sxeasy_play(global.BlackTar);
}
