i = 0;
test = 1;
count = 0;
repeat (51)
{
    if (global.usedkill[i] == 0)
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
ini_write_real("AchData", "UsedKills", count);
ini_close();
if (test == 1)
{
    scrAchievementSet("Always on top");
}
scrSaveAchievements();
