if (image_index < 3)
{
    if (place_meeting(x - 6, y, objPlayer) || place_meeting(x + 6, y, objPlayer) || place_meeting(x - 6, y, objEnemy) || place_meeting(x + 6, y, objEnemy))
    {
        image_index += 0.5;
    }
    else
    {
        image_index = 0;
    }
}
