image_angle = 100 - random(20);
if (global.hardmode == 1)
{
    instance_destroy();
    my_id = instance_create(x, y, objEDodgerG);
}
