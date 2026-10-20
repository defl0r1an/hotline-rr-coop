if ((object_index == objKnockedOut && (sprite_index == sprEGetUp || sprite_index == sprPoliceGetUp)) || object_index == objFatKnockedOut || object_index == objEDodger || object_index == objEDodgerG || object_index == objEDodgerPatrol || object_index == objEDodgerGPatrol)
{
    exit;
}
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
if (sprite_index == sprEWalkUnarmed || sprite_index == sprEGiveUp || sprite_index == sprPoliceWalkUnarmed || object_index == objEnemyFat || object_index == objESubwayStatic || object_index == objChief || object_index == objDogPatrol || object_index == objKnockedOut || object_index == objBoss1 || object_index == objPrisoner || object_index == objClubOwner || object_index == objBoss3Kneel || object_index == objBoss2)
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
}
if (noweapon == 1)
{
    factor = 0.5;
}
else
{
    factor = 1;
}
my_id = instance_create(x, y - 12, objScore);
my_id.text = "+" + string((100 + (80 * factor)) * global.factor) + "pts";
global.myscore += ((100 + (80 * factor)) * global.factor);
global.killscore += 100;
global.boldscore += (80 * factor);
global.combo += 1;
global.combotime = 240;
global.killx[global.kills] = x;
global.killy[global.kills] = y;
global.kills += 1;
global.blink = 1;
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
    case objBoss3Kneel:
        sprite = 2618;
        animation = 0;
        running = 1;
        break;
    case objSwat:
        sprite = 2445;
        animation = 0;
        running = 1;
        break;
    case objBoss2:
        sprite = 2616;
        animation = 0;
        running = 1;
        break;
}
if (object_index == objESubwayStatic)
{
    if (sprite_index == sprESubwayBriefcase || sprite_index == sprESubwayWalkBriefcase)
    {
        my_id = instance_create(x + lengthdir_x(6, direction - 90), y + lengthdir_y(6, direction - 90), objBriefcase);
        my_id.speed = 1 + random(1);
        my_id.friction = 0.1;
    }
    my_id = instance_create(x + lengthdir_x(6, direction - 180), y + lengthdir_y(6, direction - 180), objPoliceHat);
    my_id.direction = direction - 180;
    my_id.speed = 1;
    my_id.sprite_index = sprInspectorHat;
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
}
if (object_index == objBoss2)
{
    my_id = instance_create(x, y, objMCHelmet);
    my_id.direction = random(360);
    my_id.speed = 1.5 + random(1);
    my_id3 = instance_create(x, y, objCleaverDrop);
    my_id3.direction = (image_angle - 70) + random(40);
    my_id3.speed = 1 + random(0.5);
    with (objDoorH)
    {
        solid = 0;
    }
    with (objDoorH2)
    {
        solid = 0;
    }
    global.done = 1;
    instance_create(x, y, objLevelComplete);
}
if (object_index == objClubOwner)
{
    if (global.done == 0)
    {
        instance_create(x, y, objLevelComplete);
    }
    global.done = 1;
}
if (object_index == objBoss3)
{
    if (global.done == 0)
    {
        instance_create(x, y, objLevelComplete);
    }
    global.done = 1;
}
if (object_index == objBoss1)
{
    with (objGirlfriend)
    {
        active = 1;
    }
}
if (object_index == objPrisoner)
{
    with (objFiles)
    {
        on = 1;
    }
}
if (object_get_parent(object_index) == 285)
{
    sprite = 2310;
    animation = 1;
    spriteanimation = choose(2311, 2434, 2298);
}
if (animation && round(random(7)) <= 2)
{
    if ((running == 1 && round(random(5)) == 1) || object_index == objKnockedOut)
    {
        my_id = instance_create(x, y, objBurningGuy);
        my_id.direction = direction;
        my_id.mysprite = -1;
        if (choose(0, 1) == 1)
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
