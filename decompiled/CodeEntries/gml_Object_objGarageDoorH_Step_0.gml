if (global.maskon == 1 && global.maskindex == 1 && room == rmHouse5Downstairs)
{
    my_id = instance_create(x, y - 3, objGarageDoorOpenSmall);
    my_id.image_angle = -90;
    my_id.direction = my_id.image_angle;
    with (objDoorV)
    {
        if (x == 613 && y == 448)
        {
            solid = 0;
        }
    }
    with (objDecorativeWeapon)
    {
        my_id = instance_create(x, y, objSpecificWeapon);
        my_id.image_index = image_index;
        my_id.ammo = ammo;
        instance_destroy();
    }
    instance_destroy();
}
