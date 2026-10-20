if (image_index > 4)
{
    exit;
}
if (global.maskindex == 15)
{
    energie = 0;
}
if (object_get_parent(object_index) == 332)
{
    energie = 0;
}
global.my_id = id;
if (other.passed == 1)
{
    if (other.swat == 0)
    {
        ds_list_add(global.bonuslist, "Sneaky Shot");
        if (global.bonustime < 12)
        {
            global.bonustime = 12;
        }
    }
    if (object_get_parent(object_index) == 332)
    {
        instance_destroy();
        my_id = instance_create(x, y, objEnemy);
        my_id.alert = 2;
        exit;
    }
    global.my_x = other.dirx;
    global.my_y = other.diry;
    with (objEnemy)
    {
        if (scrCollisionLineExt(x, y, global.my_id.x, global.my_id.y, 4, 309, 99, 131) == 0)
        {
            alert = 2;
            if (sprite_index == sprEWalkUnarmed)
            {
                alert = 0;
            }
            if (sprite_index == sprEWalkShotgun || sprite_index == sprEWalkSilencer || sprite_index == sprEWalkDoubleBarrel || sprite_index == sprEWalkSilencer)
            {
                checkreload = 50;
            }
            else
            {
                checkreload = 5;
            }
            reload = 10;
            chasex = global.my_x;
            chasey = global.my_y;
        }
    }
}
image_xscale = 1.5;
image_yscale = 1.5;
bullets = 0;
energie -= (1 + other.caliber + other.bullet);
with (objBullet)
{
    if (place_meeting(x, y, global.my_id))
    {
        if (bullet == 2)
        {
            global.BuffSkippy += 0.05;
        }
        my_id = instance_create(x, y, objBloodSmoke);
        my_id.direction = (direction - 170) + random(10);
        my_id.speed = 1;
        my_id.image_angle = my_id.direction;
        my_id.image_xscale = 0.8 + random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
        if (caliber == 0)
        {
            instance_destroy();
        }
        global.my_id.bullets += 1;
    }
}
image_xscale = 1;
image_yscale = 1;
edir = other.direction;
if (point_distance(other.x, other.y, other.startx, other.starty) > 150)
{
    if (other.swat == 0)
    {
        ds_list_add(global.bonuslist, "Sharp Shooter");
        if (global.bonustime < 12)
        {
            global.bonustime = 12;
        }
    }
}
test = 0;
repeat (bullets)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.sprite_index = sprBloodSplatSmall;
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(4);
    if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
    {
        my_id.decadenced = 1;
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
    if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
    {
        my_id.decadenced = 1;
    }
}
if (bullets > 1 || round(random(1)) || energie < 0)
{
    if (scrNoweapon(sprite_index) == 1)
    {
        noweapon = 1;
    }
    else
    {
        noweapon = 0;
    }
    scrIdleGetEnemy();
    if (other.swat == 0)
    {
        global.punchonly = 0;
    }
    if (noweapon == 1)
    {
        factor = 0.5;
    }
    else
    {
        factor = 1;
    }
    if (other.swat == 0)
    {
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
    }
    global.bigballs = 0;
    if (object_index == objEnemyPhone)
    {
        my_id = instance_create(x, y, objCellPhone);
        my_id.direction = random(360);
        my_id.speed = 2.5;
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_yscale = choose(-1, 1);
    audio_play_sound(choose(sndBulletHit1, sndBulletHit2, sndBulletHit3), 0, false);
    if (bullets > 1)
    {
        my_id.sprite_index = choose(sprEBackShotgun, sprEBackShotgun, sprEFrontShotgun);
    }
    else
    {
        my_id.sled = 0;
        my_id.sprite_index = choose(sprEBackMachinegun, sprEBackMachinegun, sprEFrontMachinegun);
    }
    my_id.image_index = floor(random(4));
    if (my_id.sprite_index == sprEBackShotgun && round(random(24)) == 2)
    {
        my_id.sprite_index = sprEBackShotgunVomit;
        my_id.image_index = 0;
    }
    if (my_id.sprite_index == sprEBackShotgun && round(random(24)) == 2)
    {
        scrGoreShotgun(x, y, other.direction - 180, 1, x + lengthdir_x(23, my_id.direction), y + lengthdir_y(23, my_id.direction), my_id.direction, 1, 0);
        i = 0;
        repeat (4)
        {
            tempid = instance_create(x, y, objSkinPiece2);
            tempid.speed = 2.4 + random(1.2);
            tempid.direction = direction + i + random_range(-35, 35);
            tempid.image_angle = tempid.direction;
            tempid.image_index = random(4);
            i += 80;
        }
        i = 0;
        repeat (2)
        {
            tempid = instance_create(x, y, objSkinPiece2);
            tempid.sprite_index = sprHeadPieces;
            tempid.image_index = random(6);
            tempid.speed = 2.4 + random(1.2);
            tempid.direction = direction + i + random_range(-35, 35);
            tempid.image_angle = tempid.direction;
            tempid.image_index = random(4);
            i += 160;
        }
        my_id.sprite_index = sprEBackHeadJerk;
        my_id.image_index = 0;
        my_id.life = 50 + random(30);
    }
    if (my_id.sprite_index == sprEBackShotgun && round(random(24)) == 2)
    {
        my_id.sprite_index = sprEBackFlyShotgun;
        my_id.image_index = 0;
    }
    my_id.direction = edir;
    my_id.speed = 1.5 + random(1) + (bullets * 0.15);
    my_id.image_angle = my_id.direction;
    if (my_id.sprite_index == sprEBackHeadshot)
    {
        audio_play_sound(sndHeadshot, 0, false);
    }
    if (my_id.sprite_index == sprEBackMachinegun && round(random(24)) == 2)
    {
        my_id.sprite_index = sprEBackHeadshot;
        my_id.image_index = 0;
        my_id.speed = 0;
        my_id.image_angle -= 180;
        repeat (8)
        {
            my_id = instance_create((x - 3) + random(6), y - 3, objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
            {
                my_id.decadenced = 1;
            }
            my_id.image_angle = (edir - 20) + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
            my_id = instance_create((x - 3) + random(6), (y - 3) + random(6), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x, y, my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = 1 + random(5);
            if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
            {
                my_id.decadenced = 1;
            }
        }
        scrGoreShot(x, y, other.direction - 180, other.x, other.y, 1);
    }
    else if (my_id.sprite_index == sprEBackMachinegun || my_id.sprite_index == sprEFrontMachinegun)
    {
        scrGoreShot(x, y, other.direction - 180, other.x, other.y, 0);
    }
    if (my_id.sprite_index == sprEBackShotgun)
    {
        if (my_id.image_index == 0)
        {
            scrGoreShotgun(x, y, other.direction - 180, 0, 0, 0, 0, 0, 1);
        }
        if (my_id.image_index == 1)
        {
            scrGoreShotgun(x, y, other.direction - 180, 0, 0, 0, 0, 0, 1);
        }
        if (my_id.image_index == 2)
        {
            scrGoreShotgun(x, y, other.direction - 180, 1, x + lengthdir_x(18, my_id.direction + (20 * my_id.image_yscale)), y + lengthdir_y(18, my_id.direction + (20 * my_id.image_yscale)), my_id.direction - (90 * my_id.image_yscale), 0, 0);
            part = instance_create(x + lengthdir_x(18, my_id.direction + (20 * my_id.image_yscale)), y + lengthdir_y(18, my_id.direction + (20 * my_id.image_yscale)), objBodyPartShotgun);
            part.image_angle = edir - (-25 * my_id.image_yscale) - random_range(-5, 5);
            part.sprite_index = sprEMafiaShotgunPieces;
            part.direction = part.image_angle;
            part.speed = 3 + random(1);
            part.image_index = choose(0, 1);
            part.image_yscale = my_id.image_yscale;
        }
        if (my_id.image_index == 3)
        {
            scrGoreShotgun(x, y, other.direction - 180, 1, x + lengthdir_x(23, my_id.direction), y + lengthdir_y(23, my_id.direction), my_id.direction, 1, 0);
            i = 0;
            repeat (4)
            {
                tempid = instance_create(x, y, objSkinPiece2);
                tempid.speed = 2.4 + random(1.2);
                tempid.direction = direction + i + random_range(-35, 35);
                tempid.image_angle = tempid.direction;
                tempid.image_index = random(4);
                i += 80;
            }
            i = 0;
            repeat (2)
            {
                tempid = instance_create(x, y, objSkinPiece2);
                tempid.sprite_index = sprHeadPieces;
                tempid.image_index = random(6);
                tempid.speed = 2.4 + random(1.2);
                tempid.direction = direction + i + random_range(-35, 35);
                tempid.image_angle = tempid.direction;
                tempid.image_index = random(4);
                i += 160;
            }
        }
    }
    if (my_id.sprite_index == sprEFrontShotgun)
    {
        if (my_id.image_index == 0)
        {
            scrGoreShotgun(x, y, other.direction - 180, 0, 0, 0, 0, 0, 1);
        }
        if (my_id.image_index == 1)
        {
            scrGoreShotgun(x, y, other.direction - 180, 0, 0, 0, 0, 0, 1);
        }
        if (my_id.image_index == 2)
        {
            scrGoreShotgun(x, y, other.direction - 180, 0, 0, 0, 0, 0, 0);
            part = instance_create(x + lengthdir_x(15, my_id.image_angle - (-36 * my_id.image_yscale)), y + lengthdir_y(15, my_id.image_angle - (-36 * my_id.image_yscale)), objBodyPartShotgun);
            part.image_angle = edir - (-30 * my_id.image_yscale) - random_range(-5, 5);
            part.direction = part.image_angle - 180;
            part.speed = 1.25 + random(0.75) + (bullets * 0.15);
            part.image_index = 4;
            part.sled = 2;
            part.image_yscale = my_id.image_yscale;
            part = instance_create(x + lengthdir_x(-15, my_id.image_angle - (29 * my_id.image_yscale)), y + lengthdir_y(-15, my_id.image_angle - (29 * my_id.image_yscale)), objBodyPartShotgun);
            part.image_angle = edir - (-50 * my_id.image_yscale) - random_range(-5, 5);
            part.direction = part.image_angle - 180;
            part.speed = 1 + random(0.5) + (bullets * 0.15);
            part.image_index = choose(2, 3);
            part.image_yscale = my_id.image_yscale;
        }
        if (my_id.image_index == 3)
        {
            scrGoreShotgun(x, y, other.direction - 180, 1, x + lengthdir_x(23, my_id.direction), y + lengthdir_y(23, my_id.direction), my_id.direction, 1, 0);
            i = 0;
            repeat (4)
            {
                tempid = instance_create(x, y, objSkinPiece2);
                tempid.speed = 2.4 + random(1.2);
                tempid.direction = direction + i + random_range(-35, 35);
                tempid.image_angle = tempid.direction;
                tempid.image_index = random(4);
                i += 80;
            }
            i = 0;
            repeat (2)
            {
                tempid = instance_create(x, y, objSkinPiece2);
                tempid.sprite_index = sprHeadPieces;
                tempid.image_index = random(6);
                tempid.speed = 2.4 + random(1.2);
                tempid.direction = direction + i + random_range(-35, 35);
                tempid.image_angle = tempid.direction;
                tempid.image_index = random(4);
                i += 160;
            }
        }
    }
    if (noweapon == 0)
    {
        my_id = instance_create(x, y, objWeaponThrow);
        if (instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
        my_id.image_index = scrCurrentWeaponExt(sprite_index);
        my_id.direction = (other.direction - 70) + random(40);
        my_id.speed = 2 + random(2);
        my_id.ammo = ammo;
        if (sprite_index == sprEDrinking)
        {
            my_id = instance_create(x, y, objWeaponThrow);
            my_id.image_index = 31;
            my_id.direction = image_angle - 90;
            my_id.speed = 1;
        }
    }
    instance_destroy();
}
