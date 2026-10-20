if (instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) < 28 && taken == 0)
{
    image_speed = 0.2;
    if (objPlayer.sprite_index != sprPWalkUnarmed)
    {
        with (objPlayer)
        {
            lastweapon = scrCurrentWeaponExt(sprite_index);
            lastammo = ammo;
            switch (global.test)
            {
                case 0:
                    global.dir = dir;
                    my_id = instance_create(x, y, objWeaponThrow);
                    with (my_id)
                    {
                        move_contact_solid(global.dir, 12);
                    }
                    audio_play_sound(sndThrow, 0, false);
                    if (decadenced == 1)
                    {
                        my_id.decadenced = 1;
                    }
                    with (objPlayerMouse)
                    {
                        decadenced = 0;
                    }
                    my_id.speed = 10;
                    my_id.direction = (dir - 5) + random(10);
                    my_id.ammo = lastammo;
                    my_id.image_index = lastweapon;
                    sprite_index = sprPWalkUnarmed;
                    release = 1;
                    break;
                case 1:
                    global.dir = dir;
                    my_id = instance_create(x, y, objWeaponThrow);
                    with (my_id)
                    {
                        move_contact_solid(global.dir, 12);
                    }
                    audio_play_sound(sndThrow, 0, false);
                    if (decadenced == 1)
                    {
                        my_id.decadenced = 1;
                    }
                    with (objPlayerMouse)
                    {
                        decadenced = 0;
                    }
                    my_id.speed = 10;
                    my_id.direction = (dir - 5) + random(10);
                    my_id.ammo = lastammo;
                    my_id.image_index = lastweapon;
                    release = 1;
                    break;
                case 2:
                    global.dir = dir + (left * -20);
                    my_id = instance_create(x, y, objThrowingWeapon);
                    with (my_id)
                    {
                        move_contact_solid(global.dir, 12);
                    }
                    audio_play_sound(sndThrow, 0, false);
                    if (decadenced == 1)
                    {
                        my_id.decadenced = 1;
                    }
                    with (objPlayerMouse)
                    {
                        decadenced = 0;
                    }
                    my_id.speed = 11;
                    my_id.direction = (dir - 5) + random(10);
                    my_id.ammo = lastammo;
                    my_id.image_index = lastweapon - 30;
                    global.usedthrow[my_id.image_index] = 1;
                    if (global.gotweapon == 0)
                    {
                        sprite_index = sprPWalkUnarmed;
                    }
                    release = 1;
                    break;
            }
        }
    }
    objPlayer.sprite_index = sprPAttackShotgun;
    objPlayer.image_index = 4;
    objPlayer.ammo = ammo;
    objPlayer.image_speed = 0.5;
    scrSetRasmusEvent(choose("Might be useful", "One shot less...", "Now its mine"), 5, 100);
    my_id = instance_create(objPlayer.x + lengthdir_x(4, objPlayer.dir - (4 * objPlayer.left)), objPlayer.y + lengthdir_y(4, objPlayer.dir - (4 * objPlayer.left)), objShell);
    my_id.sprite_index = sprShotgunShell;
    my_id.image_angle = objPlayer.dir;
    my_id.direction = (objPlayer.dir - (90 * objPlayer.left) - 20) + random(30);
    my_id.speed = 1 + random(3);
    audio_play_sound(sndPickupWeapon, 0, false);
    audio_play_sound(sndShotgunPulling, 0, false);
    objPlayer.reload = 15;
    taken = 1;
}
