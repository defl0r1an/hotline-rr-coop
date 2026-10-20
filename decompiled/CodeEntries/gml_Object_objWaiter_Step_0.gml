if (global.deadIgel == 1)
{
    if (instance_exists(objPlayer))
    {
        _diff = angle_difference(point_direction(x, y, objPlayer.x, objPlayer.y), direction);
        direction += (_diff * 0.1);
    }
    image_index = 0;
    speed = 0;
    exit;
}
if (global.hardmode == 1 && (global.maskindex == 2 || global.maskindex == 6))
{
    instance_destroy();
    instance_create(x, y, objEnemy);
}
scrMoveSolidOn();
with (objDoorV)
{
    test = solid;
    solid = 1;
}
if (!place_free(x + (hspeed * 4), y))
{
    hspeed = -hspeed;
}
if (!place_free(x, y + vspeed))
{
    vspeed = -vspeed;
}
with (objDoorV)
{
    solid = test;
}
scrMoveSolidOff();
global.test = 0;
global.my_id = id;
if (!instance_exists(objPlayer))
{
    exit;
}
with (objPlayer)
{
    if (scrIsAttacking(objPlayer.sprite_index) || sprite_index == sprPAttackPunch || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPAttackBat || sprite_index == sprPAttackNightStick || sprite_index == sprPAttackClub || sprite_index == sprPAttackPipe || sprite_index == sprPAttackCrowbar || sprite_index == sprPAttackBag || (sprite_index == sprPAttackPunch && global.maskindex == 2))
    {
        if (place_meeting(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), global.my_id))
        {
            global.test = 1;
        }
    }
    if (sprite_index == sprPAttackSword || sprite_index == sprPAttackButterfly || sprite_index == sprPAttackKnife || sprite_index == sprPAttackChainsaw || sprite_index == sprPSprintChainsaw)
    {
        if (place_meeting(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), global.my_id))
        {
            global.test = 2;
        }
    }
}
if (global.test > 0)
{
    if (global.test == 1 || global.test == 2)
    {
        pdir = point_direction(objPlayer.x, objPlayer.y, x, y);
        repeat (8)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.sprite_index = sprBloodSplatSmall;
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(4);
        }
        repeat (2 + random(3))
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = 1 + random(5);
        }
        repeat (4)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, pdir), (y - 3) + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = (pdir - 20) + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
        }
        my_id = instance_create(x, y, objDeadBody);
        my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y);
        my_id.speed = 2;
        if (global.test == 1)
        {
            my_id.sprite_index = sprEWaiterDeadBlunt;
        }
        else
        {
            audio_play_sound(choose(sndCut1, sndCut2), 0, false);
            my_id.sprite_index = sprEWaiterDeadCut;
        }
        my_id.image_index = floor(random(3));
        my_id.image_angle = my_id.direction;
        audio_play_sound(sndPunch, 0, false);
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndBonesBreak, 0, false);
        if (global.maskindex != 11 || (global.maskindex == 11 && instance_exists(objPlayer) && objPlayer.sprite_index != sprPAttackPunch))
        {
            my_id = instance_create(x, y, objWeaponThrow);
            if (instance_exists(objVan))
            {
                my_id.decadenced = 1;
            }
            my_id.direction = (direction - 70) + random(40);
            my_id.speed = 2 + random(2);
            my_id.image_index = 9;
            my_id.ammo = ammo;
        }
        if (instance_exists(objPlayer) && global.maskindex == 11 && objPlayer.sprite_index == sprPAttackPunch)
        {
            objPlayer.sprite_index = sprPWalkUzi;
            objPlayer.ammo = floor(ammo / 2);
            objPlayer.image_speed = 0;
            objPlayer.prevsprite = objPlayer.sprite_index;
        }
    }
    instance_destroy();
}
if (sprite_index == sprWaiterWalkUzi)
{
    speed = 0;
    image_speed = 0;
    global.check = scrLook(objPlayer.x, objPlayer.y, 4);
    if (global.check == 0 || global.check == 2)
    {
        direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
        if (reload > 0)
        {
            reload -= 1;
        }
        else if (ammo > 0)
        {
            ammo -= 1;
            scrMuzzle(x + lengthdir_x(28, direction - 1), y + lengthdir_y(28, direction - 1), direction, 2002, 1, 1);
            my_id = instance_create(x + lengthdir_x(24, direction), y + lengthdir_y(24, direction), objEBullet);
            my_id.direction = (direction - 5) + random(10);
            if (global.hardmode == 0)
            {
                my_id.speed = 12;
                reload = 4;
            }
            else
            {
                my_id.speed = 16;
                reload = 3;
            }
            my_id.image_angle = my_id.direction;
            with (objEffector)
            {
                uzisnd = 1;
            }
        }
        else if (ammo <= 0)
        {
            sprite_index = sprEWaiterReloadUzi;
            image_index = 0;
            image_speed = 0.25;
        }
    }
    exit;
}
if (sprite_index == sprEWaiterReloadUzi && image_index == 10)
{
    my_id2 = instance_create(x + lengthdir_x(5, image_angle - (5 * image_yscale)), y + lengthdir_y(5, image_angle - (5 * image_yscale)), objClip);
    my_id2.sprite_index = sprM16Mag;
    my_id2.image_angle = image_angle;
    my_id2.direction = (direction * -1) + random(30);
    my_id2.speed = random_range(1, 2);
}
if (checkreload > 0)
{
    checkreload -= 1;
}
else
{
    checkreload = 30;
    global.check = scrLook(objPlayer.x, objPlayer.y, 4);
    if (global.check == 0 || global.check == 2)
    {
        if (sprite_index == sprWaiterWalkWine)
        {
            sprite_index = sprWaiterWalkUzi;
            my_id = instance_create(x + lengthdir_x(7, direction - 65), y + lengthdir_y(7, direction - 65), objWineBottle);
            my_id.direction = direction - 65;
            my_id.speed = 2;
            my_id.friction = 0.1;
            my_id.image_angle = image_angle;
            audio_play_sound(sndPickupWeapon, 0, false);
        }
        if (sprite_index == sprWaiterWalkFood)
        {
            sprite_index = sprWaiterWalkUzi;
            my_id = instance_create(x + lengthdir_x(7, direction - 65), y + lengthdir_y(7, direction - 65), objFoodTray);
            my_id.direction = direction - 65;
            my_id.speed = 2;
            my_id.friction = 0.1;
            my_id.image_angle = image_angle;
            audio_play_sound(sndPickupWeapon, 0, false);
        }
    }
}
