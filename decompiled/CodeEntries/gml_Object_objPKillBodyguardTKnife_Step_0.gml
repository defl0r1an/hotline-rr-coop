if (image_index < 32)
{
    image_index += 0.2;
}
else
{
    instance_destroy();
    my_id = instance_create(x, y, objBodyguardCrawl);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprBodyguardTurnKnife;
}
if (state == 0)
{
    state = 1;
    audio_play_sound(sndSwing1, 10, false);
}
if (image_index > 27 && state == 1)
{
    state = 2;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.reload = 30;
    my_id.sprite_index = sprPWalkButterfly;
}
