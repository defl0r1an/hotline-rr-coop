image_angle += (speed * rotspeed);
scrMoveSolidOn();
if (!place_free(x, y))
{
    lastx = x - hspeed;
    lasty = y - vspeed;
    move_bounce_solid(0);
    x = lastx;
    y = lasty;
    speed *= 0.5;
}
scrMoveSolidOff();
if (speed == 0 && bled == 0 && global.maskindex != 19)
{
    bled = 1;
    my_id = instance_create(x, y, objBloodPool);
    my_id.image_xscale = 0.5;
    my_id.image_yscale = 0.5;
}
if (speed == 0)
{
    sled = 0;
}
if (sled == 1 || sled == 2)
{
    otkat -= 0.75;
    if (otkat <= 0)
    {
        if (sled == 2)
        {
            otkat = 3;
            my_id = instance_create(x, y, objBloodSled);
            my_id.image_xscale = 0.5;
            my_id.image_yscale = 0.5;
            my_id.image_angle = direction + choose(random_range(-4, 4));
        }
        else
        {
            otkat = 2;
            my_id = instance_create(x, y, objBloodSled);
            my_id.image_xscale = 0.75;
            my_id.image_yscale = 0.75;
        }
    }
}
if (bled == 1)
{
    if (wait > 0)
    {
        wait -= 1;
    }
    else if (!place_meeting(x, y, objBloodPool) && global.surfaces == 1)
    {
        image_speed = 0;
        surface_set_target(global.surf2);
        draw_sprite_ext(sprite_index, image_index, x * 3, y * 3, image_xscale * 3, image_yscale * 3, image_angle, image_blend, image_alpha);
        surface_reset_target();
        instance_destroy();
    }
}
