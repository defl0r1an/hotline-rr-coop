if (global.checkpointx > 152)
{
    if (global.hardmode == 1)
    {
        my_id = instance_create(56, 228, objHobo);
        my_id.sprite_index = sprHoboWalkDoubleBarrel;
        my_id.ammo = 2;
    }
    else
    {
        my_id = instance_create(52, 304, objHobo);
    }
    my_id.direction = 260 + random(20);
    my_id.state = 1;
    image_index = 3;
    on = 1;
}
