global.done = 1;
if (sprite_index == sprESwatStumble)
{
    mask_index = sprEnemyMask;
    scrMoveSolidOn();
    if (!place_free(x + (hspeed * 2), y))
    {
        hspeed = 0;
    }
    if (!place_free(x, y + (vspeed * 2)))
    {
        vspeed = 0;
    }
    scrMoveSolidOff();
    exit;
}
else
{
    mask_index = sprBodyMask;
}
scrMoveSolidOn();
if (path_index > 0)
{
    image_speed = 0.2;
    if (alert == 0 && path_position == 1)
    {
        path_end();
    }
}
else if (image_speed < 1 && sprite_index != sprSwatAttackM16 && sprite_index != sprESwatReloadM16)
{
    image_speed = speed * 0.1;
}
scrESwatStep();
scrMoveSolidOff();
with (objEnemy)
{
    if (object_index != objDogPatrol && object_index != objEGiveUp && object_index != objEFatGiveUp)
    {
        if (object_index == objEFatGunner)
        {
            my_id = instance_create(x, y, objEFatGiveUp);
            my_id.sprite_index = sprEFatGunnerGiveUp;
            my_id.image_angle = angle;
            my_id1 = instance_create(x, y, objWeaponThrow);
            my_id1.direction = random(360);
            my_id1.image_index = 42;
            my_id1.ammo = ammo;
        }
        else if (object_index == objEnemyFat)
        {
            my_id = instance_create(x, y, objEFatGiveUp);
            my_id.image_angle = angle;
        }
        else
        {
            my_id = instance_create(x, y, objEGiveUp);
            my_id.sprite_index = sprEGiveUp;
            my_id.image_angle = angle;
            if (sprite_index == sprEWalkUnarmed || sprite_index == sprEGiveUp)
            {
                nothing = 1;
            }
            else
            {
                my_id = instance_create(x, y, objWeaponThrow);
                my_id.direction = random(360);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                my_id.ammo = ammo;
            }
        }
        instance_destroy();
    }
}
if (ammo == 0 && sprite_index != sprESwatReloadM16)
{
    image_index = 0;
    image_speed = 0.25;
    sprite_index = sprESwatReloadM16;
}
if (sprite_index == sprESwatReloadM16 && image_index > 9 && reloadammo == 0)
{
    audio_play_sound(sndGunEmpty, 0, false);
    ammo = 20;
    reloadammo = 1;
}
if (instance_exists(objPlayer) && global.notarget == 0)
{
    dist = point_distance(x, y, objPlayer.x, objPlayer.y);
    if (alert != 0)
    {
        if (dist < 70)
        {
            dir = point_direction(objPlayer.x, objPlayer.y, x, y);
            direction = dir - 180;
            if (place_free(x + lengthdir_x(1, dir), y + lengthdir_y(1, dir)))
            {
                x += lengthdir_x(1, dir);
                y += lengthdir_y(1, dir);
            }
            if (sprite_index != sprSwatAttackM16 && sprite_index != sprESwatReloadM16)
            {
                image_speed = 0.1;
            }
        }
    }
}
if (!instance_exists(objPlayer))
{
    alert = 0;
    direction = round(direction * 0.1) * 10;
    exit;
}
else if (scrIsAttacking(objPlayer.sprite_index))
{
    if (place_meeting(x - lengthdir_x(24, objPlayer.dir), y - lengthdir_y(24, objPlayer.dir), objPlayer) || place_meeting(x, y, objPlayer))
    {
        my_id = instance_create(x, y, objSwatKnockedOut);
        my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y);
        my_id.speed = 1.5;
        my_id.friction = 0.1;
        my_id.angle = my_id.direction;
        my_id.ammo = ammo;
        audio_play_sound(sndDoorHit, 0, false);
        audio_play_sound(sndPunch, 0, false);
        instance_destroy();
    }
}
