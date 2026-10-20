if (global.hardmode == 1)
{
    my_id = instance_create(x, y, objEnemyStationary);
    my_id.sprite_index = sprEWalkDoubleBarrel;
    my_id.ammo = 2;
}
