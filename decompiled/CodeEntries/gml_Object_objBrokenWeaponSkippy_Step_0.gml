if (wait > 0)
{
    if (round(random(80)) == 2)
    {
        my_id = instance_create((x - 10) + random(20), (y - 10) + random(20), objBloodSplat);
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
    }
    if (image_index == 3)
    {
        wait -= 0.25;
    }
    else
    {
        wait -= 1;
    }
}
if (wait == 0)
{
    glow = lerp(glow, 0, 0.15);
}
else
{
    glow = lerp(glow, 0, 0.005);
}
image_angle += rotspeed;
if (speed == 0)
{
    speed = 0;
    rotspeed = 0;
}
if (speed > 0 && image_index == 3)
{
    if (otkat <= 0)
    {
        otkat = 2;
        my_id = instance_create(x, y, objBloodSled);
        my_id.image_xscale = 0.33;
        my_id.image_yscale = 0.33;
        my_id.image_angle = direction + choose(random_range(-4, 4));
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
    }
    else
    {
        otkat -= 1.5;
    }
}
if (image_index != 3)
{
    if (round(random(80 + (wait * 4))) == 2)
    {
        my_id = instance_create(x, y, objSteam);
        my_id.direction = random(360);
        my_id.speed = 1 + random(1);
        my_id.image_angle = my_id.direction;
    }
}
