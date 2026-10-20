flame += 0.05;
light = lerp(light, 0, 0.025);
if (round(random(flame)) == 1)
{
    my_id = instance_create((x + lengthdir_x(random_range(-15, 15), image_angle)) - lengthdir_x(random(10), image_angle - (90 * choose(-1, 1))), (y + lengthdir_y(random_range(-15, 15), image_angle)) - lengthdir_y(random(10), image_angle - (90 * choose(-1, 1))), objFireBall);
    my_id.direction = dir - random_range(15, -15);
    my_id.friction = 0.1;
    my_id.speed = 2 - random_range(1, -1);
}
if (round(random(flame)) <= 1)
{
    my_id = instance_create((x + lengthdir_x(random_range(-15, 15), image_angle)) - lengthdir_x(random(10), image_angle - (90 * choose(-1, 1))), (y + lengthdir_y(random_range(-15, 15), image_angle)) - lengthdir_y(random(10), image_angle - (90 * choose(-1, 1))), objFlameSmoke);
    my_id.direction = dir - random_range(15, -15);
    my_id.image_angle = my_id.direction;
    my_id.speed = 3 + random(0.5);
}
