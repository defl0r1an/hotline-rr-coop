if (global.hardmode == 1)
{
    my_id = instance_create(x - 5, y, objLockedDoor);
    my_id.sprite_index = sprLockedDoorOtherSide;
    instance_destroy();
}
