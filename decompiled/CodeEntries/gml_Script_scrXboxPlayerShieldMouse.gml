if (gettrigger_r(0) > 100)
{
    scrPlayerShieldShoot();
}
else
{
    pressrtrig = 0;
}
if (gettrigger_l(0) > 100)
{
    if (pressltrig == 0)
    {
        pressltrig = 1;
        scrPlayerDropShield();
    }
}
else
{
    pressltrig = 0;
}
if (checkbutton(0, getid(8)))
{
    if (pressrstick == 0)
    {
        pressrstick = 1;
        scrXboxPlayerLockOn();
    }
}
else
{
    pressrstick = 0;
}
