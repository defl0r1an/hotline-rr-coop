if (instance_exists(global.enemy))
{
    global.enemy = -1234;
    exit;
}
global.enemy = scrInstanceNearestExt(global.mousex, global.mousey, 275, 332, 280, 310, 956, 316);
if (!instance_exists(global.enemy))
{
    global.enemy = -1234;
}
