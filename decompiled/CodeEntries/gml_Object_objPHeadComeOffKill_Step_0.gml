if (image_index >= 4 && hat == 0)
{
    global.shake = 4;
    audio_play_sound(sndWeaponHit, 0, false);
    if (enemy == 2600 || enemy == 2601)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objWeaponThrow);
        my_id.image_index = 8;
        my_id.speed = 1 + random(2);
        my_id.direction = image_angle + random_range(-10, 10);
        if (enemy == 2601)
        {
            my_id.image_index = 28;
            my_id.direction = image_angle + -30 + random_range(-5, 5);
            my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objWeaponThrow);
            my_id.image_index = 28;
            my_id.speed = 1 + random(2);
            my_id.direction = image_angle + 30 + random_range(-5, 5);
        }
    }
    hat = 1;
}
if (image_index >= 5 && hat == 0)
{
    global.shake = 4;
    audio_play_sound(sndWeaponHit, 0, false);
    if (enemy == 2188)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objPoliceHat);
        my_id.speed = 1 + random(2);
        my_id.direction = image_angle + random_range(-10, 10);
    }
    hat = 1;
}
if (image_index >= 8 && bled == 0)
{
    hurtindex = 1;
    targetindex = 3;
    my_id = instance_create(x, y, objDeadBody);
    my_id.speed = 0.15;
    my_id.friction = 0.1;
    my_id.sprite_index = enemy;
    my_id.image_index = 8;
    my_id.image_angle = image_angle;
    my_id.direction = image_angle;
    global.shake = 8;
    global.blink = 1;
    audio_play_sound(sndHeadshot, 0, false);
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndBonesBreak, 0, false);
    repeat (5)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = image_angle + random(180);
    }
    repeat (5)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    bled = 1;
}
