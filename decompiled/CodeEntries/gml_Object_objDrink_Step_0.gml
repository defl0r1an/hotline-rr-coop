if (speed == 0 && objPlayer.drank == 0)
{
    on = 1;
}
if (speed == 0 && objPlayer.drank == 1)
{
    on = 0;
}
if (global.xbox == 1)
{
    scrXboxItemTake();
}
if (objPlayer.sprite_index == sprPDrink)
{
    if (objPlayer.image_index > 2 && objPlayer.image_index < 23)
    {
        visible = false;
    }
    else
    {
        visible = true;
        if (objPlayer.image_index > 23)
        {
            sprite_index = sprDrinkEmpty;
        }
    }
}
