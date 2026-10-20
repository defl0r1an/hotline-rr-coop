if (image_index != 9 && image_index != 10 && image_index != 11)
{
    exit;
}
global.my_id = id;
with (other.id)
{
    if (object_index == objDogPatrol || object_index == objEDodger || object_index == objEDodgerG || object_index == objEDodgerPatrol || object_index == objEDodgerGPatrol)
    {
        exit;
    }
    audio_play_sound(sndHit, 0, false);
    edir = other.direction;
    global.combotime = 240;
    if (sprite_index == sprEWalkUnarmed || sprite_index == sprEGiveUp || sprite_index == sprPoliceWalkUnarmed || object_index == objEnemyFat || object_index == objDogPatrol || object_index == objChief)
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
        my_id.direction = random(360);
        my_id.speed = 2 + random(1);
        my_id.image_index = scrCurrentWeaponExt(sprite_index);
        my_id.ammo = ammo;
    }
    scrIdleGetEnemy();
    repeat (12)
    {
        my_id = instance_create(x, y, objBloodSmoke);
        my_id.image_xscale = 1.2 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
        my_id.image_angle = random(360);
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.15;
    }
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(100 + (160 * global.factor)) + "pts";
    global.myscore += (100 + (160 * global.factor));
    global.killscore += 100;
    global.boldscore += 120;
    global.combo += 1;
    global.combotime = 240;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
    global.gunkill += 1;
    if (global.bonustime < (12 + (global.factor * 4)))
    {
        global.bonustime = 12 + (global.factor * 4);
    }
    if (global.factor == 2)
    {
        ds_list_add(global.bonuslist, "Exposure");
    }
    if (global.factor == 3)
    {
        ds_list_add(global.bonuslist, "Double Exposure");
    }
    if (global.factor == 4)
    {
        ds_list_add(global.bonuslist, "Triple Exposure");
    }
    if (global.factor > 4)
    {
        ds_list_add(global.bonuslist, "Severe Exposure");
    }
    if (global.bonustime < 12)
    {
        global.bonustime = 12;
    }
    global.combo += 1;
    if (object_index == objEnemyFat)
    {
        my_id = instance_create(x + lengthdir_x(10, global.my_id.direction), y + lengthdir_y(10, global.my_id.direction), objDeadBody);
        my_id.direction = global.my_id.direction;
        my_id.speed = 3 + random(0.5);
        my_id.image_angle = my_id.direction;
        my_id.sprite_index = choose(sprEFatDeadSledgeHammer, sprEFatDead);
        my_id.image_index = 5;
        global.my_id.bounce = 1;
        instance_destroy();
        exit;
    }
    if (object_index == objEFatGunner)
    {
        my_id = instance_create(x + lengthdir_x(10, global.my_id.direction), y + lengthdir_y(10, global.my_id.direction), objDeadBody);
        my_id.direction = global.my_id.direction;
        my_id.speed = 3 + random(0.5);
        my_id.image_angle = my_id.direction;
        my_id.sprite_index = choose(sprEFatGunDeadSledgeHammer, sprEFatGunDieTiger);
        my_id.image_index = 5;
        global.my_id.bounce = 1;
        instance_destroy();
        exit;
    }
    if (object_index == objChief)
    {
        my_id = instance_create(x + lengthdir_x(8, direction - 90), y + lengthdir_y(8, direction - 90), objWeaponThrow);
        my_id.direction = direction - 80 - random(20);
        my_id.speed = random(3);
        my_id.image_index = 12;
        my_id.ammo = ammo;
        my_id = instance_create(x + lengthdir_x(8, direction + 90), y + lengthdir_y(8, direction + 90), objWeaponThrow);
        my_id.direction = direction + 80 + random(20);
        my_id.speed = random(3);
        my_id.image_index = 12;
        my_id.ammo = ammo;
        my_id = instance_create(x + lengthdir_x(10, global.my_id.direction), y + lengthdir_y(10, global.my_id.direction), objDeadBody);
        my_id.direction = global.my_id.direction;
        my_id.speed = 3 + random(0.5);
        my_id.image_angle = my_id.direction;
        my_id.sprite_index = sprEChiefDeadSledgeHammer;
        my_id.image_index = 5;
        global.my_id.bounce = 1;
        instance_destroy();
        exit;
    }
    if (object_index == objInspector)
    {
        my_id = instance_create(x + lengthdir_x(10, global.my_id.direction), y + lengthdir_y(10, global.my_id.direction), objDeadBody);
        my_id.direction = global.my_id.direction;
        my_id.speed = 2 + random(1);
        my_id.image_angle = my_id.direction;
        my_id.sprite_index = choose(sprEInspectorDeadSledgeHammer, sprEInspectorDieTiger);
        my_id.image_index = 5;
        my_id = instance_create(x, y, objPoliceHat);
        my_id.direction = global.my_id.direction;
        my_id.speed = 3 + random(0.5);
        my_id.sprite_index = sprInspectorHat;
        global.my_id.bounce = 1;
        instance_destroy();
        exit;
    }
    if (object_index == objPolice || object_index == objPolicePatrol || object_index == objPoliceStationary || object_index == objPoliceMelee || object_index == objPoliceMeleeStationary)
    {
        my_id = instance_create(x, y, objDeadBody);
        my_id.direction = global.my_id.direction;
        my_id.speed = 2 + random(1);
        my_id.image_angle = my_id.direction;
        my_id.sprite_index = choose(sprPoliceBackShotgun, sprPoliceFrontShotgun, sprPoliceBackMachinegun);
        my_id.image_index = 3;
        my_id = instance_create(x, y, objPoliceHat);
        my_id.direction = global.my_id.direction;
        my_id.speed = 4 + random(1);
        global.my_id.bounce = 1;
        instance_destroy();
        exit;
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.direction = global.my_id.direction;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id.sprite_index = choose(sprEBackShotgun, sprEFrontShotgun, sprEBackMachinegun);
    my_id.image_index = 3;
    global.my_id.bounce = 1;
    instance_destroy();
}
