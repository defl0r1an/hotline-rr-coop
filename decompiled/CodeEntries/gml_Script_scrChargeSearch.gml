global.check = scrLook(argument0, argument1, argument2);
if (global.check == 0)
{
    alert = 1;
    alertwait = 10;
}
if (global.check == 2)
{
    alert = 2;
}
if (global.check == 1)
{
    speed = 0;
    if (alert > 0)
    {
        alert = 3;
        scrChase(path, argument0, argument1);
    }
    else
    {
        alert = 0;
    }
}
