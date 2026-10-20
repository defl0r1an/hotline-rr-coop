if (!instance_exists(objPlayer))
{
    alert = 1;
}
else
{
    alert = scrLook(objPlayer.x, objPlayer.y, 4);
}
if ((alert == 0 || alert == 2) && ammo > 0)
{
    if (image_index == 0 && instance_exists(objPlayer))
    {
        direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
    }
    if (image_index > 0)
    {
        image_index -= 0.25;
    }
}
else
{
    reload = 20;
    if (image_index < 5)
    {
        image_index += 0.25;
    }
}
if (image_index == 0 && ammo > 0)
{
    if (reload > 0)
    {
        reload -= 1;
        exit;
    }
    shake = 1;
    reload = 2;
    my_id = instance_create(x + lengthdir_x(24, direction), y + lengthdir_y(24, direction), objEBullet);
    my_id.direction = (direction - 4) + random(8);
    my_id.speed = 16;
    my_id.image_angle = my_id.direction;
    my_id2 = instance_create(x + lengthdir_x(5, angle - (5 * image_yscale)), y + lengthdir_y(5, angle - (5 * image_yscale)), objShell);
    my_id2.sprite_index = sprM16Shell;
    my_id2.image_angle = angle;
    my_id2.direction = (direction - dir - 110) + random(30);
    my_id2.speed = 1 + random(3);
    mask_index = sprMask;
    ammo -= 1;
    audio_play_sound(sndM16, 0, false);
}
if (instance_exists(objEHideTrigger))
{
    with (instance_nearest(x, y, objEHideTrigger))
    {
        slot = 1;
    }
}
if (ammo <= 0)
{
    alert = 1;
    mags -= 1;
    if (image_index < 5)
    {
        image_index += 0.01;
    }
    else
    {
        sprite_index = sprEHidingReload;
        image_speed = 0.2;
        if (image_index == 10)
        {
            my_id2 = instance_create(x + lengthdir_x(5, angle - (5 * image_yscale)), y + lengthdir_y(5, angle - (5 * image_yscale)), objShell);
            my_id2.sprite_index = sprM16Mag;
            my_id2.image_angle = image_angle;
            my_id2.direction = (direction - dir) + 110 + random(30);
            my_id2.speed = random_range(1, 2);
        }
    }
}
