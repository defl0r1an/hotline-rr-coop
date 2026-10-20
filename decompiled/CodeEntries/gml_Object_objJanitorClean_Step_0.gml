if (smirked == 0)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 80)
    {
        scrGetMessage(0);
        smirked = 1;
    }
}
if (smirked == 1)
{
    if (instance_exists(objPhoneConversation))
    {
        vol = lerp(vol, global.mvol / 2.857142857142857, 0.015);
        audio_sound_gain(global.currentsong, clamp(global.mvol - vol, 0, 1), 0);
    }
    else
    {
        vol = lerp(vol, 0, 0.015);
        audio_sound_gain(global.currentsong, clamp(global.mvol - vol, 0, 1), 0);
    }
}
