with (other.id)
{
    if (object_index == objClubOwner)
    {
        if (state != 5)
        {
            exit;
        }
    }
    sprite = 2302;
    spriteanimation = choose(2303, 2304, 2305);
    animation = 1;
    running = 1;
    global.my_id = id;
    image_xscale = 1;
    image_yscale = 1;
    test = 0;
    if (sprite_index == sprEWalkUnarmed || sprite_index == sprEGiveUp || sprite_index == sprPoliceWalkUnarmed || object_index == objEnemyFat || object_index == objESubwayStatic || object_index == objChief || object_index == objDogPatrol || object_index == objKnockedOut || object_index == objBoss1 || object_index == objPrisoner || object_index == objClubOwner)
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
        if (instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
        my_id.image_index = scrCurrentWeaponExt(sprite_index);
        my_id.direction = (other.direction - 70) + random(40);
        my_id.speed = 1.5 + random(1);
        my_id.ammo = ammo;
        if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
        {
            my_id2 = instance_create(x, y, objWeaponThrow);
            my_id2.image_index = 28;
            my_id2.direction = (other.direction - 70) + random(40);
            my_id2.speed = 2 + random(2);
            my_id.image_index = 28;
            my_id.ammo = round(ammo / 2);
            my_id2.ammo = round(ammo / 2);
        }
    }
    audio_play_sound(sndCatchFire, 0, false);
    repeat (20 + round(random(10)))
    {
        my_id = instance_create(x, y, objFlameParticle);
        my_id.direction = random(360);
        my_id.speed = 2 + random(3);
        my_id.friction = 0.15;
    }
    repeat (10 + round(random(5)))
    {
        my_id = instance_create(x + lengthdir_x(10, direction), y, objFlameSmoke);
        my_id.direction = random(360);
        my_id.image_angle = random(360);
        my_id.speed = 0.5 + random(1);
    }
    switch (object_index)
    {
        case objPolice:
            sprite = 2310;
            animation = 1;
            spriteanimation = choose(2311, 2434, 2298);
            running = 1;
            break;
        case objEnemyFat:
            sprite = 2307;
            animation = 0;
            running = 0;
            break;
        case objEFatGunner:
            sprite = 2417;
            animation = 0;
            running = 0;
            break;
        case objChief:
            sprite = 2415;
            animation = 0;
            running = 0;
            break;
        case objInspector:
            sprite = 2309;
            animation = 0;
            running = 0;
            break;
        case objDogPatrol:
            sprite = 2300;
            animation = 0;
            running = 0;
            break;
        case objESubwayStatic:
            sprite = 2419;
            animation = 0;
            running = 1;
            break;
        case objWaiter:
        case objWaiterStationary:
            sprite = 2421;
            animation = 0;
            running = 1;
            break;
        case objKnockedOut:
            sprite = 2429;
            animation = 1;
            running = 1;
            break;
        case objBoss1:
            sprite = 2413;
            animation = 0;
            running = 0;
            break;
        case objPrisoner:
            sprite = 2411;
            animation = 0;
            running = 1;
            break;
        case objClubOwner:
            sprite = 2443;
            animation = 0;
            running = 0;
            break;
        case objSwat:
            sprite = 2445;
            animation = 0;
            running = 1;
        case objSwat:
            sprite = 2445;
            animation = 0;
            running = 1;
        case objEDodgerG:
        case objEDodgerGPatrol:
            sprite = -1;
            animation = 0;
            running = 1;
            break;
        case objEDodger:
        case objEDodgerPatrol:
            sprite = -1;
            animation = 0;
            running = 1;
            break;
    }
    if (sprite == -1 || (animation && round(random(7)) <= 2))
    {
        if (sprite == -1 || (running == 1 && round(random(5)) == 1) || object_index == objKnockedOut)
        {
            my_id = instance_create(x, y, objBurningGuy);
            my_id.direction = direction;
            my_id.mysprite = -1;
            if (sprite != -1 && choose(0, 1) == 1)
            {
                if (sprite == 2310 || sprite_index == sprPoliceGetUpLean)
                {
                    my_id.mysprite = 2297;
                    my_id.mylegs = 1368;
                }
                if (sprite == 2302 || sprite_index == sprEGetUpLean)
                {
                    my_id.mysprite = 2433;
                    my_id.mylegs = 931;
                }
                my_id.sprite_index = my_id.mysprite;
            }
            instance_destroy();
            exit;
        }
        my_id = instance_create(x, y, objDeadBody);
        my_id.image_angle = direction - 180;
        my_id.sprite_index = spriteanimation;
        my_id.image_speed = 0.15;
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
    }
    else
    {
        my_id = instance_create(x, y, objEDeadBurn);
        my_id.image_angle = direction - 180;
        if (object_index == objKnockedOut)
        {
            my_id.image_angle = angle;
            if (sprite_index == sprPoliceGetUpLean)
            {
                sprite = 2432;
            }
        }
        my_id.sprite_index = sprite;
    }
    instance_destroy();
}
