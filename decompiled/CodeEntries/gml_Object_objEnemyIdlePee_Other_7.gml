image_index = 0;
if (sprite_index == sprEIdlePeeStop)
{
    sprite_index = sprEIdlePee;
}
if (sprite_index == sprEIdlePee)
{
    if (round(random(14)) == 2)
    {
        sprite_index = sprEIdlePeeStop;
    }
}
