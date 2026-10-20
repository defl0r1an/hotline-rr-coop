if (global.xbox == 1)
{
    exit;
}
if (!instance_exists(objPlayer) || global.deadIgel == 1)
{
    scrSaveAchievements();
    fade = 1;
    next = 0;
}
