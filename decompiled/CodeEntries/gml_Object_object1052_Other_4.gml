revisit = 0;
if (instance_exists(objPlayerMouseHouse))
{
    if (global.done == 1)
    {
        nextroom = 12;
    }
    else
    {
        nextroom = 8;
        global.interlude = scrCarNextInterlude();
    }
}
else
{
    nextroom = 12;
}
