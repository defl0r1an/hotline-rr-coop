if (sprite_index == sprGriffinReload9mm)
{
    exit;
}
if (global.xbox == 1)
{
    exit;
}
if (reload > 0)
{
    exit;
}
sprite_index = sprGriffinAttackKnife;
image_index = 0;
image_speed = 0.5 + griffinspd;
reload = 15 + griffinspd;
audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
