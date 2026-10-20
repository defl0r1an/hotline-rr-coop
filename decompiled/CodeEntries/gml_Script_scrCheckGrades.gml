test = 0;
test2 = 0;
i = 0;
repeat (20)
{
    if (global.grade[i] < 15)
    {
        test += 1;
    }
    i += 1;
}
i = 0;
repeat (20)
{
    if (global.hardmodegrade[i] < 15)
    {
        test2 += 1;
    }
    i += 1;
}
if (test <= 4 && test2 <= 4)
{
    scrAchievementSet("Get A Life");
}
