if (!instance_exists(objMaskMenu))
{
    if (global.maskindex == 14)
    {
        bamount = 1;
    }
}
scrSaveBonusList();
i = 0;
room_set_persistent(room, 1);
room_persistent = true;
if (global.maskindex == 22)
{
    with (objWeapon)
    {
        if (object_index == objWeapon)
        {
            if (jones == 1 && instance_number(objGasCanister) < countgas && const == 0)
            {
                instance_create(x, y, objGasCanister);
                instance_destroy();
            }
            else if (const == 0)
            {
                const = 1;
            }
        }
    }
}
if (global.paused == 0)
{
    scrInitPathFinding();
    if (!instance_exists(objMaskMenu))
    {
        scrCheckpoint();
    }
}
else
{
    global.paused = 0;
}
playeroncareffector = 0;
