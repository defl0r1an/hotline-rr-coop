if (waitblink > 0)
{
    waitblink -= 1;
}
if (waitblinkOn > 0)
{
    waitblinkOn -= 1;
}
if (wait > 0)
{
    wait -= 1;
}
if (image_index > 4 && briefcase == 1)
{
    audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
    my_id = instance_create(x + lengthdir_x(4, image_angle), y + lengthdir_y(4, image_angle), objBriefcaseIgel);
    my_id.direction = image_angle;
    my_id.image_angle = image_angle;
    my_id.speed = 2.5;
    briefcase = 2;
}
if (waitblink == 0 && blink == 0)
{
    waitblinkOn = 10 + round(random(20));
    blink = 1;
}
if (waitblinkOn == 0 && blink == 1)
{
    waitblink = 10 + round(random(450));
    blink = 0;
}
if (collision_ellipse(262, 292, 132, 228, objPlayer, 0, 1))
{
    if (sound == 0)
    {
        wait = 180;
        audio_play_sound(124, 10, 0, 1.1, 0, 2);
        sound = 1;
    }
    if (head <= 0)
    {
        _diff = angle_difference(point_direction(x, y, objPlayer.x, objPlayer.y), angleHead);
        angleHead += (_diff * 0.1);
    }
}
else
{
    if (head <= 0)
    {
        _diff = angle_difference(90, angleHead);
        angleHead += (_diff * 0.1);
    }
    if (sound == 1 && briefcase == 0 && wait <= 80)
    {
        image_speed = 0.25;
        briefcase = 1;
    }
}
if (wait <= 20 && sound == 1 && (head == 1 || head == 0))
{
    _diff = angle_difference(90, angleHead);
    angleHead += (_diff * 0.1);
    head = 1;
}
if (wait == 0 && sound == 1 && briefcase == 0)
{
    image_speed = 0.25;
    briefcase = 1;
}
