if (global.my_id.object_index == objThrowingWeapon)
{
    if (global.my_id.image_index == 9)
    {
        exit;
    }
}
global.gunkill = 0;
global.blink = 1;
global.shake = 3;
edir = other.direction;
test = 0;
repeat (2)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.sprite_index = sprBloodSplatSmall;
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(4);
}
repeat (1)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.direction = my_id.image_angle;
    my_id.speed = 1 + random(5);
}
repeat (1)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, edir), (y - 3) + random(6) + lengthdir_y(16, edir), objBloodSmoke);
    my_id.image_xscale = 1.2 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = (edir - 20) + random(40);
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(1);
    my_id.friction = 0.15;
}
scrIdleGetEnemy();
global.combo += 1;
global.combotime = 240;
my_id = instance_create(x, y, objDeadBody);
my_id.sprite_index = sprEBackCut;
if (scrIsPolice(object_index))
{
    my_id.sprite_index = sprEPoliceDeadKnife;
    my_id1 = instance_create(x + lengthdir_x(6, edir), y + lengthdir_y(6, edir), objPoliceHat);
    my_id1.direction = direction - 180;
    my_id1.speed = 1;
}
my_id.image_index = 5 + round(random(1));
if (global.my_id.object_index == objCleaver)
{
    my_id.image_index = 11 + round(random(1));
}
my_id.direction = edir;
my_id.speed = 1.5 + random(1);
my_id.image_angle = my_id.direction;
if (global.my_id.object_index == objThrowingWeapon)
{
    if (global.my_id.image_index == 0)
    {
        my_id.image_index = 7 + round(random(1));
    }
    if (global.my_id.image_index == 4)
    {
        my_id.image_index = 9 + round(random(1));
    }
}
if (global.my_id.object_index == objThrowingKnife || global.my_id.object_index == objDennisThrowingKnife)
{
    my_id.image_index = 11 + round(random(1));
    if (global.my_id.object_index == objThrowingKnife && round(random(4)) == 2)
    {
        my_id.sprite_index = sprEMafiaDieBikerKnife;
        my_id.image_index = 0;
        my_id.image_speed = 0.15;
        my_id.image_angle = my_id.direction - 180;
        my_id.sled = 0;
    }
}
if ((my_id.image_index == 5 || my_id.image_index == 6) && (my_id.sprite_index == sprEBackCut || my_id.sprite_index == sprEPoliceDeadKnife) && round(random(4)) == 2)
{
    my_id.sprite_index = sprEMafiaDeadKnifeHead;
    if (scrIsPolice(object_index))
    {
        my_id.sprite_index = sprEPoliceDeadThrow;
    }
    my_id.image_index = 0;
    my_id.image_speed = 0.15;
    my_id.image_angle = my_id.direction - 180;
    my_id.sled = 0;
}
if (global.my_id.object_index == objDennisThrowingKnife && object_index == objDogPatrol)
{
    my_id.sprite_index = sprDogDeadTKnife;
    my_id.image_index = round(random(3));
}
if (global.my_id.image_index == 47)
{
    my_id.sprite_index = sprEMafiaDeadKnife2Head;
    if (scrIsPolice(object_index))
    {
        my_id.sprite_index = sprEPoliceDeadKnife2Head;
    }
    my_id.image_index = 0;
    my_id.image_speed = 0.15;
    my_id.image_angle = my_id.direction - 180;
    my_id.sled = 0;
}
if (global.my_id.image_index == 6)
{
    my_id.sprite_index = sprEMafiaDeadDart;
    my_id.image_index = 0;
    my_id.image_speed = 0.15;
    my_id.image_angle = my_id.direction - 180;
    my_id.sled = 0;
}
if (global.my_id.image_index == 49)
{
    my_id.sprite_index = sprEBackSlashed;
    if (scrIsPolice(object_index))
    {
        my_id.sprite_index = sprPoliceBackSlashed;
    }
    my_id.image_index = 0;
    my_id.image_speed = 0;
    scrGoreCut(x, y, edir - 180, 0, 0);
    if (place_free(my_id.x + lengthdir_x(22, edir), my_id.y + lengthdir_y(18, edir)))
    {
        part = instance_create(my_id.x + lengthdir_x(22, edir), my_id.y + lengthdir_y(18, edir), objSeveredHead);
    }
    else
    {
        part = instance_create(my_id.x, my_id.y, objSeveredHead);
    }
    part.image_angle = (edir - 10) + random(20);
    part.direction = part.image_angle;
    part.speed = 3 + random(1);
}
if (scrNoweapon(sprite_index))
{
    noweapon = 1;
}
else
{
    noweapon = 0;
}
my_id = instance_create(x, y - 12, objScore);
if (noweapon == 0)
{
    my_id.text = "+" + string(800 * global.factor) + "pts";
    global.myscore += (800 * global.factor);
    my_id = instance_create(x, y, objWeaponThrow);
    my_id.direction = (other.direction - 70) + random(40);
    my_id.speed = 2 + random(2);
    my_id.image_index = scrCurrentWeaponExt(sprite_index);
    my_id.ammo = ammo;
}
else
{
    my_id.text = "+" + string(300 * global.factor) + "pts";
    global.myscore += (300 * global.factor);
    global.boldscore += (300 * global.factor);
}
instance_destroy();
audio_play_sound(choose(sndCut1, sndCut2), 0, false);
with (global.my_id)
{
    my_id = instance_create(x, y, objBloodSmoke);
    my_id.direction = (direction - 170) + random(10);
    my_id.speed = 1;
    my_id.image_angle = my_id.direction;
    my_id.image_xscale = 0.8 + random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    if (image_index != 49)
    {
        instance_destroy();
    }
}
