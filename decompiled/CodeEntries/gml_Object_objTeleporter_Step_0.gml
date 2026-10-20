if (global.deadIgel == 1 || !instance_exists(objPlayer))
{
    visible = false;
    exit;
}
if (instance_exists(objPhone))
{
    if (global.done == 0)
    {
        if (!place_meeting(x, y, objPlayer))
        {
            solid = 1;
        }
        visible = false;
        exit;
    }
}
if (instance_exists(objEnemy) || instance_exists(objKnockedOut) || instance_exists(objBoss) || instance_exists(objEHideM16))
{
    if (!place_meeting(x, y, objPlayer))
    {
        solid = 1;
    }
    visible = false;
}
else
{
    solid = 0;
    if (objPlayer.persistent == true)
    {
        if (!place_meeting(x, y, objPlayer))
        {
            visible = true;
            solid = 1;
        }
    }
    else
    {
        visible = true;
    }
}
if (instance_exists(objSwat) && room == rmSwatUpstairs)
{
    solid = 0;
    if (objPlayer.persistent == true)
    {
        if (!place_meeting(x, y, objPlayer))
        {
            visible = true;
            solid = 1;
        }
    }
    else
    {
        visible = true;
    }
}
