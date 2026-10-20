sprite_index = sprEWalkM16;
if (global.hardmode == 1)
{
    instance_destroy();
    my_id = instance_create(x, y, objEDodger);
}
