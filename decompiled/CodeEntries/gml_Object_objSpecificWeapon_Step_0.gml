if (global.xbox == 0)
{
    if (image_index == 23)
    {
        if (round(random(5)) == 2)
        {
            instance_create(x + lengthdir_x(3, image_angle), y + lengthdir_y(3, image_angle), objSteam);
        }
    }
}
if (lerp(hotalpha, 0, 0.01) > 0)
{
    hotalpha = lerp(hotalpha, 0, 0.01);
}
if (image_index == 26 && hotalpha > 0.2 && round(random(10)) == 1)
{
    instance_create(x, y, objSteam);
}
