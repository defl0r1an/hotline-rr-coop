if (global.puzzledone == 1)
{
    global.ending = 1;
}
else
{
    global.ending = 0;
}
scrGetMessage(1 + global.ending);
global.check = 1;
