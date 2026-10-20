if (argument1 == 0)
{
    mls = floor(argument0 * 16.666666666666668) % 1000;
    sec = (argument0 div 60) % 60;
    mnt = (argument0 div 3600) % 60;
    hrs = (argument0 div 216000) % 24;
    if (mls < 10)
    {
        mls = "00" + string(mls);
    }
    if (mls < 100)
    {
        mls = "0" + string(mls);
    }
    if (sec < 10)
    {
        sec = "0" + string(sec);
    }
    if (mnt < 10)
    {
        mnt = "0" + string(mnt);
    }
    if (hrs == 0)
    {
        timer_struct = string(mnt) + ":" + string(sec) + "." + string(mls);
    }
    else
    {
        timer_struct = string(hrs) + ":" + string(mnt) + ":" + string(sec) + "." + string(mls);
    }
    timer = timer_struct;
    scoretimer = timer_struct;
}
if (argument1 == 1)
{
    mls2 = floor(argument0 * 16.666666666666668) % 1000;
    sec2 = (argument0 div 60) % 60;
    mnt2 = (argument0 div 3600) % 60;
    hrs2 = (argument0 div 216000) % 24;
    if (mls2 < 10)
    {
        mls2 = "00" + string(mls2);
    }
    if (mls2 < 100)
    {
        mls2 = "0" + string(mls2);
    }
    if (sec2 < 10)
    {
        sec2 = "0" + string(sec2);
    }
    if (mnt2 < 10)
    {
        mnt2 = "0" + string(mnt2);
    }
    if (hrs2 == 0)
    {
        timer_struct2 = string(mnt2) + ":" + string(sec2) + "." + string(mls2);
    }
    else
    {
        timer_struct2 = string(hrs2) + ":" + string(mnt2) + ":" + string(sec2) + "." + string(mls2);
    }
    timer2 = timer_struct2;
}
