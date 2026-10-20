if (global.xbox == 1)
{
    exit;
}
if (skip < 30)
{
    skip += 1;
}
else
{
    if (sprite == 1297)
    {
        with (objAnsweringMachine)
        {
            active = 0;
        }
    }
    instance_destroy();
}
