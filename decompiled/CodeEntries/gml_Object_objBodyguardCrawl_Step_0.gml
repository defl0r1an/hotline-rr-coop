if (sprite_index == sprBodyguardTurn || sprite_index == sprBodyguardTurnKnife)
{
    if (image_index < 4.25)
    {
        image_index += 0.15;
    }
    else if (sprite_index == sprBodyguardTurn)
    {
        sprite_index = sprBodyguardCrawl;
    }
    else
    {
        sprite_index = sprBodyguardCrawlKnife;
    }
    exit;
}
if (speed > 0 && friction > 0)
{
    if (speed <= 0.2)
    {
        friction = 0;
        speed = 0;
    }
    exit;
}
with (objDoorH)
{
    solid = 1;
}
with (objDoorV)
{
    solid = 1;
}
with (objShootThrough)
{
    test = solid;
    solid = 1;
}
image_speed = 0.15;
speed = 0;
if (image_index > 0 && image_index < 3)
{
    speed = 0.5;
}
if (image_index > 5 && image_index < 9)
{
    speed = 0.5;
}
if (image_index > 12)
{
    speed = 0.5;
}
if (speed > 0)
{
    if (!place_free(x + lengthdir_x(16, direction), y + lengthdir_y(16, direction)))
    {
        image_angle += 4;
    }
    direction = image_angle;
}
with (objShootThrough)
{
    solid = test;
}
if (!instance_exists(objPlayer))
{
    exit;
}
if (wait > 0)
{
    wait -= 1;
}
else if (point_distance(x, y, objPlayer.x, objPlayer.y) < 12 && objPlayer.object_index == objPlayerMouse)
{
    with (objPlayer)
    {
        if (sprite_index == sprPWalkUnarmed || sprite_index == sprPWalkBag || sprite_index == sprPAttackPunch || sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackButterfly || sprite_index == sprPWalkButterfly || sprite_index == sprPJacketAttackKnuckles)
        {
            nothing = 1;
        }
        else
        {
            my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir - 90), objPlayer.y + lengthdir_y(8, objPlayer.dir - 90), objWeaponThrow);
            my_id.image_index = scrCurrentWeaponExt(sprite_index);
            my_id.direction = dir - 70 - random(40);
            my_id.speed = 1 + random(2);
            my_id.ammo = ammo;
            sprite_index = sprPWalkUnarmed;
        }
    }
    if (sprite_index == sprBodyguardCrawlKnife)
    {
        my_id = instance_create(x, y, objPKillBodyguardTKnife2);
    }
    else
    {
        my_id = instance_create(x, y, objPBodyguardBash);
    }
    my_id.maskindex = objPlayer.maskindex;
    my_id.maskon = 1;
    my_id.image_angle = image_angle;
    with (objPlayer)
    {
        if (object_index == objPlayerMouse || object_index == objPlayerController)
        {
            instance_destroy();
        }
    }
    instance_destroy();
}
