if (global.hardmode == 1 && global.maskindex == 2)
{
    exit;
}
if (sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || (global.powerIgel == 0 && global.maskindex == 27))
{
    nothing = 1;
}
else
{
    global.test = 0;
    if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objEnemy))
    {
        with (objEnemy)
        {
            if (object_index == objDogPatrol || object_index == objEnemyFat || object_index == objInspector || object_index == objEFatGunner || object_index == objEDodger || object_index == objEDodgerG || object_index == objEDodgerPatrol || object_index == objEDodgerGPatrol || object_index == objEFatGiveUp || global.test > 0)
            {
                nothing = 1;
            }
            else if (place_meeting(x - lengthdir_x(12, objPlayer.dir), y - lengthdir_y(12, objPlayer.dir), objPlayer))
            {
                my_id = instance_create(objPlayer.x + lengthdir_x(7, objPlayer.dir), objPlayer.y + lengthdir_y(7, objPlayer.dir), objPAttackThroat);
                my_id.maskindex = objPlayer.maskindex;
                my_id.maskon = 1;
                if (scrIsPolice(object_index))
                {
                    my_id.sprite_index = sprPKillThroatPolice;
                }
                my_id.image_angle = objPlayer.dir;
                instance_destroy();
                audio_play_sound(sndThrow, 0, false);
                audio_play_sound(sndHitWall, 0, false);
                global.test = 1;
                if (sprite_index == sprEWalkUnarmed || sprite_index == sprPoliceWalkUnarmed || sprite_index == sprEGiveUp || global.maskindex == 11 || (global.maskindex == 6 && global.hardmode == 1))
                {
                    noweapon = 1;
                }
                else
                {
                    noweapon = 0;
                }
                scrIdleGetEnemy();
                if (noweapon == 0)
                {
                    my_id = instance_create(x, y, objWeaponThrow);
                    my_id.direction = (direction - 115) + random(50);
                    my_id.speed = 2 + random(1);
                    my_id.image_index = scrCurrentWeaponExt(sprite_index);
                    my_id.ammo = ammo;
                }
                if (global.maskindex == 11)
                {
                    if (sprite_index != sprEWalkUnarmed || sprite_index != sprPoliceWalkUnarmed || sprite_index != sprEGiveUp)
                    {
                        my_id.gun = scrIndexToWeapon(scrCurrentWeaponExt(sprite_index));
                        if (global.hardmode == 1)
                        {
                            my_id.ammo = floor(ammo / 2);
                        }
                        else
                        {
                            my_id.ammo = ammo;
                        }
                    }
                }
            }
        }
        if (global.test == 1)
        {
            if (sprite_index == sprPAttackPunch || sprite_index == sprPWalkUnarmed || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPJacketKillDog || (global.maskindex == 6 && global.hardmode == 1))
            {
                nothing = 1;
            }
            else
            {
                my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
                my_id.image_index = lastweapon;
                my_id.direction = dir + 70 + random(40);
                my_id.speed = 1 + random(2);
                my_id.ammo = lastammo;
            }
            global.test = 3;
            instance_destroy();
            exit;
        }
    }
}
