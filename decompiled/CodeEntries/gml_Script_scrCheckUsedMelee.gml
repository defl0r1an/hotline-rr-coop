i = 0;
test = 1;
count = 0;
repeat (21)
{
    if (global.usedmelee[i] == 0)
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
ini_write_real("AchData", "UsedMelee", count);
ini_close();
if (test == 1)
{
    scrAchievementSet("Knife for pros");
}
scrSaveAchievements();
