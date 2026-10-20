if (speed > 0)
{
    image_angle += (7.5 * speed * diradd);
}
with (objRain)
{
    if (visible == true)
    {
        with (objLegSled)
        {
            image_alpha = lerp(image_alpha, 0, 0.015);
        }
        with (objScalpelBlood)
        {
            image_alpha = lerp(image_alpha, 0, 0.015);
        }
    }
}
