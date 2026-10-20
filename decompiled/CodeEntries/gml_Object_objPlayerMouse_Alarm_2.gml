if (!place_meeting(x, y, objPlayerCarEnter))
{
    if (scrNoweapon(sprite_index))
    {
        noweapon = 1;
    }
    else
    {
        noweapon = 0;
    }
    if (noweapon == 0)
    {
        my_id = instance_create(x, y, objWeaponThrow);
        my_id.image_index = scrCurrentWeaponExt(sprite_index);
        my_id.direction = dir - random_range(10, -10);
        my_id.speed = 2.5;
        my_id.ammo = ammo;
    }
    my_id = instance_create(x, y, objPVomit);
    my_id.image_angle = dir;
    instance_destroy();
}
