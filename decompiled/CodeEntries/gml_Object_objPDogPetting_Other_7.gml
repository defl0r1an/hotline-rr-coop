if (sprite_index == sprPDogPettingStart)
{
    image_index = 0;
    sprite_index = sprPDogPettingLoop;
}
if (End == 0 && sprite_index == sprPDogPettingLoop)
{
    image_index = 0;
    if (Petting > 0)
    {
        sprite_index = sprPDogPettingLoop;
        ini_open("Achievements.ini");
        count = ini_read_real("AchData", "Save dog", 0);
        if (!(count == 101))
        {
            count++;
            ini_write_real("AchData", "Save dog", count);
        }
        else
        {
            scrAchievementSet("101 Dalmatiner");
        }
        ini_close();
        Petting -= 1;
    }
    else
    {
        sprite_index = sprPDogPettingEnd;
    }
}
if (End == -1 && sprite_index == sprPDogPettingLoop)
{
    Petting = 0;
    image_index = 0;
    sprite_index = sprPDogPettingLoop;
    ini_open("Achievements.ini");
    count = ini_read_real("AchData", "Save dog", 0);
    if (!(count == 101))
    {
        count++;
        ini_write_real("AchData", "Save dog", count);
    }
    else
    {
        scrAchievementSet("101 Dalmatiner");
    }
    ini_close();
}
scrUpdateMaskPos(sprite_index);
