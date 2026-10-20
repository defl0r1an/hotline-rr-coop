if (sprite_index == sprEInspectorGetUp)
{
    my_id = instance_create(x, y, objInspector);
}
else if (sprite_index == sprEFatGunGetUp)
{
    my_id = instance_create(x, y, objEFatGunner);
    my_id.ammo = ammo;
}
else
{
    my_id = instance_create(x, y, objEnemyFat);
}
if (hits > 0)
{
    my_id.hits = hits;
    my_id.melee = 1;
}
my_id.angle = image_angle - 180;
my_id.startx = startx;
my_id.starty = starty;
with (my_id)
{
    if (!place_free(x, y))
    {
        x = startx;
        y = starty;
    }
}
instance_destroy();
