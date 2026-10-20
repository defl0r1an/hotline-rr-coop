i = 0;
test = 1;
count = 0;
repeat (28)
{
    if (global.usedmask[i] == 0)
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
ini_write_real("AchData", "UsedMasks", count);
ini_close();
if (test == 1)
{
    scrAchievementSet("Animals Fight");
}
scrSaveAchievements();
