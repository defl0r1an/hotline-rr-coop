if (global.hardmode == 1)
{
    instance_destroy();
    my_id = instance_create(x, y, objEDodgerG);
    my_id.direction = irandom(360);
}
