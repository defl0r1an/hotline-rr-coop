if (sprite_index == sprEFatGunDie)
{
    my_id = instance_create(x, y, objDeadBody);
    my_id.direction = direction - 180;
    my_id.speed = 0.5;
    if (dennisknife > 0 || knife > 0)
    {
        my_id.sprite_index = sprEFatGunDeadTKnife;
        if (knife > 0)
        {
            my_id.sprite_index = sprEFatGunDeadKnifeBiker;
        }
    }
    else
    {
        my_id.sprite_index = sprEFatGunDead;
    }
    if (shotgunned == 1)
    {
        my_id.image_index = floor(random(2));
    }
    else if (melee == 1)
    {
        my_id.image_index = 1;
    }
    else if (dennisknife > 0 || knife > 0)
    {
        my_id.image_index = dennisknife + knife + floor(random(1));
    }
    else
    {
        my_id.image_index = 2 + floor(random(2));
    }
    my_id.image_angle = my_id.direction;
    instance_destroy();
    exit;
}
if ((sprite_index == sprEFatGunAttack && alert == 0) || (sprite_index == sprEFatGunAttack && alert == 3))
{
    sprite_index = sprEFatGunWalk;
}
if (sprite_index == sprEFatGunSearch)
{
    sprite_index = sprEFatGunWalk;
    image_speed = 0;
}
if (sprite_index == sprEFatGunAttackMelee)
{
    sprite_index = sprEFatGunWalk;
    image_speed = 0;
}
if (sprite_index == sprEFatGunReload)
{
    sprite_index = sprEFatGunWalk;
    image_speed = 0;
    ammo = 32;
    clip = 0;
}
