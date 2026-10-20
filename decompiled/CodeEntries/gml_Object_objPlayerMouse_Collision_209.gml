if (global.god == 0)
{
    if (energie != 0)
    {
        global.shake = 3;
    }
    else
    {
        global.shake = 10;
    }
    with (other.id)
    {
        if (place_meeting(x, y, objSolid))
        {
            move_outside_solid(direction - 180, speed * 2);
            if (!place_meeting(x, y, objPlayer))
            {
                exit;
            }
        }
    }
    global.my_id = id;
    image_xscale = 1.5;
    image_yscale = 1.5;
    bullets = 0;
    energie -= 1;
    with (objEBullet)
    {
        if (place_meeting(x, y, global.my_id))
        {
            my_id = instance_create(x, y, objBloodSmoke);
            my_id.direction = (direction - 170) + random(10);
            my_id.speed = 1;
            my_id.image_angle = my_id.direction;
            my_id.image_xscale = 0.8 + random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            instance_destroy();
            global.my_id.bullets += 1;
            if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
            {
                my_id.decadenced = 1;
            }
            if (room == rmTrainstationEntrance && objTrain.visible == true)
            {
                my_id.train = 1;
            }
        }
    }
    image_xscale = 1;
    image_yscale = 1;
    edir = other.direction;
    test = 0;
    repeat (2 * bullets)
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
        my_id.sprite_index = sprBloodSplatSmall;
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(4);
        if (room == rmTrainstationEntrance && objTrain.visible == true)
        {
            my_id.train = 1;
        }
    }
    repeat (1 + random(bullets))
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1 + random(5);
        if (room == rmTrainstationEntrance && objTrain.visible == true)
        {
            my_id.train = 1;
        }
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
    }
    repeat (bullets)
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, edir), (y - 3) + random(6) + lengthdir_y(16, edir), objBloodSmoke);
        my_id.image_xscale = 1.2 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = (edir - 20) + random(40);
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.15;
        if (room == rmTrainstationEntrance && objTrain.visible == true)
        {
            my_id.train = 1;
        }
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
    }
    if (global.maskon == 1 && (global.maskindex == 9 || global.maskindex == 21))
    {
        if (energie < 0)
        {
            my_id = instance_create(x, y, objPlayerDead);
            if (bullets > 1)
            {
                my_id.sprite_index = sprPBackShotgun;
            }
            else
            {
                my_id.sprite_index = sprPBackMachinegun;
                my_id.sled = 0;
            }
            my_id.image_index = 1 + floor(random(4));
            my_id.direction = edir;
            my_id.speed = 1.5 + random(1) + (bullets * 0.15);
            my_id.image_angle = my_id.direction;
            my_id = instance_create(x + lengthdir_x(24, edir), y + lengthdir_y(24, edir), objMaskDrop);
            my_id.direction = (edir - 40) + random(80);
            my_id.speed = 1.5 + random(1);
            if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || object_index == objPlayerBiker || sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || sprite_index == sprPBagKill || sprite_index == sprPTigerKill || sprite_index == sprPPushing || sprite_index == sprPKillHeadComeOff || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPJacketKillDog)
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
                my_id.direction = (edir - 25) + random(50);
                my_id.speed = 2 + random(1);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                if (sprite_index == sprPThrowKnife)
                {
                    my_id.image_index = scrCurrentWeaponExt(prevsprite);
                }
                my_id.hotalpha = HotWeaponAlpha;
                my_id.ammo = ammo;
                if (instance_exists(objBoss))
                {
                    my_id.decadenced = 0;
                }
                if (image_index < 0)
                {
                    with (my_id)
                    {
                        instance_destroy();
                    }
                }
            }
            instance_destroy();
        }
    }
    else if (global.maskindex == 22 && sprite_index == sprPSprintChainsaw && global.hardmode == 1)
    {
        if (slowhit < 3)
        {
            slowhit += 1;
            global.shake += 10;
        }
        else
        {
            my_id = instance_create(x, y, objPlayerDead);
            if (bullets > 1)
            {
                my_id.sprite_index = sprPBackShotgun;
            }
            else
            {
                my_id.sprite_index = sprPBackMachinegun;
                my_id.sled = 0;
            }
            my_id.image_index = 1 + floor(random(4));
            my_id.direction = edir;
            my_id.speed = 1.5 + random(1) + (bullets * 0.15);
            my_id.image_angle = my_id.direction;
            my_id = instance_create(x + lengthdir_x(24, edir), y + lengthdir_y(24, edir), objMaskDrop);
            my_id.direction = (edir - 40) + random(80);
            my_id.speed = 1.5 + random(1);
            if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || object_index == objPlayerBiker || sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || sprite_index == sprPBagKill || sprite_index == sprPTigerKill || sprite_index == sprPPushing || sprite_index == sprPKillHeadComeOff || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPJacketKillDog)
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
                my_id.direction = (edir - 25) + random(50);
                my_id.speed = 2 + random(1);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                my_id.hotalpha = HotWeaponAlpha;
                my_id.ammo = ammo;
                if (instance_exists(objBoss))
                {
                    my_id.decadenced = 0;
                }
            }
            instance_destroy();
        }
    }
    else if (bullets > 1 || round(random(1)) || energie < 0)
    {
        my_id = instance_create(x, y, objPlayerDead);
        if (bullets > 1)
        {
            my_id.sprite_index = sprPBackShotgun;
        }
        else
        {
            my_id.sprite_index = sprPBackMachinegun;
            my_id.sled = 0;
        }
        my_id.image_index = 1 + floor(random(4));
        my_id.direction = edir;
        my_id.speed = 1.5 + random(1) + (bullets * 0.15);
        my_id.image_angle = my_id.direction;
        my_id = instance_create(x + lengthdir_x(24, edir), y + lengthdir_y(24, edir), objMaskDrop);
        my_id.direction = (edir - 40) + random(80);
        my_id.speed = 1.5 + random(1);
        if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || object_index == objPlayerBiker || sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || sprite_index == sprPBagKill || sprite_index == sprPTigerKill || sprite_index == sprPPushing || sprite_index == sprPKillHeadComeOff || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPJacketKillDog)
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
            my_id.direction = (edir - 25) + random(50);
            my_id.speed = 2 + random(1);
            my_id.image_index = scrCurrentWeaponExt(sprite_index);
            my_id.hotalpha = HotWeaponAlpha;
            my_id.ammo = ammo;
            if (instance_exists(objBoss))
            {
                my_id.decadenced = 0;
            }
        }
        instance_destroy();
    }
}
else
{
    exit;
}
