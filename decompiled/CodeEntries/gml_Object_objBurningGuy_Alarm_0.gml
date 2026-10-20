if (mysprite == -1)
{
    my_id = instance_create(x, y, objDeadBurning);
    my_id.direction = direction;
    my_id.alpha = alpha + 1.25;
    my_id.color = color;
}
else
{
    my_id = instance_create(x, y, objDeadBody);
    my_id.direction = direction;
    my_id.image_angle = my_id.direction;
    my_id.speed = 1.5 + random(0.5);
    my_id.sled = 0;
    if (mysprite == 2433)
    {
        my_id.sprite_index = choose(sprEBurn1, sprEBurn2, sprEBurn3);
    }
    if (mysprite == 2297)
    {
        my_id.sprite_index = choose(sprEPoliceBurn1, sprEPoliceBurn2, sprEPoliceBurn3);
    }
    my_id.image_speed = 0.15;
}
instance_destroy();
