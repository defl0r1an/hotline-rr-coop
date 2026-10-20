if (current < messages)
{
    current += 1;
}
else
{
    if (sprite == 1297)
    {
        objAnsweringMachine.active = 0;
    }
    instance_destroy();
}
reload = 10;
