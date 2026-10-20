if (room != rmApartment1Entrance)
{
    if (place_meeting(x, y - 2, objPlayer))
    {
        if (objPlayer.x > (x + 13) && objPlayer.x < (x + 19))
        {
            with (objPlayer)
            {
                instance_destroy();
            }
            instance_create(x, y, objPlayerRipTape);
            instance_destroy();
        }
    }
}
else if (room == rmApartment1Entrance)
{
    if (place_meeting(x - 2, y, objPlayer))
    {
        with (objPlayer)
        {
            if (room == rmApartment1Entrance)
            {
                if (scrNoweapon(sprite_index))
                {
                    nothing = 1;
                }
                else
                {
                    my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir - 90), objPlayer.y + lengthdir_y(8, objPlayer.dir - 90), objWeaponThrow);
                    my_id.image_index = scrCurrentWeaponExt(sprite_index);
                    my_id.direction = objPlayer.dir - 70 - random(40);
                    my_id.speed = 1 + random(2);
                    my_id.ammo = ammo;
                    sprite_index = sprPWalkUnarmed;
                }
            }
            instance_destroy();
        }
        instance_create(x - 6, y - 16, objPlayerRipTape);
        instance_destroy();
    }
}
