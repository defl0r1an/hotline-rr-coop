move_bounce_all(0);
speed *= 0.3;
if (image_index == 5 || image_index == 8 || image_index == 18 || image_index == 47 || image_index == 49)
{
    audio_play_sound(sndKnifeWall, 0, false);
}
else
{
    audio_play_sound(sndHitWall, 0, false);
}
bounce = 1;
