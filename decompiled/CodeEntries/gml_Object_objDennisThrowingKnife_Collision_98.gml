if (speed <= 0)
{
    global.knives += 1;
    instance_destroy();
    audio_play_sound(sndPickupWeapon, 0, false);
}
else if (enemy == 1)
{
    global.my_id = id;
    with (objPlayer)
    {
        global.shake = 3;
        edir = other.direction;
        repeat (3 + round(random(1)))
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
            my_id.sprite_index = sprBloodSplatSmall;
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(4);
        }
        repeat (2)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = 1 + random(5);
        }
        repeat (2 + round(random(2)))
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, edir), (y - 3) + random(6) + lengthdir_y(16, edir), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = (edir - 20) + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
        }
        my_id = instance_create(x, y, objPlayerDead);
        my_id.sprite_index = sprPBackNinjaKnife;
        my_id.image_angle = global.my_id.direction;
        my_id.direction = my_id.image_angle;
        my_id.speed = 1.5 + random(1);
        audio_play_sound(sndCut1, 0, false);
        instance_destroy();
    }
    instance_destroy();
}
