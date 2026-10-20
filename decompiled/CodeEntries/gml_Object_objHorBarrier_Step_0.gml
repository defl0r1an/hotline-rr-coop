if (!instance_exists(objPlayer))
{
    exit;
}
if (ylimit < 0)
{
    if (objPlayer.y < y && !place_meeting(x, y, objPlayer))
    {
        solid = 1;
    }
    else
    {
        solid = 0;
    }
}
if (ylimit > 0)
{
    if (objPlayer.y > y && !place_meeting(x, y, objPlayer))
    {
        solid = 1;
    }
    else
    {
        solid = 0;
    }
}
if (global.done == 1 && !instance_exists(objBoss))
{
    solid = 0;
}
