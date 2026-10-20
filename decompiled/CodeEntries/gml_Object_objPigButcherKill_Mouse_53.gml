if (global.xbox == 1)
{
    exit;
}
if (image_index == 0 && hurtindex == targetindex && targetindex < 11)
{
    if (targetindex == 8)
    {
        targetindex = 11;
        global.blink = 1;
        global.shake = 7;
    }
    if (targetindex == 4)
    {
        targetindex = 8;
        global.blink = 0.4;
        global.shake = 4;
    }
    if (targetindex == 0)
    {
        targetindex = 4;
        global.blink = 0.2;
        global.shake = 2;
    }
    hurtindex += 1;
    image_index = 7;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    if (bottom == 1348 && hurtindex == 1)
    {
        my_id1 = instance_create(((x + lengthdir_x(17, image_angle)) - 1) + random(2), ((y + lengthdir_y(17, image_angle)) - 1) + random(2), objPoliceHat);
        my_id1.speed = 1 + random(2);
        my_id1.direction = image_angle + random_range(-10, 10);
    }
    global.shake = 10;
    repeat (1 + random(3))
    {
        my_id = instance_create(x + lengthdir_x(18, (image_angle - 1) + random(2)), y + lengthdir_y(18, (image_angle - 1) + random(2)), objBloodSquirt);
    }
    if (room == rmTrainstationEntrance && objTrain.visible == true)
    {
        my_id.train = 1;
    }
    repeat (4)
    {
        my_id = instance_create(x + lengthdir_x(18, image_angle), y + lengthdir_y(18, image_angle), objBloodSmoke);
        my_id.direction = random(360);
        my_id.image_angle = my_id.direction;
        my_id.speed = random(2);
        if (room == rmTrainstationEntrance && objTrain.visible == true)
        {
            my_id.train = 1;
        }
    }
    if (targetindex == 11)
    {
        global.shake = 13;
        repeat (4)
        {
            my_id = instance_create(((x + lengthdir_x(22, image_angle)) - 2) + random(4), ((y + lengthdir_y(22, image_angle)) - 2) + random(4), objBloodSmoke);
            my_id.direction = point_direction(x, y, my_id.x, my_id.y);
            my_id.image_angle = random(360);
            my_id.speed = random(1);
            if (room == rmTrainstationEntrance && objTrain.visible == true)
            {
                my_id.train = 1;
            }
        }
        repeat (3 + random(2))
        {
            my_id = instance_create(((x + lengthdir_x(22, image_angle)) - 2) + random(4), ((y + lengthdir_y(22, image_angle)) - 2) + random(4), objBrainChunk2);
            my_id.direction = point_direction(x, y, my_id.x, my_id.y);
            my_id.image_angle = random(360);
            my_id.speed = 1.5 + random(1);
        }
    }
}
