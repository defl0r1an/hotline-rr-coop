if (smirked == 0)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 40)
    {
        scrGetMessage(0);
        smirked = 1;
    }
}
if (smirked == 1)
{
    if (instance_exists(objPhoneConversation))
    {
        if (image_index < 2.33)
        {
            image_index += 0.1;
        }
        else
        {
            image_index = 1;
        }
    }
    else
    {
        image_index = 0;
        smirked = 2;
        sprite_index = sprCrocodileManDie;
    }
}
if (smirked == 2)
{
    with (objFluorescentLamp)
    {
        if (instance_exists(objPlayer))
        {
            if (point_distance(x, y, objPlayer.x, objPlayer.y) > 90 && broken == 1)
            {
                audio_play_sound(sndFluorescentLampStart, 0, false);
                broken = -1;
            }
        }
    }
    global.done = 1;
    if (image_index < 4)
    {
        image_index += 0.2;
    }
}
