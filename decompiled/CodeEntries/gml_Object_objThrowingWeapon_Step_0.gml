if (image_index == 8)
{
    my_id = instance_create(x, y, objThrowingWeaponSkippy);
    my_id.image_index = image_index;
    my_id.speed = speed;
    my_id.direction = direction;
    instance_destroy();
}
if (image_index != 9 && image_index != 10 && image_index != 11)
{
    angle += (speed * 5 * diradd);
}
if (speed <= 0)
{
    my_id = instance_create(x, y, objWeapon);
    if (decadenced == 1)
    {
        my_id.decadenced = 0;
    }
    my_id.image_angle = angle;
    my_id.image_index = 30 + image_index;
    my_id.image_yscale = image_yscale * left;
    if (image_index == 5)
    {
        my_id.image_xscale = -1;
    }
    my_id.ammo = ammo;
    instance_destroy();
}
if (bounce == 1 && (image_index == 9 || image_index == 10 || image_index == 11))
{
    instance_create(x, y, objBloodSplat2);
    i = 0;
    repeat (6)
    {
        if (choose(0, 1) == 1)
        {
            my_id = instance_create(x + random_range(0.5, -0.5), y + random_range(0.5, -0.5), objBloodSquirt);
            my_id.image_angle = direction + i + random_range(35, -35);
            my_id.decadenced = 1;
        }
        i += 60;
    }
    repeat (6)
    {
        my_id = instance_create(x + random_range(0.5, -0.5), y + random_range(0.5, -0.5), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    repeat (2)
    {
        my_id = instance_create(x + random_range(0.5, -0.5), y + random_range(0.5, -0.5), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, image_angle), y + lengthdir_y(8, image_angle), my_id.x, my_id.y);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1 + random(5);
    }
    repeat (1)
    {
        my_id = instance_create(x + random_range(0.5, -0.5), y + random_range(0.5, -0.5), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, image_angle), y + lengthdir_y(8, image_angle), my_id.x, my_id.y);
        my_id.sprite_index = sprBloodSplatSmall;
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(4);
    }
    i = 0;
    repeat (6)
    {
        my_id = instance_create(x + lengthdir_x(-1.5, angle), y + lengthdir_y(-1.5, angle), objBrainChunk2);
        my_id.direction = direction + i + random_range(35, -35);
        my_id.speed = 2 + random(1);
        my_id.image_angle = my_id.direction;
        i += 60;
    }
    i = 0;
    repeat (4)
    {
        my_id = instance_create(x + lengthdir_x(-1.5, angle), y + lengthdir_y(-1.5, angle), objSkinPiece2);
        my_id.direction = direction + i + random_range(35, -35);
        my_id.speed = 2 + random(1);
        my_id.image_angle = my_id.direction;
        i += 90;
    }
    i = 0;
    repeat (2)
    {
        my_id = instance_create(x + lengthdir_x(-1.5, angle), y + lengthdir_y(-1.5, angle), objSkinPiece2);
        my_id.sprite_index = sprHeadPieces;
        my_id.image_index = random(6);
        my_id.speed = 2.4 + random(1.2);
        my_id.direction = direction + i + random_range(-35, 35);
        my_id.image_angle = my_id.direction;
        my_id.image_index = random(4);
        i += 160;
    }
    if (image_index == 11)
    {
        my_id = instance_create(x + lengthdir_x(-1.5, angle), y + lengthdir_y(-1.5, angle), objPoliceHat);
        my_id.direction = direction + i + random_range(35, -35);
        my_id.sprite_index = sprDodgerGlasses;
        my_id.speed = 2 + random(1);
        my_id.image_angle = my_id.direction;
    }
    audio_play_sound(choose(sndBulletHit1, sndBulletHit2, sndBulletHit3), 0, false);
    audio_play_sound(sndNeck, 0, false);
    instance_destroy();
    exit;
}
if (speed > 2.5 && image_index != 9 && image_index != 10 && image_index != 11)
{
    mask_index = sprite_index;
    global.my_id = id;
    with (objEnemy)
    {
        if (scrCantGetHit(object_index))
        {
            nothing = 1;
        }
        else if (place_meeting(x, y, global.my_id))
        {
            if (object_index == objEDodger || object_index == objEDodgerG || object_index == objEDodgerPatrol || object_index == objEDodgerGPatrol)
            {
                exit;
            }
            if (global.my_id.image_index == 0 || global.my_id.image_index == 4 || global.my_id.image_index == 8)
            {
                scrKnifeThrowHits();
                ds_list_add(global.bonuslist, "Projectile Kill");
                if (global.bonustime < 20)
                {
                    global.bonustime = 20;
                }
                exit;
            }
            if (global.my_id.image_index == 1 || global.my_id.image_index == 2)
            {
                with (global.my_id)
                {
                    direction = direction + 160 + random(40);
                    speed *= 0.3;
                }
                audio_play_sound(sndDoorHit, 0, false);
                my_id = instance_create(x, y, objKnockedOut);
                global.shake = 5;
                my_id.type = object_index;
                if (scrIsPolice(object_index))
                {
                    my_id.sprite_index = sprPoliceGetUp;
                }
                my_id.direction = ((global.my_id.direction - 10) + random(20)) - 180;
                my_id.angle = my_id.direction;
                with (my_id)
                {
                    move_outside_solid(angle - 180, 16);
                }
                my_id.speed = global.my_id.speed * 0.25;
                global.my_id.speed *= -0.8;
                if (scrNoweapon(sprite_index))
                {
                    noweapon = 1;
                }
                else
                {
                    noweapon = 0;
                }
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
                    my_id.text = "+" + string(500 * global.factor) + "pts";
                    global.myscore += (500 * global.factor);
                    global.boldscore += (500 * global.factor);
                    global.combotime += 100;
                    global.killx[global.kills] = x;
                    global.killy[global.kills] = y;
                    global.kills += 1;
                    my_id = instance_create(x, y, objWeaponThrow);
                    my_id.direction = (direction - 70) + random(40);
                    my_id.image_index = scrCurrentWeaponExt(sprite_index);
                    my_id.speed = 2 + random(2);
                    my_id.ammo = ammo;
                }
                instance_destroy();
                exit;
            }
            if (global.my_id.image_index == 3 || global.my_id.image_index == 5)
            {
                audio_play_sound(sndDoorHit, 0, false);
                audio_play_sound(sndHit, 0, false);
                global.my_id.hits += 1;
                scrEnemyDieMelee(global.my_id.hits);
                global.shake = 6;
                if (global.my_id.image_index == 3 && global.my_id.bounce == 1)
                {
                    scrAchievementSet("Playing Pool");
                }
                if (global.bonustime < 20)
                {
                    global.bonustime = 10;
                }
                if (global.my_id.hits >= 2)
                {
                    if (global.my_id.hits == 2)
                    {
                        ds_list_add(global.bonuslist, "Double Hit");
                        scrAchievementSet("Two Birds With One Stone");
                    }
                    if (global.my_id.hits == 3)
                    {
                        ds_list_add(global.bonuslist, "Triple Hit");
                        scrAchievementSet("Plain Luck");
                    }
                    if (global.my_id.hits >= 4)
                    {
                        ds_list_add(global.bonuslist, "Multi Hit");
                        scrAchievementSet("Plain Luck");
                    }
                }
                else
                {
                    ds_list_add(global.bonuslist, "Projectile Kill");
                }
                exit;
            }
            if (global.my_id.image_index == 6)
            {
                if (global.maskindex == 24)
                {
                    scrKnifeThrowHits();
                    ds_list_add(global.bonuslist, "Projectile Kill");
                    if (global.bonustime < 20)
                    {
                        global.bonustime = 20;
                    }
                    exit;
                }
                if (sprite_index == sprEWalkUnarmed)
                {
                    nothing = 1;
                }
                else
                {
                    my_id = instance_create(global.my_id.x, global.my_id.y, objBloodSmoke);
                    my_id.image_angle = global.my_id.image_angle - 180;
                    global.shake = 1;
                    ds_list_add(global.bonuslist, "Big Balls");
                    if (global.bonustime < 32)
                    {
                        global.bonustime = 32;
                    }
                }
            }
        }
    }
}
mask_index = sprWeaponMask;
