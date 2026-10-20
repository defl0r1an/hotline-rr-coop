shake = lerp(shake, 0, 0.15);
if (on == 0)
{
    if (wait > 0)
    {
        wait -= 1;
    }
    else
    {
        audio_play_sound(sndTrain, 0, false);
        on = 1;
        start_time = current_time;
    }
}
else
{
    if ((current_time - start_time) >= 5000)
    {
        instance_destroy();
        exit;
    }
    shake = 5;
    if ((current_time - start_time) < 1500)
    {
        shake = (current_time - start_time) * 0.0033333333333333335;
    }
    if ((current_time - start_time) > 3500)
    {
        shake = (2000 - (current_time - start_time - 3500)) * 0.0033333333333333335;
    }
    shake /= shakestrength;
}
view_xview[0] += random_range(shake, -shake);
view_yview[0] += random_range(shake, -shake);
