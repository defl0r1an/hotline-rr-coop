if (place_meeting(x, y, objBullet) || place_meeting(x, y, objWeaponThrow))
{
    my_id = instance_create(x, y, objAquariumBreak);
    my_id.image_angle = image_angle;
    my_id = instance_create(x, y, objAquariumWater);
    my_id.image_angle = image_angle;
    audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
    global.shake = 5;
    i = 0;
    start_x = x + lengthdir_x(9, image_angle) + lengthdir_x(28, image_angle - 90);
    start_y = y + lengthdir_y(9, image_angle) + lengthdir_y(28, image_angle - 90);
    addx = lengthdir_x(3.5, image_angle + 90);
    addy = lengthdir_y(3.5, image_angle + 90);
    repeat (16)
    {
        my_id = instance_create(start_x + (addx * i), start_y + (addy * i), objShard);
        my_id.direction = point_direction(x, y, my_id.x, my_id.y);
        my_id.speed = 1 + random(1);
        i += 1;
    }
    instance_destroy();
}
if (instance_exists(objPlayer))
{
    if (scrIsAttacking(objPlayer.sprite_index) && place_meeting(x - lengthdir_x(12, objPlayer.dir), y - lengthdir_y(12, objPlayer.dir), objPlayer))
    {
        my_id = instance_create(x, y, objAquariumBreak);
        my_id.image_angle = image_angle;
        my_id = instance_create(x, y, objAquariumWater);
        my_id.image_angle = image_angle;
        audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
        global.shake = 10;
        i = 0;
        start_x = x + lengthdir_x(9, image_angle) + lengthdir_x(28, image_angle - 90);
        start_y = y + lengthdir_y(9, image_angle) + lengthdir_y(28, image_angle - 90);
        addx = lengthdir_x(3.5, image_angle + 90);
        addy = lengthdir_y(3.5, image_angle + 90);
        repeat (16)
        {
            my_id = instance_create(start_x + (addx * i), start_y + (addy * i), objShard);
            my_id.direction = point_direction(x, y, my_id.x, my_id.y);
            my_id.speed = 1 + random(1);
            i += 1;
        }
        instance_destroy();
    }
}
