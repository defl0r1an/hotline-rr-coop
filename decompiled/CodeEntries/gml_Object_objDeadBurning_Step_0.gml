time += 1;
if (image_index < 10)
{
    image_index += 0.15;
}
if (image_index > 5 && speedend == 0)
{
    speed = 0.85;
    burnspeed = 0.015;
    speedend = 1;
}
if (time >= 120 && !((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan)))
{
    my_id = instance_create(xstart + lengthdir_x(30, direction), ystart + lengthdir_y(30, direction), objBombGround);
    my_id.image_angle = groundangle;
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_speed = 0;
    my_id.sprite_index = sprite_index;
    my_id.image_index = image_index;
    my_id.image_angle = direction;
    instance_destroy();
}
