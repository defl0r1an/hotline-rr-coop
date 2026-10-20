if (instance_exists(objPlayer))
{
    if (weaponindex == -1 || objPlayer.sprite_index == sprPWalkGirlfriend)
    {
        exit;
    }
    if (open)
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
        scrSetRasmusEvent(choose("Perfect", "Should help", "Thats good", "Now you are ready"), 6, 50);
        global.pickedtrunk = 1;
        scrIndexToWeapon2(weaponindex);
        objPlayer.ammo = ammo;
        objPlayer.reload = 10;
        audio_play_sound(sndPickupWeapon, 0, false);
        ammo = 0;
        picked = 1;
        weaponindex = -1;
    }
}
