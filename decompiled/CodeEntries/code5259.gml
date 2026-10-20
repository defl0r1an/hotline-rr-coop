if (image_index < 18)
{
    image_index += 0.2;
}
if (image_index == 3 && bled == 0)
{
    repeat (4)
    {
        instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2) + 18, objBloodSquirt);
    }
    repeat (2)
    {
        my_id = instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2) + 18, objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    bled = 1;
}
if (image_index == 18 && pool == 0)
{
    instance_create(x + lengthdir_x(18, image_angle), y + lengthdir_y(18, image_angle) + 18, objBloodPool);
    pool = 1;
}
if (!event)
{
    if (point_distance(x, y, global.mousex, global.mousey) < 100 && global.hardmodemasks[2] == 0)
    {
        scrSetRasmusEvent(choose("Shoot!", "Now!"), 10, 100, "mystical");
        event = 1;
    }
}
