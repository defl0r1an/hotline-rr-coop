if (solid == 1)
{
    exit;
}
if (other.object_index == objDogPatrol || other.object_index == objEnemyFat || other.object_index == objInspector || other.object_index == objEFatGunner || (global.maskindex != 4 && (other.object_index == objEDodger || other.object_index == objEDodgerG || other.object_index == objEDodgerPatrol || other.object_index == objEDodgerGPatrol)) || other.object_index == objEFatGiveUp)
{
    if (abs(swingspeed) < 2)
    {
        swinger = 2;
        audio_play_sound(sndDoorOpen, 0, false);
    }
    if (y > other.y && other.x < x)
    {
        swingspeed = -8;
        exit;
    }
    if (y > other.y && other.x > x)
    {
        swingspeed = 8;
        exit;
    }
    if (other.x < (x + lengthdir_x(32, image_angle + 270)))
    {
        swingspeed = -8;
    }
    else
    {
        swingspeed = 8;
    }
    exit;
}
if (abs(swingspeed) > 3.5)
{
    if (swinger == 1 || swinger == 0)
    {
        if (scrNoweapon(other.sprite_index))
        {
            noweapon = 1;
        }
        else
        {
            noweapon = 0;
        }
        with (other.id)
        {
            scrIdleGetEnemy();
        }
        if (global.maskindex == 4)
        {
            my_id = instance_create(other.x, other.y, objDeadBody);
            my_id.sprite_index = choose(sprEBackBlunt, sprEBackBlunt, sprEFrontBlunt);
            my_id.image_index = 4 + round(random(10));
            global.combo += 1;
            global.combotime = 240;
            global.blink = 1;
            audio_play_sound(sndBonesBreak, 0, false);
            audio_play_sound(sndHit, 0, false);
            if (swingspeed > 0)
            {
                other.edir = -15 + random(30);
            }
            else
            {
                other.edir = 165 + random(30);
            }
            with (other.id)
            {
                repeat (4)
                {
                    tempid = instance_create(x, y, objBloodDrop2);
                    tempid.speed = 2 + random(1);
                    tempid.direction = random(360);
                    tempid.image_angle = tempid.direction;
                }
                dir = random(360);
                repeat (6)
                {
                    tempid = instance_create((x - 1) + random(2), (y - 1) + random(2), objBloodHit);
                    tempid.speed = 1 + random(2);
                    tempid.friction = 0.2;
                    tempid.direction = (dir - 45) + random(90);
                    tempid.image_angle = tempid.direction;
                }
                repeat (1 + round(random(1)))
                {
                    instance_create((x - 7) + random(14), (y - 7) + random(14), objBloodSplat2);
                }
                repeat (3)
                {
                    tempid = instance_create(x, y, objBloodDrop2);
                    tempid.speed = 2.5 + random(1);
                    tempid.direction = random(360);
                    tempid.image_angle = tempid.direction;
                }
                repeat (2)
                {
                    tempid = instance_create((x - 2) + random(4), (y - 2) + random(4), objBloodSmoke2);
                    tempid.speed = 2.75 + random(1);
                    tempid.direction = point_direction(x, y, tempid.x, tempid.y);
                    tempid.image_angle = tempid.direction;
                }
                dir = random(360);
                repeat (5)
                {
                    tempid = instance_create((x - 1) + random(2), (y - 1) + random(2), objBloodHit);
                    tempid.speed = 1 + random(2);
                    tempid.friction = 0.2;
                    tempid.direction = (dir - 45) + random(90);
                    tempid.image_angle = tempid.direction;
                }
                repeat (1 + round(random(1)))
                {
                    instance_create((x - 7) + random(14), (y - 7) + random(14), objBloodSplat2);
                }
            }
            if (other.object_index == objEDodgerG || other.object_index == objEDodgerGPatrol)
            {
                my_id.sprite_index = sprEDodgerGunDeadBlunt;
            }
            global.shake = 8;
        }
        else
        {
            my_id = instance_create(other.x, other.y, objKnockedOut);
        }
        ds_list_add(global.bonuslist, "Door Slam");
        if (global.bonustime < 12)
        {
            global.bonustime = 12;
        }
        audio_play_sound(sndDoorHit, 0, false);
        global.shake = 6;
        my_id.type = other.object_index;
        if (scrIsPolice(other.object_index))
        {
            if (global.maskindex == 4)
            {
                my_id.sprite_index = choose(sprPoliceBackBlunt, sprPoliceBackBlunt, sprPoliceFrontBlunt);
                my_id1 = instance_create(x, y, objPoliceHat);
                my_id1.direction = (other.edir - 10) + random(20);
                my_id1.speed = 1 + random(2);
            }
            else
            {
                my_id.sprite_index = sprPoliceGetUp;
            }
        }
        if (swingspeed > 0)
        {
            my_id.direction = -15 + random(30);
        }
        else
        {
            my_id.direction = 165 + random(30);
        }
        my_id.angle = my_id.direction;
        if (global.maskindex == 4)
        {
            my_id.image_angle = my_id.direction;
        }
        my_id.speed = abs(swingspeed) * 0.5;
        if (noweapon == 0)
        {
            global.test = 0;
            with (objEnemy)
            {
                if (alert == 1)
                {
                    global.test += 1;
                }
            }
            my_id = instance_create(x, y - 12, objScore);
            my_id.text = "+" + string(180 + (300 * global.factor)) + "pts";
            global.myscore += (180 + (300 * global.factor));
            global.boldscore += (180 + (300 * global.factor));
            global.combotime += 100;
            global.killx[global.kills] = x;
            global.killy[global.kills] = y;
            global.kills += 1;
            my_id = instance_create(other.x, other.y, objWeaponThrow);
            if (swingspeed > 0)
            {
                my_id.direction = -15 + random(30) + 25;
            }
            else
            {
                my_id.direction = 165 + random(30) + 25;
            }
            my_id.speed = 1 + random(2);
            if (other.object_index == objEDodgerG || other.object_index == objEDodgerGPatrol)
            {
                my_id2 = instance_create(other.x, other.y, objWeaponThrow);
                my_id2.image_index = 28;
                my_id2.direction = my_id.direction + random(30) + 25;
                my_id2.speed = 2 + random(2);
                my_id.image_index = 28;
                my_id.ammo = other.ammo / 2;
                my_id2.ammo = other.ammo / 2;
            }
            else
            {
                my_id.image_index = scrCurrentWeaponExt(other.sprite_index);
                my_id.ammo = other.ammo;
            }
        }
        with (other.id)
        {
            instance_destroy();
        }
    }
    exit;
}
swinger = 2;
if (abs(swingspeed) < 2)
{
    audio_play_sound(sndDoorOpen, 0, false);
}
if (y > other.y && other.x < x)
{
    swingspeed = -8;
    exit;
}
if (y > other.y && other.x > x)
{
    swingspeed = 8;
    exit;
}
if (other.x < (x + lengthdir_x(32, image_angle + 270)))
{
    swingspeed = -8;
}
else
{
    swingspeed = 8;
}
