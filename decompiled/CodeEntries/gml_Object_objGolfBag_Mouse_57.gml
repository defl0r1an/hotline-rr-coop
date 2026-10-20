if ((instance_exists(objPlayerMouse) || (instance_exists(objPlayerMouseHouse) && global.maskindex != 2 && global.hardmode == 0)) && global.maskindex != 27)
{
    if (place_meeting(x, y, objPlayer) && image_index == 0)
    {
        if (scrNoweapon(objPlayer.sprite_index) == 0)
        {
            with (objPlayer)
            {
                lastweapon = scrCurrentWeaponExt(sprite_index);
                lastammo = ammo;
                switch (global.test)
                {
                    case 0:
                        global.dir = dir;
                        my_id = instance_create(x, y, objWeaponThrow);
                        with (my_id)
                        {
                            move_contact_solid(global.dir, 12);
                        }
                        audio_play_sound(sndThrow, 0, false);
                        if (decadenced == 1)
                        {
                            my_id.decadenced = 1;
                        }
                        with (objPlayerMouse)
                        {
                            decadenced = 0;
                        }
                        my_id.speed = 10;
                        my_id.direction = (dir - 5) + random(10);
                        my_id.ammo = lastammo;
                        my_id.image_index = lastweapon;
                        sprite_index = sprPWalkUnarmed;
                        release = 1;
                        break;
                    case 1:
                        global.dir = dir;
                        my_id = instance_create(x, y, objWeaponThrow);
                        with (my_id)
                        {
                            move_contact_solid(global.dir, 12);
                        }
                        audio_play_sound(sndThrow, 0, false);
                        if (decadenced == 1)
                        {
                            my_id.decadenced = 1;
                        }
                        with (objPlayerMouse)
                        {
                            decadenced = 0;
                        }
                        my_id.speed = 10;
                        my_id.direction = (dir - 5) + random(10);
                        my_id.ammo = lastammo;
                        my_id.image_index = lastweapon;
                        release = 1;
                        break;
                    case 2:
                        global.dir = dir + (left * -20);
                        my_id = instance_create(x, y, objThrowingWeapon);
                        with (my_id)
                        {
                            move_contact_solid(global.dir, 12);
                        }
                        audio_play_sound(sndThrow, 0, false);
                        if (decadenced == 1)
                        {
                            my_id.decadenced = 1;
                        }
                        with (objPlayerMouse)
                        {
                            decadenced = 0;
                        }
                        my_id.speed = 11;
                        my_id.direction = (dir - 5) + random(10);
                        my_id.ammo = lastammo;
                        my_id.image_index = lastweapon - 30;
                        global.usedthrow[my_id.image_index] = 1;
                        if (global.gotweapon == 0)
                        {
                            sprite_index = sprPWalkUnarmed;
                        }
                        release = 1;
                        break;
                }
            }
        }
        objPlayer.sprite_index = sprPWalkClub;
        objPlayer.reload = 10;
        image_index = 1;
        audio_play_sound(sndPickupWeapon, 0, false);
    }
}
