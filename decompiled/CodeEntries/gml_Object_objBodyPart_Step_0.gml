image_angle += (speed * rotspeed);
if ((sprite_index == sprEDodgerGunDeadPieces || sprite_index == sprEDodgerDeadPieces || sprite_index == sprEBackSlashedPiece || sprite_index == sprPoliceBackSlashedPiece) && image_index == 0)
{
    my_id = instance_create(x, y, objSeveredHead);
    my_id.direction = direction;
    my_id.speed = speed;
    my_id.image_angle = image_angle;
    instance_destroy();
    exit;
}
if (sprite_index == sprFatmanHead)
{
    nothing = 1;
}
else
{
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
}
if (speed == 0 && bled == 0 && global.maskindex != 19)
{
    bled = 1;
    my_id = instance_create(x, y, objBloodPool);
    my_id.image_xscale = 0.5;
    my_id.image_yscale = 0.5;
}
if (speed == 0 || (sprite_index == sprEBackSlashedPiece && image_index != 1) || (sprite_index == sprEPoliceDeadPieces && image_index != 1) || (sprite_index == sprEDodgerDeadPieces && image_index != 1) || (sprite_index == sprEDodgerGunDeadPieces && image_index != 1) || (sprite_index == sprPJacketDeadPieces && image_index != 1))
{
    sled = 0;
}
if (sled == 1)
{
    otkat -= 0.75;
    otkat2 -= 0.75;
    if (otkat <= 0)
    {
        otkat = 2;
        my_id = instance_create(x - lengthdir_x(10, image_angle), y - lengthdir_y(10, image_angle), objBloodSled);
        my_id.image_xscale = 1;
        my_id.image_yscale = 1;
        my_id.image_angle = direction + choose(random_range(-4, 4));
    }
    if (otkat2 <= 0)
    {
        otkat2 = 6;
        my_id = instance_create(x - lengthdir_x(10, image_angle), y - lengthdir_y(10, image_angle), objGuts2);
        my_id.speed = random(1);
        my_id.direction = (image_angle - 180) + random_range(-10, 10);
    }
}
if (bled == 1)
{
    if (wait > 0)
    {
        wait -= 1;
    }
    else if (!place_meeting(x, y, objBloodPool) && global.surfaces == 1 && sprite_index != sprPJacketDeadPieces)
    {
        image_speed = 0;
        surface_set_target(global.surf2);
        draw_sprite_ext(sprite_index, image_index, x * 3, y * 3, image_xscale * 3, image_yscale * 3, image_angle, image_blend, image_alpha);
        surface_reset_target();
        instance_destroy();
    }
}
