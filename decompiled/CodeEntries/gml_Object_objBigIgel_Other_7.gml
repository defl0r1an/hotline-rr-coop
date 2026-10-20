image_speed = 0;
if (sprite_index == sprBigIgelBite && stage == 1)
{
    image_index = 9;
    stage = 2;
    wait = 15;
    with (objPlayer)
    {
        maskon = 1;
        if (global.deadIgel == 1 && room != rmBar1)
        {
            instance_destroy();
        }
    }
    global.maskon = 1;
}
if (sprite_index == sprBigIgelBite && (stage == 3 || stage == 4))
{
    image_index = 9;
}
if (sprite_index == sprBigIgelOpens)
{
    image_index = 5;
}
