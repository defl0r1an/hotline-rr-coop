if (object_get_parent(object_index) == 1327)
{
    energie = 0;
}
global.my_id = id;
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
test = 0;
repeat (2 * bullets)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.sprite_index = sprBloodSplatSmall;
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(4);
}
repeat (1 + random(bullets))
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.direction = my_id.image_angle;
    my_id.speed = 1 + random(5);
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
}
if (alert == 0 && object_get_parent(object_index) != 1327)
{
    alert = 1;
}
if (bullets > 1 || round(random(1)) || energie < 0)
{
    if (sprite_index == sprPoliceWalkUnarmed)
    {
        noweapon = 1;
    }
    else
    {
        noweapon = 0;
    }
    scrIdleGetEnemy();
    global.punchonly = 0;
    if (noweapon == 1)
    {
        factor = 0.5;
    }
    else
    {
        factor = 1;
    }
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string((100 + (bullets * 20) + (80 * factor)) * global.factor) + "pts";
    global.myscore += ((100 + (bullets * 20) + (80 * factor)) * global.factor);
    global.killscore += (100 + (bullets * 20));
    global.boldscore += (80 * factor);
    global.combo += 1;
    global.combotime = 240;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
    global.blink = 1;
    global.gunkill += 1;
    my_id = instance_create(x, y, objDeadBody);
    if (bullets > 1)
    {
        my_id.sprite_index = choose(sprPoliceBackShotgun, sprPoliceBackShotgun, sprPoliceFrontShotgun);
    }
    else
    {
        my_id.sprite_index = choose(sprPoliceBackMachinegun, sprPoliceBackMachinegun, sprPoliceFrontMachinegun);
    }
    audio_play_sound(choose(sndBulletHit1, sndBulletHit2, sndBulletHit3), 0, false);
    my_id.image_index = 1 + floor(random(4));
    my_id.direction = edir;
    my_id.speed = 1.5 + random(1) + (bullets * 0.15);
    my_id.image_angle = my_id.direction;
    if (my_id.sprite_index == sprPoliceBackShotgun && round(random(24)) == 2)
    {
        my_id.sprite_index = sprPoliceFlyShotgun;
        my_id.image_index = 0;
    }
    if (my_id.sprite_index == sprPoliceBackMachinegun && round(random(24)) == 2)
    {
        my_id.sprite_index = sprPoliceBackHeadshot;
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
        }
        scrGoreShot(x, y, other.direction - 180, other.x, other.y, 1);
    }
    if (my_id.sprite_index == sprPoliceFrontMachinegun)
    {
        scrGoreShot(x, y, other.direction - 180, other.x, other.y, 0);
    }
    if (my_id.sprite_index == sprPoliceBackShotgun)
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
            part.sprite_index = sprEPoliceShotgunPieces;
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
    if (my_id.sprite_index == sprPoliceFrontShotgun)
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
            part.sprite_index = sprEPoliceShotgunPieces;
            part.image_angle = edir - (-30 * my_id.image_yscale) - random_range(-5, 5);
            part.direction = part.image_angle - 180;
            part.speed = 1.25 + random(0.75) + (bullets * 0.15);
            part.image_index = 4;
            part.sled = 2;
            part.image_yscale = my_id.image_yscale;
            part = instance_create(x + lengthdir_x(-15, my_id.image_angle - (29 * my_id.image_yscale)), y + lengthdir_y(-15, my_id.image_angle - (29 * my_id.image_yscale)), objBodyPartShotgun);
            part.sprite_index = sprEPoliceShotgunPieces;
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
    my_id = instance_create(x, y, objPoliceHat);
    my_id.direction = (edir - 10) + random(20);
    my_id.speed = 1 + random(2);
    if (noweapon == 0)
    {
        my_id = instance_create(x, y, objWeaponThrow);
        my_id.image_index = scrCurrentWeaponExt(sprite_index);
        my_id.direction = (other.direction - 70) + random(40);
        my_id.speed = 2 + random(2);
        my_id.ammo = ammo;
    }
    instance_destroy();
}
