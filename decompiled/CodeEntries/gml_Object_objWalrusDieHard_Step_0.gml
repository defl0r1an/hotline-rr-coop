if (state < 2)
{
    if (image_index < 8)
    {
        image_index += 0.125;
    }
    else
    {
        my_id = instance_create(x, y, objBloodPool);
        state = 888;
    }
}
if (image_index >= 6 && state == 0)
{
    state = 1;
    my_id = instance_create(x, y, objSecretMask);
    my_id.sprite_index = sprMasksHard;
    my_id.image_index = 21;
    my_id.image_angle = 270;
    my_id.direction = 270;
    my_id.speed = 2.5;
    my_id.friction = 0.1;
}
