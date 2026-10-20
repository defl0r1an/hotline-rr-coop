angle += (speed * 5 * diradd);
if (wait > 0)
{
    wait -= 1;
}
shake = lerp(shake, 0.5, 0.025);
if (wait == 0)
{
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
    i = 0;
    repeat (4)
    {
        my_id = instance_create(x, y, objBrokenWeaponSkippy);
        my_id.speed = 3 + random(2);
        my_id.direction = random(360);
        my_id.image_index = i;
        i += 1;
    }
    if (explore == 0)
    {
        my_id = instance_create(x, y, objExplosionSkippy);
        explore = 1;
    }
    instance_destroy();
}
if (destroy == 1)
{
    instance_destroy();
}
