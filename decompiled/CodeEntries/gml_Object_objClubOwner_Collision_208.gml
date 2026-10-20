if (state == 5)
{
    global.my_id = id;
    bullets = 0;
    with (objBullet)
    {
        if (place_meeting(x, y, global.my_id))
        {
            my_id = instance_create(x, y, objBloodSmoke);
            audio_play_sound(choose(sndBulletHit1, sndBulletHit2, sndBulletHit3), 0, false);
            my_id.direction = (direction - 170) + random(10);
            my_id.speed = 1;
            my_id.image_angle = my_id.direction;
            my_id.image_xscale = 0.8 + random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            if (caliber == 0)
            {
                instance_destroy();
            }
            else
            {
                global.my_id.bullets += 5;
            }
            global.my_id.bullets += 1;
        }
    }
    edir = other.direction;
    instance_create((x + lengthdir_x(24, image_angle)) - 32, (y + lengthdir_y(24, image_angle)) - 32, objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle - 180;
    my_id.sprite_index = sprEClubOwnerDead;
    my_id.direction = direction;
    if (bullets > 3)
    {
        my_id.image_index = 1;
    }
    else
    {
        my_id.image_index = 0;
    }
    if (my_id.image_index == 0)
    {
        audio_play_sound(sndHeadshot, 0, false);
        repeat (8)
        {
            instance_create(((x + lengthdir_x(21, image_angle)) - 32) + random(2), ((y + lengthdir_y(21, image_angle)) - 32) + random(2), objBloodSquirt);
        }
        repeat (12)
        {
            my_id = instance_create(((x + lengthdir_x(21, image_angle)) - 32) + random(2), ((y + lengthdir_y(21, image_angle)) - 32) + random(2), objBloodSmoke);
            my_id.direction = random(360);
            my_id.speed = random(3);
            my_id.image_angle = my_id.direction;
        }
    }
    else
    {
        repeat (2 * bullets)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
            my_id.sprite_index = sprBloodSplatSmall;
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(4);
        }
        repeat (1 + random(bullets))
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = 1 + random(5);
        }
        repeat (bullets)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, edir), (y - 3) + random(6) + lengthdir_y(16, edir), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = (edir - 20) + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
        }
    }
    if (global.done == 0)
    {
        instance_create(x, y, objLevelComplete);
    }
    global.done = 1;
    instance_destroy();
}
