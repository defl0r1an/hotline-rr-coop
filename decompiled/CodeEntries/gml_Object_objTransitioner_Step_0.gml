if (global.deadIgel == 1)
{
    visible = false;
    exit;
}
if (!instance_exists(objPlayer))
{
    exit;
}
if (room == rmTrainstationEntrance)
{
    if (objTrain.visible == true)
    {
        if (!place_meeting(x, y, objPlayer))
        {
            solid = 1;
        }
        visible = false;
        exit;
    }
}
if (instance_exists(objEnemy) || instance_exists(objKnockedOut) || instance_exists(objBoss) || instance_exists(objEHideM16) || instance_exists(objESubwayStatic) || (instance_exists(objTrainTransition) && objTrainTransition.stage != 2))
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
if (global.hardmode == 1)
{
    sprite = 2440;
}
else
{
    sprite = 1022;
}
