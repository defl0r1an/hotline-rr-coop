i = 0;
test = 1;
count = 0;
repeat (7)
{
    if (global.usedthrow[i] == 0)
    {
        test = 0;
    }
    else
    {
        count++;
    }
    i += 1;
}
ini_open("Achievements.ini");
ini_write_real("AchData", "UsedThrows", count);
ini_close();
if (test == 1)
{
    scrAchievementSet("Pitcher");
}
scrSaveAchievements();
