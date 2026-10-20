if (image_index >= 5)
{
    exit;
}
global.my_id = id;
with (other.id)
{
    if (collision_circle(x, y, 10, objExplosionSkippy, 0, 1))
    {
        scrExplosionDie(1191, 0, 0, 0);
    }
}
