if (image_index == 0 && hurtindex == targetindex && targetindex < 8)
{
    if (targetindex == 4)
    {
        targetindex = 8;
    }
    if (targetindex == 0)
    {
        targetindex = 4;
    }
    hurtindex += 1;
    repeat (1 + random(2))
    {
        my_id = instance_create(x + lengthdir_x(18, (image_angle - 1) + random(2)), y + lengthdir_y(18, (image_angle - 1) + random(2)), objBloodSquirt);
    }
    if (room == rmTrainstationEntrance && objTrain.visible == true)
    {
        my_id.train = 1;
    }
    repeat (2)
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
}
