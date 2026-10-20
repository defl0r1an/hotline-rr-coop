repeat (1 + round(random(2)))
{
    my_id = instance_create(x + lengthdir_x(10, direction), y, objFireBall);
    my_id.direction = random(360);
    my_id.image_angle = random(360);
    my_id.speed = 2 + random(0.5);
}
repeat (2 + round(random(3)))
{
    my_id = instance_create(x + lengthdir_x(10, direction), y, objFlameSmoke);
    my_id.direction = random(360);
    my_id.image_angle = my_id.direction;
    my_id.speed = 2.75 + random(0.75);
}
instance_destroy();
