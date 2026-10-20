scrMoveSolidOn();
if (sprite_index == sprBoss1Beg)
{
    if (!instance_exists(objPhoneConversation) && instance_exists(objPlayer))
    {
        with (objPlayerMouseHouse)
        {
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.active = 1;
            my_id.sprite_index = sprite_index;
            my_id.ammo = ammo;
            my_id.maskon = 1;
            my_id.maskindex = global.maskindex;
            instance_destroy();
        }
        if (point_distance(x, y, objPlayer.x, objPlayer.y) < 12)
        {
            global.executionx = objPlayer.x;
            global.executiony = objPlayer.y;
            my_id = instance_create(x, y, objBoss1Die);
            my_id.image_angle = image_angle;
            my_id.maskindex = objPlayer.maskindex;
            instance_destroy();
            with (objPlayer)
            {
                if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || sprite_index == sprPJacketAttackKnuckles)
                {
                    nothing = 1;
                }
                else
                {
                    my_id = instance_create(x + lengthdir_x(8, dir + 90), y + lengthdir_y(8, dir + 90), objWeaponThrow);
                    my_id.image_index = scrCurrentWeaponExt(sprite_index);
                    my_id.direction = dir + 70 + random(40);
                    my_id.speed = 1 + random(2);
                    my_id.ammo = ammo;
                }
                instance_destroy();
            }
        }
    }
    if (image_index < 7.3)
    {
        image_index += 0.125;
    }
    else
    {
        image_index = 4;
    }
    exit;
}
if (!place_free(x + hspeed, y + vspeed))
{
    speed = 0;
}
if (wait > 0)
{
    wait -= 1;
}
if (speed == 0)
{
    if (wait == 0)
    {
        if (sprite_index == sprBoss1Shot || sprite_index == sprBoss1ShotShotgun)
        {
            if (dead == 1)
            {
                if (sprite_index == sprBoss1ShotShotgun)
                {
                    my_id = instance_create(x + lengthdir_x(8, image_angle + 90), y + lengthdir_y(8, image_angle + 90), objWeaponThrow);
                    my_id.image_index = 1;
                    my_id.direction = image_angle + 90 + random_range(-20, 20);
                    my_id.speed = 1 + random(2);
                    my_id.ammo = ammo;
                }
                sprite_index = sprBoss1Beg;
                scrGetMessage(1);
                image_index = 0;
                if (instance_exists(objPlayer))
                {
                    with (objPlayerMouse)
                    {
                        my_id = instance_create(x, y, objPlayerMouseHouse);
                        my_id.active = 0;
                        my_id.sprite_index = sprite_index;
                        my_id.ammo = ammo;
                        global.maskon = 1;
                        my_id.maskon = 1;
                        instance_destroy();
                    }
                }
                exit;
            }
            if (sprite_index == sprBoss1ShotShotgun)
            {
                sprite_index = sprBoss1GetUpShotgun;
            }
            else
            {
                sprite_index = sprBoss1GetUp;
            }
            image_index = 0;
        }
        if (image_index < 7)
        {
            image_index += 0.2;
        }
        else
        {
            my_id = instance_create(x, y, objBoss1);
            if (sprite_index == sprBoss1GetUpShotgun)
            {
                my_id.sprite_index = sprBoss1WalkShotgun;
                my_id.weaponget = 1;
            }
            my_id.state = 2;
            my_id.ammo = ammo;
            my_id.reloadshoot = 1 + round(random(4));
            my_id.reload = 25;
            my_id.energie = energie;
            my_id.image_angle = image_angle;
            my_id.wait = 30;
            instance_destroy();
        }
    }
    if (sprite_index == sprBoss1Shot || sprite_index == sprBoss1ShotShotgun)
    {
        if (image_index == 1)
        {
            if (instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) < 12)
            {
                if (sprite_index == sprBoss1ShotShotgun)
                {
                    my_id = instance_create(x + lengthdir_x(8, image_angle + 90), y + lengthdir_y(8, image_angle + 90), objWeaponThrow);
                    my_id.image_index = 1;
                    my_id.direction = image_angle + 90 + random_range(-20, 20);
                    my_id.speed = 1 + random(2);
                    my_id.ammo = ammo;
                }
                global.executionx = objPlayer.x;
                global.executiony = objPlayer.y;
                with (objPlayer)
                {
                    if (scrNoweapon(sprite_index))
                    {
                        nothing = 1;
                    }
                    else
                    {
                        my_id = instance_create(x + lengthdir_x(8, dir + 90), y + lengthdir_y(8, dir + 90), objWeaponThrow);
                        my_id.image_index = scrCurrentWeaponExt(sprite_index);
                        my_id.direction = dir + 70 + random(40);
                        my_id.speed = 1 + random(2);
                        my_id.ammo = ammo;
                    }
                    instance_destroy();
                }
                my_id = instance_create(x, y, objBoss1Die);
                my_id.image_angle = image_angle;
                my_id.maskindex = global.maskindex;
                instance_destroy();
            }
        }
    }
}
