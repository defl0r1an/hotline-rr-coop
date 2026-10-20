scrMoveSolidOn();
if (image_speed < 1 && sprite_index == sprDoctorWalk)
{
    image_speed = speed * 0.1;
}
if (!place_free(x, y))
{
    tempdir = direction;
    for (i = 1; !place_free(x + lengthdir_x(4 + (i / 20), tempdir), y + lengthdir_y(4 + (i / 20), tempdir)) && i < 100; i += 1)
    {
        tempdir += 18;
    }
    if (i < 100)
    {
        move_outside_solid(tempdir, 4 + (i / 20));
    }
}
scrDPatrolStep();
scrMoveSolidOff();
if (!instance_exists(objPlayer))
{
    alert = 0;
    direction = round(direction * 0.1) * 10;
    exit;
}
