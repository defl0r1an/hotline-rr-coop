textF = global.ErrorText;
text = "";
texty = 0;
dir = 0;
textsize = 0;
tick = 5;
tickcount = 1;
alpha = 30;
time = string_length(textF) * 18;
alphaAll = 0;
if (room != rmSecretSewer)
{
    audio_play_sound(sndError, 0, false);
}
