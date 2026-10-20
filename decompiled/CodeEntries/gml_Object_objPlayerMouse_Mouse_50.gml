if (global.xbox == 1)
{
    exit;
}
if (room == rmHotelSuite || room == rmHotel3)
{
    with (objWindowV)
    {
        if (x == 480 || x == 120)
        {
            if (y == 256 || y == 160)
            {
                if (sprite_index == sprWindowSill)
                {
                    nothing = 1;
                }
                else if (place_meeting(x - 16, y, objPlayer) || place_meeting(x + 16, y, objPlayer))
                {
                    with (objPlayer)
                    {
                        if (sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPAttackPunch || sprite_index == sprPWalkUnarmed || (global.maskindex == 6 && global.hardmode == 1))
                        {
                            nothing = 1;
                        }
                        else
                        {
                            my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir - 90), objPlayer.y + lengthdir_y(8, objPlayer.dir - 90), objWeaponThrow);
                            my_id.image_index = scrCurrentWeaponExt(sprite_index);
                            my_id.direction = dir - 70 - random(40);
                            my_id.speed = 1 + random(2);
                            my_id.ammo = ammo;
                            sprite_index = sprPWalkUnarmed;
                        }
                        instance_destroy();
                    }
                    if (room == rmHotelSuite)
                    {
                        my_id = instance_create(x - 6, y + 16, objPlayerOpenWindow);
                    }
                    else
                    {
                        my_id = instance_create(x + 6, y - 16, objPlayerOpenWindow);
                    }
                    my_id.sprite_index = sprPClimbWindow;
                    my_id.image_angle = 0;
                    if (room == rmHotel3)
                    {
                        my_id.image_yscale = -1;
                        my_id.image_xscale = -1;
                    }
                    with (my_id)
                    {
                        scrInitMaskPos();
                        scrUpdateMaskPos(sprite_index);
                    }
                    sprite_index = sprWindowSill;
                    image_index = 1;
                    if (room == rmHotelSuite)
                    {
                        my_id = instance_create(x + 6, y, objWindowOpen);
                    }
                    else
                    {
                        my_id = instance_create(x - 6, y, objWindowOpen);
                    }
                    if (room == rmHotelSuite)
                    {
                        my_id.image_xscale = -1;
                    }
                    if (room == rmHotel3)
                    {
                        my_id.image_yscale = -1;
                    }
                    reload = 2;
                    exit;
                }
            }
        }
    }
}
scrPlayerShoot(0, 0, 0, 0, 0);
