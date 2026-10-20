speed += (speed / 36);
if (time > 0)
{
    time -= 1;
}
if (time == 0 && shadowlerp == 0)
{
    instance_destroy();
}
smoke = lerp(smoke, 0, smokeSpeed);
if (smoke == 0 && shadowlerp == 255 && bullet != 0)
{
    my_id = instance_create_depth(x, y, 0, objSmokeHit);
    my_id.image_speed = 0.25;
    my_id.image_angle = -direction;
    my_id.image_alpha = 1;
    if (smokeSpeed >= 0.1)
    {
        smokeSpeed -= 0.05;
    }
    smoke = 1;
}
shadow = lerp(shadow, shadowlerp, 0.25);
startx = lerp(startx, x, 0.05);
starty = lerp(starty, y, 0.05);
