move_bounce_all(0);
speed *= 0.2;
if (image_index == 5 || image_index == 8 || image_index == 18)
{
    audio_play_sound(sndKnifeWall, 0, false);
}
else
{
    audio_play_sound(sndHitWall, 0, false);
}
bounce = 1;
