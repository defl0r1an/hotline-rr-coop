image_speed = 0;
index = 0;
image_xscale = 0.9;
image_yscale = image_xscale;
angle = random(360);
repeat (30)
{
    my_id = instance_create(x, y, objFlameParticle);
    my_id.direction = random(360);
    my_id.speed = 2 + random(3);
    my_id.friction = 0.15;
}
light = 30;
with (objEnemy)
{
    if (object_index != objEnemyFat && object_index != objEFatGunner)
    {
        scrEPatrolInit();
    }
    if (object_index == objEDodgerGPatrol)
    {
        path = path_add();
        path_set_closed(path, 0);
    }
    if (object_index == objEnemyFat || object_index == objEFatGunner)
    {
        if (sprite_index != sprEFatDie && sprite_index != sprEFatGunDie)
        {
            scrEFatInit();
            path = path_add();
            path_set_kind(path, 1);
            path_set_precision(path, 2);
        }
    }
}
