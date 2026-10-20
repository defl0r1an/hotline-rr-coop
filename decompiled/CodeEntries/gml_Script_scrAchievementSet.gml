if (current_month >= 10)
{
    global.datefix = "";
}
if (current_minute >= 10)
{
    global.datefix1 = "";
}
if (global.cheater == 1)
{
    exit;
}
ini_open("Achievements.ini");
if (!ini_key_exists("AchGet", argument0))
{
    i = array_find_first(global.ach_title, argument0);
    if (i != -1)
    {
        ini_write_real("AchGet", argument0, 1);
        global.getachievement = 1;
        if (ds_list_empty(global.achqueue))
        {
            audio_play_sound(sndGetAchievement, 0, false);
            global.ach_get[i] = 1;
            global.achtext = global.ach_title[i];
            global.achtextdescr = global.ach_descr[i];
            global.ach_grade_hud = global.ach_grade[i];
            global.ach_disk_hud = global.ach_disk[i];
            global.ach_rank_hud = global.ach_rank[i];
        }
        ds_list_add(global.achqueue, i);
        global.achcount += 1;
        ini_write_string("AchTime", argument0, string(current_hour) + ":" + string(global.datefix1) + string(current_minute) + "    " + string(current_day) + "." + string(global.datefix) + string(current_month) + "." + string(current_year));
        ini_write_string("AchRoom", argument0, global.title);
        if (!instance_exists(objPlayer))
        {
            ini_write_real("AchMask", argument0, -1);
            ini_write_real("AchMaskSkin", argument0, -1);
        }
        else
        {
            ini_write_real("AchMask", argument0, global.maskindex);
            ini_write_real("AchMaskSkin", argument0, global.selectskin[global.maskindex]);
        }
        i = 0;
        CompleteAchievements = 0;
        repeat (array_length_1d(global.achievement))
        {
            CompleteAchievements += global.ach_get[i];
            i += 1;
        }
        if (CompleteAchievements == (array_length_1d(global.ach_title) - 1) && ini_read_real("AchGet", "Achievement Whore", 0) == 0)
        {
            ds_list_add(global.achqueue, 0);
            ini_write_real("AchGet", "Achievement Whore", 1);
        }
    }
}
ini_close();
global.datefix = 0;
global.datefix1 = 0;
