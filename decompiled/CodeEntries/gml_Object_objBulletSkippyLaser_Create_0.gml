passed = 0;
caliber = 1;
global.noguns = 0;
startx = x;
starty = y;
swat = 0;
bullet = 0;
speed = 12;
speedlerp = speed;
if (global.hardmode == 0 && instance_exists(objBackgroundColor))
{
    line = 9 + objBackgroundColor.lifeIgel;
}
else
{
    line = 13;
}
collision = 0;
pop = 0;
skippy = 0;
Igel = 1;
alphaend = 255;
alpha = 255;
circlescalespeed = 0.015;
i = 0;
repeat (line)
{
    linexend[i] = x;
    lineyend[i] = y;
    linex[i] = x;
    liney[i] = y;
    linealphaend[i] = 255;
    linealpha[i] = 255;
    circlescale[i] = 0;
    i += 1;
}
