scrMoveSolidOn();
if (!place_free(x, y))
{
    if (speed > 0)
    {
        move_outside_solid(direction - 180, 8);
    }
    else if (place_free(x + lengthdir_x(7, direction - 180), y + lengthdir_y(7, direction - 180)))
    {
        dir = direction;
        direction = round(direction * 0.011111111111111112) * 90;
        if (place_free(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction)))
        {
            direction = dir;
        }
    }
    speed = 0;
}
else if (!place_free(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction)))
{
    move_contact_solid(direction, 8);
    dir = direction;
    direction = round(direction * 0.011111111111111112) * 90;
    if (place_free(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction)))
    {
        direction = dir;
    }
}
scrMoveSolidOff();
if (speed == 0)
{
    if (reload > 0)
    {
        reload -= 1;
    }
    else
    {
        image_speed = 0.2;
    }
}
