image_speed = 0;
if (sprite_index == sprPHumanShieldDoubleBarrelShoot1)
{
    sprite_index = sprPHumanShieldDoubleBarrel;
}
if (sprite_index == sprPHumanShieldDoubleBarrelShoot2)
{
    sprite_index = sprPHumanShieldDoubleBarrel;
}
if (sprite_index == sprPHumanShieldSilencerShoot)
{
    sprite_index = sprPHumanShieldSilencer;
}
if (sprite_index == sprPAttackHumanShieldSilencedUzi)
{
    sprite_index = sprPWalkHumanShieldSilencedUzi;
}
if (sprite_index == sprPHumanShieldUziShoot)
{
    sprite_index = sprPHumanShieldUzi;
}
if (sprite_index == sprPHumanShieldMagnumShoot)
{
    sprite_index = sprPHumanShieldMagnum;
}
if (sprite_index == sprPHumanShieldScorpionShoot)
{
    sprite_index = sprPHumanShieldScorpion;
}
if (sprite_index == sprPHumanShieldMP5Shoot)
{
    sprite_index = sprPHumanShieldMP5;
}
if (sprite_index == sprPHumanShieldMP5Shoot)
{
    sprite_index = sprPHumanShieldMP5;
}
if (sprite_index == sprPAttackHumanShieldAks)
{
    sprite_index = sprPWalkHumanShieldAks;
}
if (sprite_index == sprPAttackHumanShieldNailgun)
{
    sprite_index = sprPWalkHumanShieldNailgun;
}
if (sprite_index == sprPHumanShield9mmShoot)
{
    sprite_index = sprPHumanShield9mm;
}
if (sprite_index == sprShieldSnapMP5)
{
    if (bottom == "Police")
    {
        my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objPoliceHat);
        my_id.direction = (dir - 10) + random(20);
        my_id.speed = 2 + random(1);
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = asset_get_index(sprite_get_name(sprEBackShieldSnap) + bottom);
    my_id.image_index = floor(random(3));
    my_id.sled = 0;
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir - 45, 12);
    }
    my_id.direction = dir;
    my_id.image_yscale = 1;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    my_id.release = 1;
    my_id.sprite_index = sprPWalkMP5;
    instance_destroy();
}
if (sprite_index == sprShieldSnapScorpion)
{
    if (bottom == "Police")
    {
        my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objPoliceHat);
        my_id.direction = (dir - 10) + random(20);
        my_id.speed = 2 + random(1);
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sled = 0;
    my_id.sprite_index = asset_get_index(sprite_get_name(sprEBackShieldSnap) + bottom);
    my_id.image_index = floor(random(3));
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir - 45, 12);
    }
    my_id.direction = dir;
    my_id.image_yscale = 1;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    my_id.release = 1;
    my_id.sprite_index = sprPWalkScorpion;
    instance_destroy();
}
if (sprite_index == sprShieldSnapMagnum)
{
    if (bottom == "Police")
    {
        my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objPoliceHat);
        my_id.direction = (dir - 10) + random(20);
        my_id.speed = 2 + random(1);
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sled = 0;
    my_id.sprite_index = asset_get_index(sprite_get_name(sprEBackShieldSnap) + bottom);
    my_id.image_index = floor(random(3));
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir - 45, 12);
    }
    my_id.direction = dir;
    my_id.image_yscale = 1;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    my_id.release = 1;
    my_id.sprite_index = sprPWalkMagnum;
    instance_destroy();
}
if (sprite_index == sprShieldSnapDoubleBarrel)
{
    if (bottom == "Police")
    {
        my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objPoliceHat);
        my_id.direction = (dir - 10) + random(20);
        my_id.speed = 2 + random(1);
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sled = 0;
    my_id.sprite_index = asset_get_index(sprite_get_name(sprEBackShieldSnap) + bottom);
    my_id.image_index = floor(random(3));
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir - 45, 12);
    }
    my_id.direction = dir;
    my_id.image_yscale = 1;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    my_id.release = 1;
    my_id.sprite_index = sprPWalkDoubleBarrel;
    instance_destroy();
}
if (sprite_index == sprShieldSnapUzi)
{
    if (bottom == "Police")
    {
        my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objPoliceHat);
        my_id.direction = (dir - 10) + random(20);
        my_id.speed = 2 + random(1);
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sled = 0;
    my_id.sprite_index = asset_get_index(sprite_get_name(sprEBackShieldSnap) + bottom);
    my_id.image_index = floor(random(3));
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir - 45, 12);
    }
    my_id.direction = dir;
    my_id.image_yscale = 1;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    my_id.release = 1;
    my_id.sprite_index = sprPWalkUzi;
    instance_destroy();
}
if (sprite_index == sprShieldSnapSilencer)
{
    if (bottom == "Police")
    {
        my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objPoliceHat);
        my_id.direction = (dir - 10) + random(20);
        my_id.speed = 2 + random(1);
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sled = 0;
    my_id.sprite_index = asset_get_index(sprite_get_name(sprEBackShieldSnap) + bottom);
    my_id.image_index = floor(random(3));
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir - 45, 12);
    }
    my_id.direction = dir;
    my_id.image_yscale = 1;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    my_id.release = 1;
    my_id.sprite_index = sprPWalkSilencer;
    instance_destroy();
}
if (sprite_index == sprPSnapHumanShieldSilencedUzi)
{
    if (bottom == "Police")
    {
        my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objPoliceHat);
        my_id.direction = (dir - 10) + random(20);
        my_id.speed = 2 + random(1);
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sled = 0;
    my_id.sprite_index = asset_get_index(sprite_get_name(sprEBackShieldSnap) + bottom);
    my_id.image_index = floor(random(3));
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir - 45, 12);
    }
    my_id.direction = dir;
    my_id.image_yscale = 1;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    my_id.release = 1;
    my_id.sprite_index = sprPWalkSilencedUzi;
    instance_destroy();
}
if (sprite_index == sprPShieldSnapAks)
{
    if (bottom == "Police")
    {
        my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objPoliceHat);
        my_id.direction = (dir - 10) + random(20);
        my_id.speed = 2 + random(1);
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sled = 0;
    my_id.sprite_index = asset_get_index(sprite_get_name(sprEBackShieldSnap) + bottom);
    my_id.image_index = floor(random(3));
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir - 45, 12);
    }
    my_id.direction = dir;
    my_id.image_yscale = 1;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    my_id.release = 1;
    my_id.sprite_index = sprPWalkAks;
    instance_destroy();
}
if (sprite_index == sprPShieldSnapNailgun)
{
    if (bottom == "Police")
    {
        my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objPoliceHat);
        my_id.direction = (dir - 10) + random(20);
        my_id.speed = 2 + random(1);
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sled = 0;
    my_id.sprite_index = asset_get_index(sprite_get_name(sprEBackShieldSnap) + bottom);
    my_id.image_index = floor(random(3));
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir - 45, 12);
    }
    my_id.direction = dir;
    my_id.image_yscale = 1;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    my_id.release = 1;
    my_id.sprite_index = sprPWalkNailgun;
    instance_destroy();
}
if (sprite_index == sprPHumanShieldSnap9mm)
{
    if (bottom == "Police")
    {
        my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objPoliceHat);
        my_id.direction = (dir - 10) + random(20);
        my_id.speed = 2 + random(1);
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sled = 0;
    my_id.sprite_index = asset_get_index(sprite_get_name(sprEBackShieldSnap) + bottom);
    my_id.image_index = floor(random(3));
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir - 45, 12);
    }
    my_id.direction = dir;
    my_id.image_yscale = 1;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    my_id.release = 1;
    my_id.sprite_index = sprPWalk9mm;
    instance_destroy();
}
