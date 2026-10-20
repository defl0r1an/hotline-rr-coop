dist -= speed;
if (speed > 0)
{
    if (check == 0)
    {
        repeat (3)
        {
            my_id = instance_create(x, y, objBrains2);
            my_id.speed = (speed - 0.5) + random(1);
            my_id.direction = (direction - 5) + random(10);
            my_id.surface = surface;
        }
        check = 1;
    }
    if (otkat <= 0)
    {
        otkat = 2;
        my_id = instance_create(x, y, objBloodSled);
        my_id.image_xscale = 0.33;
        my_id.image_yscale = 0.33;
        my_id.image_angle = direction + choose(random_range(-4, 4));
        my_id.surface = surface;
    }
    else
    {
        otkat -= 1.5;
    }
}
else if (!instance_exists(objBloodPool))
{
    if ((global.blood == 0 || global.surfaces == 1) && surface)
    {
        addToSurface(global.surf2, 1);
    }
}
