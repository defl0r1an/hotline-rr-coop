if (sprite_index == sprShieldSnapUzi || sprite_index == sprShieldSnapMP5 || sprite_index == sprShieldSnapDoubleBarrel || sprite_index == sprShieldSnapSilencer || sprite_index == sprShieldSnapScorpion || sprite_index == sprShieldSnapMagnum || sprite_index == sprPSnapHumanShieldSilencedUzi || sprite_index == sprPShieldSnapAks || sprite_index == sprPShieldSnapNailgun || sprite_index == sprPHumanShieldSnap9mm)
{
    exit;
}
if (reset == 1)
{
    exit;
}
if (energie < 8)
{
    if (bottom == "Police")
    {
        my_id = instance_create(x + lengthdir_x(4, dir), y + lengthdir_x(4, dir), objPoliceHat);
        my_id.direction = (dir - 10) + random(20);
        my_id.speed = 2 + random(1);
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = asset_get_index(sprite_get_name(sprEBackShieldSnap) + bottom);
    my_id.image_index = floor(random(3));
    global.dir = dir;
    with (my_id)
    {
        move_contact_solid(global.dir - 45, 12);
    }
    my_id.direction = dir;
    my_id.speed = 2 + random(1);
    my_id.image_angle = my_id.direction;
    my_id.type = 275;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.ammo = ammo;
    if (sprite_index == sprPHumanShieldDoubleBarrel)
    {
        my_id.sprite_index = sprPWalkDoubleBarrel;
    }
    if (sprite_index == sprPHumanShieldMagnum)
    {
        my_id.sprite_index = sprPWalkMagnum;
    }
    if (sprite_index == sprPHumanShieldScorpion)
    {
        my_id.sprite_index = sprPWalkScorpion;
    }
    if (sprite_index == sprPHumanShieldUzi)
    {
        my_id.sprite_index = sprPWalkUzi;
    }
    if (sprite_index == sprPHumanShieldMP5)
    {
        my_id.sprite_index = sprPWalkMP5;
    }
    if (sprite_index == sprPHumanShieldSilencer)
    {
        my_id.sprite_index = sprPWalkSilencer;
    }
    if (sprite_index == sprPWalkHumanShieldSilencedUzi)
    {
        my_id.sprite_index = sprPWalkSilencedUzi;
    }
    if (sprite_index == sprPWalkHumanShieldAks)
    {
        my_id.sprite_index = sprPWalkAks;
    }
    if (sprite_index == sprPWalkHumanShieldNailgun)
    {
        my_id.sprite_index = sprPWalkNailgun;
    }
    if (sprite_index == sprPHumanShield9mm)
    {
        my_id.sprite_index = sprPWalk9mm;
    }
    my_id.release = 1;
    instance_destroy();
}
else
{
    if (sprite_index == sprPHumanShieldDoubleBarrel || sprite_index == sprPHumanShieldDoubleBarrelShoot1 || sprite_index == sprPHumanShieldDoubleBarrelShoot2)
    {
        sprite_index = sprShieldSnapDoubleBarrel;
    }
    if (sprite_index == sprPHumanShieldMagnum || sprite_index == sprPHumanShieldMagnumShoot)
    {
        sprite_index = sprShieldSnapMagnum;
    }
    if (sprite_index == sprPHumanShieldScorpion || sprite_index == sprPHumanShieldScorpionShoot)
    {
        sprite_index = sprShieldSnapScorpion;
    }
    if (sprite_index == sprPHumanShieldUzi || sprite_index == sprPHumanShieldUziShoot)
    {
        sprite_index = sprShieldSnapUzi;
    }
    if (sprite_index == sprPHumanShieldMP5 || sprite_index == sprPHumanShieldMP5Shoot)
    {
        sprite_index = sprShieldSnapMP5;
    }
    if (sprite_index == sprPHumanShieldSilencer || sprite_index == sprPHumanShieldSilencerShoot)
    {
        sprite_index = sprShieldSnapSilencer;
    }
    if (sprite_index == sprPWalkHumanShieldSilencedUzi || sprite_index == sprPAttackHumanShieldSilencedUzi)
    {
        sprite_index = sprPSnapHumanShieldSilencedUzi;
    }
    if (sprite_index == sprPWalkHumanShieldAks || sprite_index == sprPAttackHumanShieldAks)
    {
        sprite_index = sprPShieldSnapAks;
    }
    if (sprite_index == sprPWalkHumanShieldNailgun || sprite_index == sprPAttackHumanShieldNailgun)
    {
        sprite_index = sprPShieldSnapNailgun;
    }
    if (sprite_index == sprPHumanShield9mm || sprite_index == sprPHumanShield9mmShoot)
    {
        sprite_index = sprPHumanShieldSnap9mm;
    }
    image_speed = 0.2;
    image_index = 0;
}
