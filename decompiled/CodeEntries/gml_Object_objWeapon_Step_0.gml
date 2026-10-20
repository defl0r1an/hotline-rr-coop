hotalpha = lerp(hotalpha, 0, 0.025);
if (image_index == 26 && hotalpha > 0.2 && round(random(10)) == 1)
{
    instance_create(x, y, objSteam);
}
if (image_index == 43)
{
    my_id = instance_create(x, y, objThrowingWeaponSkippy);
    my_id.direction = direction;
    my_id.image_index = 8;
    my_id.depth = -4;
    instance_destroy();
}
