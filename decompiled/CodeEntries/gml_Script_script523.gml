if (argument1 == 0)
{
    edir = point_direction(x, y, argument0.x, argument0.y) - 180;
}
else
{
    edir = point_direction(x, y, argument2, argument3) - 180;
}
global.combotime = 240;
global.blink = 1;
my_id = instance_create(x, y, objBombGround);
my_id.direction = random(360);
my_id.depth = 6;
my_id.surf = global.surf2;
if (scrNoweapon(sprite_index) || object_index == objBoss1 || object_index == objEBombTinker || object_index == objMafiaKill)
{
    noweapon = 1;
}
else
{
    noweapon = 0;
}
if (noweapon == 0)
{
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
    }
    else
    {
        my_id = instance_create(x, y, objWeaponThrow);
        my_id.direction = random(360);
        my_id.speed = 2 + random(1);
        my_id.image_index = scrCurrentWeaponExt(sprite_index);
        my_id.ammo = ammo;
        if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
        {
            my_id2 = instance_create(x, y, objWeaponThrow);
            my_id2.image_index = 28;
            my_id2.direction = (edir - 70) + random(40);
            my_id2.speed = 2 + random(2);
            my_id.image_index = 28;
            my_id.ammo = round(ammo / 2);
            my_id2.ammo = round(ammo / 2);
        }
    }
}
scrIdleGetEnemy();
repeat (8)
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
if (object_index == objKnockedOut && (sprite_index == sprPoliceGetUpLean || sprite_index == sprEGetUpLean))
{
    global.my_id = id;
    global.myx = x + lengthdir_x(8, image_angle);
    global.myy = y + lengthdir_y(8, image_angle);
    my_id = instance_create(global.myx - 12, global.myy, objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    if (sprite_index == sprPoliceGetUpLean)
    {
        my_id.sprite_index = sprEPoliceDeadLeanExplosion;
        my_id1 = instance_create(x, y, objPoliceHat);
        my_id1.direction = image_angle + random_range(-50, 50);
        my_id1.speed = 1.5 + random(1.5);
    }
    else
    {
        my_id.sprite_index = sprEMafiaDeadLeanExplosion;
    }
    my_id.image_index = choose(0, 1);
    my_id.image_angle = angle;
    scrGoreShotgun(x, y, edir - 180, 0, 0, 0, 0, 0, 1);
    part = instance_create(x, y, objBodyPartShotgun);
    part.sprite_index = sprEMafiaDeadExplosionPieces;
    if (sprite_index == sprPoliceGetUpLean)
    {
        part.sprite_index = sprEPoliceDeadExplosionPieces;
    }
    part.image_angle = direction + random_range(-30, 30);
    part.direction = part.image_angle;
    part.speed = 3.5 + random(1.5);
    part.image_index = choose(2, 3);
    part.sled = 0;
    part.depth = 2;
    repeat (2)
    {
        part = instance_create(x, y, objBodyPartShotgun);
        part.sprite_index = sprEMafiaDeadExplosionPieces;
        if (sprite_index == sprPoliceGetUpLean)
        {
            part.sprite_index = sprEPoliceDeadExplosionPieces;
        }
        part.image_angle = direction + random_range(-30, 30);
        part.direction = part.image_angle;
        part.speed = 2.5 + random(1.5);
        part.image_index = choose(4, 5);
        part.depth = 2;
    }
    instance_destroy();
    scrMoveSolidOff();
    exit;
}
if (object_index == objDogPatrol)
{
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprDogDeadExplosion;
    my_id.image_index = round(random(2));
    my_id.image_angle = edir + random_range(5, -5);
    my_id.direction = my_id.image_angle;
    my_id.speed = 4 + random(1);
    if (my_id.image_index >= 1)
    {
        my_id.sled = 2;
    }
    scrGoreShotgun(x, y, edir - 180, 0, 0, 0, 0, 0, 0);
    instance_destroy();
    exit;
}
if (object_index == objEnemyFat || object_index == objEFatGunner || object_index == objInspector || object_index == objChief || object_index == objBoss1)
{
    my_id = instance_create(x, y, objDeadBody);
    my_id.speed = 4 + random(1);
    my_id.image_angle = edir + random_range(5, -5);
    my_id.direction = my_id.image_angle;
    my_id.sprite_index = sprEFatDeadExplosion;
    if (object_index == objInspector)
    {
        my_id.sprite_index = sprEInspectorDeadExplosion;
        part = instance_create(x + lengthdir_x(6, edir), y + lengthdir_y(6, edir), objPoliceHat);
        part.direction = edir + random_range(5, -5);
        part.speed = 3;
        part.sprite_index = sprInspectorHat;
    }
    if (object_index == objEFatGunner)
    {
        my_id.sprite_index = sprEFatGunDeadExplosion;
    }
    if (object_index == objChief)
    {
        my_id.sprite_index = sprEChiefDeadExplosion;
    }
    if (object_index == objBoss1)
    {
        my_id.sprite_index = sprEBoss1DeadExplosion;
    }
    my_id.image_index = choose(0, 1);
    my_id.sled = 2;
    if (my_id.image_index == 1)
    {
        part = instance_create(x + lengthdir_x(19, my_id.image_angle - -21), y + lengthdir_y(19, my_id.image_angle - -21), objBodyPartShotgun);
        part.image_angle = edir + 20 + random_range(5, -5);
        part.direction = part.image_angle;
        part.speed = 3 + random(1);
        part.sprite_index = sprEFatDeadExplosion;
        if (object_index == objInspector)
        {
            part.sprite_index = sprEInspectorDeadExplosion;
        }
        if (object_index == objEFatGunner)
        {
            part.sprite_index = sprEFatGunDeadExplosion;
        }
        if (object_index == objChief)
        {
            part.sprite_index = sprEChiefDeadExplosion;
        }
        if (object_index == objBoss1)
        {
            part.sprite_index = sprEBoss1DeadExplosion;
        }
        part.image_index = 2;
        part.sled = 0;
    }
    scrGoreShotgun(x, y, edir - 180, 0, 0, 0, 0, 0, 1);
    i = 0;
    repeat (3)
    {
        tempid = instance_create(x, y, objGuts2);
        tempid.speed = 2 + random(0.85);
        tempid.direction = direction + i + random_range(20, -20);
        tempid.image_angle = tempid.direction;
        i += 30;
    }
    instance_destroy();
    exit;
}
my_id = instance_create(x, y, objDeadBody);
my_id.image_angle = edir + random_range(5, -5);
my_id.direction = my_id.image_angle;
my_id.speed = 4 + random(1);
my_id.sprite_index = sprEMafiaDeadExplosion;
if (object_index == objPolice || object_index == objPolicePatrol || object_index == objPoliceStationary || object_index == objPoliceMelee || object_index == objPoliceMeleeStationary || sprite_index == sprPoliceGetUp)
{
    my_id.sprite_index = sprEPoliceDeadExplosion;
    my_id1 = instance_create(x, y, objPoliceHat);
    my_id1.direction = (edir - 10) + random(20);
    my_id1.speed = 1 + random(2);
}
if (object_index == objEDodger || object_index == objEDodgerPatrol)
{
    my_id.sprite_index = sprEDodgerDeadExplosion;
    glasses = instance_create(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction), objPoliceHat);
    glasses.sprite_index = sprDodgerGlasses;
    glasses.speed = 2 + random(1.5);
    glasses.direction = direction + random_range(-5, 5);
}
if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
{
    my_id.sprite_index = sprEDodgerGunDeadExplosion;
}
my_id.image_index = round(random_range(0, 4));
if (my_id.sprite_index == sprEMafiaDeadExplosion && round(random(18)) == 2)
{
    my_id.sprite_index = sprExplodedBodyFly;
    my_id.image_index = 0;
    my_id.sled = 2;
    scrGoreShotgun(x, y, edir - 180, 0, 0, 0, 0, 0, 0);
    instance_destroy();
    exit;
}
if (my_id.image_index == 3 || my_id.image_index == 4)
{
    part = instance_create(x + lengthdir_x(20, my_id.image_angle), y + lengthdir_y(20, my_id.image_angle), objDeadBody);
    part.sprite_index = sprEMafiaDeadExplosionPieces;
    if (object_index == objPolice || object_index == objPolicePatrol || object_index == objPoliceStationary || object_index == objPoliceMelee || object_index == objPoliceMeleeStationary || sprite_index == sprPoliceGetUp)
    {
        part.sprite_index = sprEPoliceDeadExplosionPieces;
    }
    if (object_index == objEDodger || object_index == objEDodgerPatrol)
    {
        part.sprite_index = sprEDodgerDeadExplosionPieces;
    }
    if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
    {
        part.sprite_index = sprEDodgerGunDeadExplosionPieces;
    }
    part.image_angle = edir + random_range(5, -5);
    part.direction = part.image_angle;
    part.speed = 3.5 + random(1);
    part.image_index = 1;
    part.image_yscale = 1;
    part.sled = 2;
    part.bled = 1;
    if (my_id.image_index == 4)
    {
        part.image_index = 0;
        part1 = instance_create(x + lengthdir_x(19, my_id.image_angle - -21), y + lengthdir_y(19, my_id.image_angle - -21), objBodyPartShotgun);
        part1.sprite_index = sprEMafiaDeadExplosionPieces;
        if (object_index == objPolice || object_index == objPolicePatrol || object_index == objPoliceStationary || object_index == objPoliceMelee || object_index == objPoliceMeleeStationary || sprite_index == sprPoliceGetUp)
        {
            part1.sprite_index = sprEPoliceDeadExplosionPieces;
        }
        if (object_index == objEDodger || object_index == objEDodgerPatrol)
        {
            part1.sprite_index = sprEDodgerDeadExplosionPieces;
        }
        if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
        {
            part1.sprite_index = sprEDodgerGunDeadExplosionPieces;
        }
        part1.image_angle = edir + 20 + random_range(5, -5);
        part1.direction = part1.image_angle;
        part1.speed = 3 + random(1);
        part1.image_index = choose(2, 3);
        part1.sled = 0;
    }
    my_id.speed = 2 + random(1);
}
if (my_id.image_index == 0 || my_id.image_index == 1)
{
    my_id.sled = 2;
    scrGoreShotgun(x, y, edir - 180, 0, 0, 0, 0, 0, 1);
    if (my_id.image_index == 1)
    {
        part = instance_create(x + lengthdir_x(-11, my_id.image_angle - 29), y + lengthdir_y(-11, my_id.image_angle - 29), objBodyPartShotgun);
        part.sprite_index = sprEMafiaDeadExplosionPieces;
        if (object_index == objPolice || object_index == objPolicePatrol || object_index == objPoliceStationary || object_index == objPoliceMelee || object_index == objPoliceMeleeStationary || sprite_index == sprPoliceGetUp)
        {
            part.sprite_index = sprEPoliceDeadExplosionPieces;
        }
        if (object_index == objEDodger || object_index == objEDodgerPatrol)
        {
            part.sprite_index = sprEDodgerDeadExplosionPieces;
        }
        if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
        {
            part.sprite_index = sprEDodgerGunDeadExplosionPieces;
        }
        part.image_angle = (edir - 180) + random_range(8, -8);
        part.direction = part.image_angle;
        part.speed = 2.5 + random(1);
        part.image_index = choose(4, 5);
        part.sled = 0;
    }
}
if (my_id.image_index == 2)
{
    part = instance_create(x + lengthdir_x(19, my_id.image_angle - -21), y + lengthdir_y(19, my_id.image_angle - -21), objBodyPartShotgun);
    part.sprite_index = sprEMafiaDeadExplosionPieces;
    if (object_index == objPolice || object_index == objPolicePatrol || object_index == objPoliceStationary || object_index == objPoliceMelee || object_index == objPoliceMeleeStationary || sprite_index == sprPoliceGetUp)
    {
        part.sprite_index = sprEPoliceDeadExplosionPieces;
    }
    if (object_index == objEDodger || object_index == objEDodgerPatrol)
    {
        part.sprite_index = sprEDodgerDeadExplosionPieces;
    }
    if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
    {
        part.sprite_index = sprEDodgerGunDeadExplosionPieces;
    }
    part.image_angle = edir + 8 + random_range(5, -5);
    part.direction = part.image_angle;
    part.speed = 3 + random(1);
    part.image_index = choose(2, 3);
    part.sled = 0;
    part = instance_create(x + lengthdir_x(-11, my_id.image_angle - 29), y + lengthdir_y(-11, my_id.image_angle - 29), objBodyPartShotgun);
    part.sprite_index = sprEMafiaDeadExplosionPieces;
    if (object_index == objPolice || object_index == objPolicePatrol || object_index == objPoliceStationary || object_index == objPoliceMelee || object_index == objPoliceMeleeStationary || sprite_index == sprPoliceGetUp)
    {
        part.sprite_index = sprEPoliceDeadExplosionPieces;
    }
    if (object_index == objEDodger || object_index == objEDodgerPatrol)
    {
        part.sprite_index = sprEDodgerDeadExplosionPieces;
    }
    if (object_index == objEDodgerG || object_index == objEDodgerGPatrol)
    {
        part.sprite_index = sprEDodgerGunDeadExplosionPieces;
    }
    part.image_angle = edir + random_range(8, -8);
    part.direction = part.image_angle;
    part.speed = 2 + random(1);
    part.image_index = choose(4, 5);
    scrGoreShotgun(x, y, edir - 180, 0, 0, 0, 0, 0, 0);
}
instance_destroy();
exit;
