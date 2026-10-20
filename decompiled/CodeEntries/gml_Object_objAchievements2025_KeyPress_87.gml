if ((wait == 0 && descriptionMenu == 0) && fade == 0)
{
    if (select > 0)
    {
        select -= 1;
        slideshadow[1] = 255;
        transition = 0;
    }
    else
    {
        Yachievementslerp = 10;
        select = array_length_1d(global.ach_title) - 1;
        slideshadow[0] = 255;
        transition = 1;
    }
    shadow = 0;
    slideimpact = -10;
    dir = 0;
    wait = 4;
}
