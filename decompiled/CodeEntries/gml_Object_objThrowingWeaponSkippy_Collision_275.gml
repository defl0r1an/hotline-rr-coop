if (detonation == 1)
{
    exit;
}
destroy = 1;
if (explore == 0)
{
    my_id = instance_create(x, y, objExplosionSkippy);
    explore = 1;
}
i = 0;
repeat (4)
{
    my_id = instance_create(x, y, objBrokenWeaponSkippy);
    my_id.speed = 3 + random(2);
    my_id.direction = random(360);
    my_id.image_index = i;
    i += 1;
}
global.my_id = id;
