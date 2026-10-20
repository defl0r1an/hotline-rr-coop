if (rasmus == 1 && global.maskindex != 1)
{
    exit;
}
if (instance_exists(objPlayer))
{
    if (objPlayer.sprite_index != sprPTakePhone && objPlayer.sprite_index != sprPWalkGirlfriend && objPlayer.sprite_index != sprPTakePhone2 && objPlayer.sprite_index != sprPWalkBossgun && objPlayer.sprite_index != sprPUnlockDoor)
    {
        if (point_distance(x, y, objPlayer.x, objPlayer.y) < 18 && objPlayerMouse.object_index == objPlayerMouse)
        {
            if (((global.maskindex == 6 || global.maskindex == 2) && global.hardmode == 1) || global.maskindex == 27)
            {
                exit;
            }
            if (image_index == 0)
            {
                if (objPlayer.sprite_index != sprPWalkUnarmed)
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
                                my_id.decadenced = 1;
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
                                my_id.decadenced = 1;
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
                                my_id.decadenced = 1;
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
                switch (sprite_index)
                {
                    case sprShotgunWall:
                        image_index = 1;
                        objPlayer.sprite_index = sprPWalkShotgun;
                        objPlayer.ammo = 6;
                        objPlayer.reload = 10;
                        audio_play_sound(sndPickupWeapon, 0, false);
                        break;
                    case sprSniperWall:
                        image_index = 1;
                        objPlayer.sprite_index = sprPWalkHuntingRifle;
                        objPlayer.ammo = 8;
                        if (global.hardmode == 1 && !instance_exists(objEffectorInstant))
                        {
                            objPlayer.ammo /= 2;
                        }
                        objPlayer.ammo = round(objPlayer.ammo);
                        objPlayer.reload = 10;
                        audio_play_sound(sndPickupWeapon, 0, false);
                        break;
                    case sprDbWall:
                        image_index = 1;
                        objPlayer.sprite_index = sprPWalkDoubleBarrel;
                        objPlayer.ammo = 2;
                        if (global.hardmode == 1 && !instance_exists(objEffectorInstant))
                        {
                            objPlayer.ammo /= 2;
                        }
                        objPlayer.ammo = round(objPlayer.ammo);
                        objPlayer.reload = 10;
                        audio_play_sound(sndPickupWeapon, 0, false);
                        break;
                    case sprStoykakiya:
                        image_index = 1;
                        objPlayer.sprite_index = sprPWalkPool;
                        objPlayer.ammo = 0;
                        objPlayer.reload = 10;
                        audio_play_sound(sndPickupWeapon, 0, false);
                        break;
                }
                if (objPlayer.ammo != 0)
                {
                    if (global.maskindex != 17 && global.hardmode == 1)
                    {
                        objPlayer.ammo = round(objPlayer.ammo / 2);
                    }
                    if (global.maskindex == 17 && global.hardmode == 1)
                    {
                        objPlayer.ammo = round(objPlayer.ammo / 4);
                    }
                }
                if (global.hardmode == 1 && sprite_index == sprDbWall)
                {
                    objPlayer.ammo = 1;
                }
                if (instance_exists(objBoss))
                {
                    savingPassing = 1;
                }
            }
        }
    }
}
