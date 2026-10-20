nextroom = 16;
global.cursurf = 0;
if (argument0 == 89)
{
    nextroom = 91;
}
if (argument0 == 106)
{
    nextroom = 110;
}
if (argument0 == 141)
{
    global.cursurf = 2;
    nextroom = 42;
}
if (argument0 == 149)
{
    nextroom = 4;
    objEffector.restart = 1;
}
if (argument0 == 150)
{
    nextroom = 4;
    objEffector.restart = 1;
}
if (argument0 == 147)
{
    nextroom = 4;
    objEffector.restart = 1;
}
if (argument0 == 145)
{
    nextroom = 4;
    objEffector.restart = 1;
}
return nextroom;
