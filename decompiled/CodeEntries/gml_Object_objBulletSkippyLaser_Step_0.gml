image_angle = point_direction(x, y, linex[collision - pop], liney[collision - pop]);
if (collision == line)
{
    speedlerp = 0;
    speed = 0;
    mask_index = sprNothing;
    if (skippy == 0 && instance_exists(objBackgroundColor) && objBackgroundColor.lifeIgel != 0)
    {
        objBackgroundColor.lifeIgel -= Igel;
        if (random(10) < 5 && Igel == 1)
        {
            global.IgelEmotions = "IgelAngry";
            global.IgelEmotionsimageindex = 0;
            global.IgelEmotionsWait = 0;
            global.IgelEmotionsEnd = 0;
        }
        global.BuffSkippy = 0;
    }
    skippy = 1;
    if (linealpha[line - 1] <= 0.5)
    {
        instance_destroy();
    }
}
speed = lerp(speed, speedlerp, 0.15);
startx += lengthdir_x(speed / 1.6, direction);
starty += lengthdir_y(speed / 1.6, direction);
