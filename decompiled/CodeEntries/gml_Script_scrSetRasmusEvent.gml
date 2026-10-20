chance = argument2 / 100;
if (argument1 >= global.eventpriority && (global.maskindex == 1 || instance_exists(objMaskMenu)) && global.hardmode && random(1) <= chance)
{
    if (global.eventactive != 0)
    {
        global.eventcancel = 1;
        global.eventactive = -1;
        global.rasmustalk = 0;
    }
    else
    {
        global.eventupdate = 1;
    }
    global.eventmessage = argument0;
    global.rasmustalkstyle = argument3;
    if (argument3 == undefined)
    {
        global.rasmustalkstyle = "typical";
    }
}
