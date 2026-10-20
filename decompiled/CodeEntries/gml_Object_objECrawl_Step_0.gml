if (time > 0)
{
    time--;
}
else
{
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprite_index;
    my_id.image_index = image_index;
    instance_destroy();
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
    bloodsled -= 1;
    if (bloodsled == 0)
    {
        my_id = instance_create(x, y, objBloodSled);
        my_id.image_angle = direction;
        my_id.image_index = round(random(2));
        bloodsled = 13;
    }
}
with (objShootThrough)
{
    solid = test;
}
if (!instance_exists(objPlayer))
{
    exit;
}
if (global.maskindex == 27 && global.powerIgel == 0)
{
    exit;
}
if (point_distance(x, y, objPlayer.x, objPlayer.y) < 12 && objPlayer.object_index == objPlayerMouse)
{
    kill = 0;
    if (global.xbox == 1)
    {
        kill = checkbutton(0, getid(11));
    }
    else
    {
        kill = keyboard_check(vk_space);
    }
    if (kill)
    {
        with (objPlayer)
        {
            global.executionx = x;
            global.executiony = y;
            if (sprite_index == sprPWalkUnarmed || sprite_index == sprPWalkBag || ((sprite_index == sprPWalkChainsaw || sprite_index == sprPAttackChainsaw) && objPlayer.ammo > 0) || sprite_index == sprPJacketKillDog || sprite_index == sprPJacketAttackKnuckles)
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
        if ((objPlayer.sprite_index == sprPWalkChainsaw || objPlayer.sprite_index == sprPAttackChainsaw) && objPlayer.ammo > 0)
        {
            my_id = instance_create(x, y, objPKillChainsawNeck);
            if (sprite_index == sprEPoliceCrawl)
            {
                my_id.sprite = 2515;
            }
            my_id.ammo = objPlayer.ammo - 5;
            my_id.image_angle = image_angle;
        }
        else
        {
            my_id = instance_create(x, y, objPAttackSnap);
            if (objPlayer.sprite_index == sprPWalkBag || objPlayer.sprite_index == sprPAttackBag)
            {
                my_id.bag = 1;
            }
            if (sprite_index == sprEPoliceCrawl)
            {
                my_id.sprite = 2210;
            }
            my_id.maskindex = objPlayer.maskindex;
            my_id.maskon = 1;
            my_id.image_angle = image_angle;
        }
        with (objPlayer)
        {
            if (object_index == objPlayerMouse || object_index == objPlayerController)
            {
                instance_destroy();
            }
        }
        instance_destroy();
    }
}
