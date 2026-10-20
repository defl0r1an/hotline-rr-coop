if (global.hardmode == 0)
{
    instance_destroy();
    my_id = instance_create(x, y, objEDodger);
    my_id.direction = irandom(360);
}
