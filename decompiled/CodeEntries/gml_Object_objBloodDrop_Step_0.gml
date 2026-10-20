image_index = speed * 2;
if (speed <= 0 || !place_free(x, y))
{
    bloodindex = round(random(2));
    if (bloodindex == 1)
    {
        my_id = instance_create(x, y, objBloodSplat);
        my_id.image_xscale = 1;
        my_id.image_yscale = 1;
        my_id.image_angle = image_angle;
        my_id.surface = surface;
        instance_destroy();
    }
    if (bloodindex == 0 || bloodindex == 2)
    {
        my_id = instance_create(x, y, objBloodSmudge);
        my_id.image_xscale = 1;
        my_id.image_yscale = 1;
        my_id.image_angle = image_angle;
        my_id.surface = surface;
        instance_destroy();
    }
}
if (AIDS == 0)
{
    AIDS = speed;
}
else
{
    speed = AIDS;
    AIDS -= 0.2;
}
