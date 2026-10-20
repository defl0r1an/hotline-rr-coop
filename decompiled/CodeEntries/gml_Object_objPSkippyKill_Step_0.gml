if (image_index >= 10 && bled == 0)
{
    global.BuffSkippy += 0.05;
    global.DebuffSkippy = 1;
    global.soundDebuff = 0;
    global.shake = 8 + round(global.BuffSkippy);
    scrMuzzle(x + lengthdir_x(10, image_angle - 1), y + lengthdir_y(10, image_angle - 1), image_angle + 30, 2122, 1, 1);
    if (enemy == 2134)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objPoliceHat);
        my_id.speed = 1 + random(2);
        my_id.direction = image_angle + random_range(-10, 10);
    }
    my_id = instance_create(x + lengthdir_x(16, image_angle - 7 - 4), y + lengthdir_y(16, image_angle - 7 - 4), objShellSkippy);
    my_id.image_angle = image_angle;
    my_id.direction = (image_angle - 80) + random(20);
    my_id.speed = 2 + random(2);
    scrHearPlayer();
    hurtindex = 1;
    targetindex = 3;
    my_id = instance_create(x, y, objDeadBody);
    my_id.speed = 1.5;
    my_id.friction = 0.1;
    my_id.sprite_index = enemy;
    my_id.image_index = 10;
    my_id.image_angle = image_angle;
    my_id.direction = image_angle;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndSkippyMedium, 0, false);
    repeat (3)
    {
        instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (7)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    i = 0;
    repeat (5)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBrainChunk2);
        my_id.direction = image_angle + 20 + i + random_range(3, -3);
        my_id.speed = 2 + random(1);
        my_id.image_angle = my_id.direction;
        i += 10;
    }
    i = 0;
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objSkinPiece2);
        my_id.image_xscale = 0.75;
        my_id.image_yscale = 0.75;
        my_id.direction = image_angle + 20 + i + random_range(3, -3);
        my_id.speed = 2 + random(0.5);
        my_id.image_angle = my_id.direction;
        i += 10;
    }
    ammo -= 0.5;
    bled = 1;
}
if (bled == 0)
{
    if (global.DebuffSkippy <= 0.5)
    {
        image_speed = lerp(image_speed, 0.2, 0.05);
    }
    else
    {
        image_speed = 0;
    }
}
