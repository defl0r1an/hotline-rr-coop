if (image_index >= 5)
{
    exit;
}
global.my_id = id;
with (other.id)
{
    if (collision_circle(x, y, 10, objExplosionSkippy, 0, 1))
    {
        scrExplosionDie(1191, 0, 0, 0);
        with (objGirlfriend)
        {
            active = 1;
        }
        if (weaponget == 1)
        {
            my_id = instance_create(x + lengthdir_x(8, image_angle + 90), y + lengthdir_y(8, image_angle + 90), objWeaponThrow);
            my_id.image_index = 1;
            my_id.direction = image_angle + 90 + random_range(-20, 20);
            my_id.speed = 1 + random(2);
            my_id.ammo = ammo;
        }
    }
    else
    {
        my_id = instance_create(x, y, objBoss1Down);
        my_id.direction = (point_direction(x, y, objExplosionSkippy.x, objExplosionSkippy.y) - 180 - 10) + random(20);
        my_id.image_angle = my_id.direction;
        my_id.speed = clamp(5 - (point_distance(x, y, objExplosionSkippy.x, objExplosionSkippy.y) / 50), 0, 5);
        my_id.friction = 0.1;
        my_id.energie = -1;
        if (weaponget == 1)
        {
            my_id.sprite_index = sprBoss1ShotShotgun;
        }
        if (energie <= 1)
        {
            my_id.image_index = 1;
        }
        if (energie <= 0)
        {
            my_id.dead = 1;
            my_id.wait = 90;
        }
        instance_destroy();
    }
}
