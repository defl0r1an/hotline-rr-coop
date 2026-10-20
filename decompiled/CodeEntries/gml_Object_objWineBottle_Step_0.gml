image_angle += (speed * diradd * 10);
if (on == 1)
{
    if (image_index < 3)
    {
        image_index += 0.25;
    }
}
if (global.maskindex == 26 && global.maskon == 1)
{
    image_blend = c_white;
}
else
{
    image_blend = merge_color(c_ltgray, c_white, speed * 0.5);
}
