global.done = 1;
global.locked = 0;
with (objDoorV)
{
    if (object_index == objDoorH)
    {
        sprite_index = sprHospitalDoorH;
    }
    else if (object_index == objDoorV)
    {
        sprite_index = sprHospitalDoorV;
    }
    else
    {
        instance_destroy();
    }
}
with (objVendingMachine)
{
    sprite_index = sprHospitalVendingMachine;
}
