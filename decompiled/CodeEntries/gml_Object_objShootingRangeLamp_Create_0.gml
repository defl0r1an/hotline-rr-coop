image_index = 0;
image_speed = 0;
i = 0;
repeat (3)
{
    lamp[i] = choose(0, 1);
    if (lamp[i] == 1)
    {
        alarmlamp[i] = 150 + round(random(250));
    }
    else
    {
        alarmlamp[i] = 1 + round(random(6));
    }
    i++;
}
