if (!place_free(x, y))
{
    my_id = instance_create(x, y, objBloodSplat);
    my_id.surface = surface;
    instance_destroy();
}
