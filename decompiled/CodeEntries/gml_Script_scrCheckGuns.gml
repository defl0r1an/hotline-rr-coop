i = 0;
test = 1;
count = 0;
repeat (16)
{
    if (global.newgun[i] == 0)
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
ini_write_real("AchData", "Guns", count);
ini_close();
if (test == 1)
{
    scrAchievementSet("I Got New Friends");
}
