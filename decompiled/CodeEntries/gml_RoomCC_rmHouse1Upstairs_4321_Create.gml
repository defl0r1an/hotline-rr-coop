if (global.hardmode == 1)
{
    instance_destroy();
    my_id = instance_create(x, y, objGlassPanelV);
    my_id.x = x - 5;
}
