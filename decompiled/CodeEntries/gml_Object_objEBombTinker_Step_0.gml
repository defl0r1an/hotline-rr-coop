if (state != 3)
{
    image_index += 0.1;
}
if (!place_free(x, y))
{
    if (speed > 0)
    {
        instance_create(x, y, objBloodPool);
    }
    speed = 0;
}
if (timer > 0 && sprite_index != sprExplodedBody2 && global.hardmode == 1)
{
    timer -= 1;
}
if (timer == 0 && image_index > 6 && state == 0)
{
    y += 1;
    sprite_index = sprEBombTinkerStandUp;
    image_index = 0;
    image_angle = -180;
    state = 1;
}
if (image_index > 4 && sprite_index == sprEBombTinkerStandUp)
{
    sprite_index = sprEWalkUnarmed;
    image_index = 0;
    state = 2;
}
if (state == 2)
{
    lastx = x;
    lasty = y;
    if (x < 256)
    {
        x += 1;
    }
    else
    {
        state = 3;
    }
    image_angle = 0;
    angle = -180;
    stop = 1;
}
if (state == 3)
{
    if (image_angle < 180)
    {
        image_angle += 5;
    }
    else
    {
        state = 4;
    }
}
if (state == 4)
{
    instance_create(x, y, objMafiaKill);
    instance_destroy();
}
