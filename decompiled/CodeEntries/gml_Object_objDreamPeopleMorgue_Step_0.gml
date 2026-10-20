if (sprite_index == sprEWalkUnarmed && visible == true)
{
    if (image_speed < 1)
    {
        image_speed = speed * 0.1;
    }
    if (point_distance(x, y, 368, 2808) > 1 && stage == "Walk")
    {
        global.my_id = id;
        move_towards_point(368, 2808, speed);
        speed = 0.45;
    }
    else if (alarm[0] == -1)
    {
        global.my_id = 367;
        image_index = 0;
        stage = "Stop";
        speed = 0;
        alarm[0] = 140;
    }
}
if (sprite_index != sprEWalkUnarmed && visible == true)
{
    _diff = angle_difference(point_direction(x, y, global.my_id.x, global.my_id.y), image_angle);
    image_angle += (_diff * 0.1);
}
