i = 0;
count = 0;
repeat (18)
{
    if (global.usedgun[i] == 1)
    {
        count++;
    }
    i += 1;
}
ini_open("Achievements.ini");
ini_write_real("AchData", "UsedGuns", count);
ini_close();
if (array_length_1d(global.usedgun) == count)
{
    scrAchievementSet("Guns for a show");
}
scrSaveAchievements();
