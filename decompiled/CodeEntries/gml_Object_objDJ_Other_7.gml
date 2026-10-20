if (sprite_index == sprDJSmoking)
{
    image_speed = 0;
    my_id = instance_create(x + lengthdir_x(4, image_angle), y + lengthdir_y(4, image_angle), objSmokeExhale);
    my_id.image_angle = my_id.direction - random_range(6, -6) - -90;
    my_id.direction = my_id.image_angle;
    my_id.speed = 0.35 - random_range(0.1, -0.1);
    my_id.depth = -1;
}
