if (image_index < 37)
{
    image_index += 0.2;
}
if (image_index > 28)
{
    with (objBombGuy)
    {
        instance_destroy();
    }
}
if (round(image_index) == 28 && BLOD == 0)
{
    audio_play_sound(sndSilencer, 0, false);
    instance_create(x - 73, y - 23, objTigerBombGuy);
    BLOD = 1;
}
