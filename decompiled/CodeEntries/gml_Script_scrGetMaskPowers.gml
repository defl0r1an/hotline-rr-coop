if (global.maskindex == 1)
{
    if (global.pickedtrunk == 1 && instance_exists(objPlayerCarEnter) && !instance_exists(objBoss))
    {
        if (global.hardmode == 1)
        {
            if (file_exists("options.ini"))
            {
                ini_open("options.ini");
                weaptemp = ini_read_real("datahard", "trunkweapon", -1);
                ammotemp = ini_read_real("datahard", "trunkammo", 0);
                ini_close();
            }
        }
        else
        {
            weaptemp = global.trunkweapon;
            ammotemp = global.trunkammo;
        }
        scrIndexToWeapon2(weaptemp);
        ammo = ammotemp;
        with (objPlayerCarEnter)
        {
            picked = 1;
        }
    }
    if (room == rmBuildingFloor1)
    {
        with (objStroller)
        {
            touch = 0;
            image_index = 1;
            image_angle = -96;
        }
    }
}
if (global.maskindex == 9)
{
    energie = 5;
}
if (global.maskindex == 3)
{
    if (room == global.level)
    {
        sprite_index = sprJacketWalkShorty;
        ammo = 2;
        global.shells = 2;
    }
    if (global.hardmode == 1)
    {
        with (objWeapon)
        {
            if (object_index == objWeapon)
            {
                if (aubrey == 0)
                {
                    image_index = choose(0, 1, 6, 7, 9, 10, 11, 12, 28, 29);
                    scrGunIndexGetAmmo(image_index);
                }
                else
                {
                    instance_create(x, y, objShotgunShellsSupply);
                    instance_destroy();
                }
            }
        }
        with (objShotgunShellsSupply)
        {
            if (aubrey == 0)
            {
                my_id = instance_create(x, y, objWeapon);
                my_id.image_index = choose(0, 1, 6, 7, 9, 10, 11, 12, 28, 29);
                with (objWeapon)
                {
                    scrGunIndexGetAmmo(image_index);
                }
                instance_destroy();
            }
            else
            {
                instance_create(x, y, objShotgunShellsSupply);
                instance_destroy();
            }
        }
        with (objEnemyMelee)
        {
            if (object_index == objEnemyMelee)
            {
                instance_destroy();
            }
            my_id = instance_create(x, y, objEnemyPatrol);
            my_id.sprite_index = choose(sprEWalk9mm, sprEWalkScorpion);
            if (my_id.sprite_index == sprEWalk9mm && my_id.ammoget == 0)
            {
                my_id.ammo = 13;
                my_id.ammoget = 1;
            }
            if (my_id.sprite_index == sprEWalkScorpion && my_id.ammoget == 0)
            {
                my_id.ammo = 20;
                my_id.ammoget = 1;
            }
        }
        with (objPoliceMelee)
        {
            if (object_index == objPoliceMelee)
            {
                instance_destroy();
            }
            my_id = instance_create(x, y, objPolicePatrol);
            my_id.sprite_index = sprPoliceWalkGun;
            my_id.ammo = 13;
            my_id.ammoget = 1;
        }
        with (objPoliceMeleeStationary)
        {
            if (object_index == objPoliceMeleeStationary)
            {
                instance_destroy();
            }
            my_id = instance_create(x, y, objPoliceStationary);
            my_id.sprite_index = sprPoliceWalkGun;
            my_id.ammo = 13;
            my_id.ammoget = 1;
        }
        with (objEnemyMeleeStationary)
        {
            if (object_index == objEnemyMeleeStationary)
            {
                instance_destroy();
            }
            my_id = instance_create(x, y, objEnemy);
            my_id.sprite_index = choose(sprEWalk9mm, sprEWalkScorpion);
            if (my_id.sprite_index == sprEWalk9mm && my_id.ammoget == 0)
            {
                my_id.ammo = 13;
                my_id.ammoget = 1;
            }
            if (my_id.sprite_index == sprEWalkScorpion && my_id.ammoget == 0)
            {
                my_id.ammo = 20;
                my_id.ammoget = 1;
            }
        }
    }
    else
    {
        with (objWeapon)
        {
            if (object_index == objWeapon)
            {
                image_index = choose(0, 1, 6, 7, 9, 10, 11, 12, 28, 29);
                scrGunIndexGetAmmo(image_index);
            }
        }
    }
}
if (global.maskindex == 17)
{
    if (room == global.level)
    {
        sprite_index = sprPWalkMachete;
    }
    with (objWeapon)
    {
        if (object_index == objWeapon)
        {
            image_index = choose(2, 3, 4, 5, 8, 15, 18, 19);
            ammo = 0;
        }
    }
}
if (room == global.level)
{
    if (global.maskindex == 23)
    {
        sprite_index = sprPWalkDrill;
        ammo = 0;
    }
    if (global.maskindex == 12)
    {
        sprite_index = sprPWalkSilencer;
        ammo = 13;
    }
    if (global.maskindex == 6)
    {
        sprite_index = sprPWalkButterfly;
        ammo = 0;
    }
    if (global.maskindex == 22)
    {
        sprite_index = sprPWalkChainsaw;
        ammo = 100;
        with (objWeapon)
        {
            if (object_index == objWeapon)
            {
                if (jones == 1 && instance_number(objGasCanister) < countgas && const == 0)
                {
                    instance_create(x, y, objGasCanister);
                    instance_destroy();
                }
                else if (const == 0)
                {
                    const = 1;
                }
            }
        }
    }
    if (global.maskindex == 25)
    {
        sprite_index = sprPWalkSilencedUzi;
        ammo = 30;
    }
    if (global.hardmode == 1)
    {
        if (global.maskindex == 5)
        {
            sprite_index = sprPWalkCrowbar;
            ammo = 0;
        }
    }
    if (global.maskindex == 15)
    {
        sprite_index = sprPWalkHuntingRifle;
        ammo = 8;
    }
    if (global.maskindex == 27)
    {
        my_id = instance_create(x, y, objBigIgel);
        my_id.stage = 3;
        my_id.sprite_index = sprBigIgelOpens;
        my_id.image_index = 5;
        sprite_index = sprPWalkSkippy;
        ammo = 10;
    }
}
