if (place_meeting(x, y, objBloodPool))
{
    bloodsled = 1;
}
if (bloodstep > 0)
{
    bloodstep -= 1;
}
else if (bloodsled > 0)
{
    my_id = instance_create(x, y, objLegSled);
    my_id.image_speed = 0;
    my_id.sprite_index = sprLegSleds;
    if (bloodscale == 1)
    {
        my_id.image_index = 0;
    }
    else
    {
        my_id.image_index = 1;
    }
    my_id.image_angle = angle;
    my_id.image_alpha = bloodsled;
    bloodsled -= random_range(0.05, 0.1);
    bloodstep = 10;
    bloodscale = -bloodscale;
}
if (room == rmHouse5Downstairs && global.hardmode == 1 && global.maskindex == 2 && x == 550 && y == 240)
{
    instance_destroy();
}
if (sprite_index == sprEWalkUnarmed)
{
    nothing = 0;
}
else
{
    global.factor += sign(alert);
}
scrMoveSolidOn();
if (sprite_index == sprEWalkUnarmed)
{
    scrGoGetWeapon();
}
if (!place_free(x + (hspeed * 3), y + (vspeed * 3)))
{
    if (!place_free(x + (hspeed * 3), y))
    {
        hspeed = -hspeed;
    }
    if (!place_free(x, y + (vspeed * 3)))
    {
        vspeed = -vspeed;
    }
}
if (path_index > 0)
{
    image_speed = 0.2;
    if (path_position == 1)
    {
        path_end();
    }
}
else
{
    image_speed = speed * 0.1;
}
scrMoveSolidOff();
if (!instance_exists(objPlayer))
{
    alert = 0;
    speed = 0;
    exit;
}
scrEStaticStep();
scrStayAwayFromPlayer();
if (sprite_index == sprEWalk9mm && ammoget == 0)
{
    ammo = 13;
    ammoget = 1;
}
if (sprite_index == sprEWalkScorpion && ammoget == 0)
{
    ammo = 20;
    ammoget = 1;
}
