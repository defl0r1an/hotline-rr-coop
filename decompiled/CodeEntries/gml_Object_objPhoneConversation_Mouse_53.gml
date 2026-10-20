if (global.xbox == 1)
{
    exit;
}
if (reload > 0)
{
    exit;
}
if (current < messages)
{
    current += 1;
}
else
{
    if (sprite == 1297)
    {
        if (instance_exists(objAnsweringMachine))
        {
            objAnsweringMachine.active = 0;
        }
    }
    instance_destroy();
}
reload = 10;
