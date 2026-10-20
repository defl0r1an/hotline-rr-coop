if (image_index == 2)
{
    image_angle += (speed * 5 * diradd);
    if (speed == 0)
    {
        sled = 0;
    }
    if (sled == 1)
    {
        otkat -= 0.75;
        if (otkat <= 0)
        {
            otkat = 2;
            my_id = instance_create(x, y, objBloodSled);
            my_id.image_xscale = 0.5;
            my_id.image_yscale = 0.5;
            my_id.image_angle = direction + choose(random_range(-4, 4));
        }
    }
}
if (wait > 0)
{
    wait -= 1;
}
if (sprite_index == sprCanOfPaintKnockout && wait == 0 && coli == 1)
{
    my_id = instance_create(x + lengthdir_x(10, image_angle), y + lengthdir_y(6, image_angle), objBloodPool);
    my_id.image_xscale = 0.5;
    my_id.image_yscale = 0.5;
    coli = 2;
}
