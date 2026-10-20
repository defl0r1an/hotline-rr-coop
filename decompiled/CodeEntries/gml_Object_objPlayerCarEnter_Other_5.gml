global.revisit = revisit;
if (room == rmStore1 || room == rmPizzaHut1 || room == rmVideoStore1 || room == rmBar1 || room == rmStore2 || room == rmPizzaHut2 || room == rmVideoStore2 || room == rmBar2 || room == rmStore3 || room == rmPizzaHut3)
{
    global.done = 0;
}
if (room == rmTrainstationEntrance)
{
    global.checkpointx = 152;
    global.checkpointy = 16;
}
if (engine == 1 && objEffector.song == global.Miami2)
{
    global.maskon = 0;
    repeat (global.dogsave)
    {
        global.myscore += 1000;
        ds_list_add(global.bonuslist, "Mercy");
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
}
