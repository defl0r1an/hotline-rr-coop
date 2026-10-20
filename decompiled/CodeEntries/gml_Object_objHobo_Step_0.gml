if (global.xbox == 1)
{
    scrXboxRestart();
}
if (keyboard_check_pressed(ord(global.restartkey)))
{
    event_perform(ev_keypress, ord("R"));
}
if (state == 0)
{
    if (objEffector.amount >= 180)
    {
        if (instance_exists(objPlayerMouse))
        {
            with (objPlayerMouse)
            {
                my_id = instance_create(x, y, objPlayerMouseHouse);
                my_id.active = 0;
                my_id.sprite_index = sprite_index;
                my_id.ammo = ammo;
                global.maskon = 1;
                my_id.maskon = 1;
                instance_destroy();
            }
        }
        sxeasy_play(global.Release);
        scrGetMessage(0);
        state = 1;
        test = objPlayer.persistent;
        objPlayer.persistent = false;
        global.loaded = 1;
        global.loaded = 0;
        objPlayer.persistent = test;
    }
}
if (state == 1)
{
    if (!instance_exists(objPhoneConversation))
    {
        state = 2;
        with (objPlayer)
        {
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.active = 0;
            my_id.sprite_index = sprPWalkUnarmed;
            my_id.ammo = ammo;
            my_id.maskon = 1;
            my_id.maskindex = global.maskindex;
            instance_destroy();
        }
    }
}
if (instance_exists(objPlayer))
{
    global.test = 0;
    with (objPlayer)
    {
        if (place_meeting(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), objHobo))
        {
            if (sprite_index == sprPAttackPunch || sprite_index == sprPPushing)
            {
                global.test = 2;
            }
            if (sprite_index == sprPAttackBat || sprite_index == sprPJacketAttackKnuckles || (global.maskindex == 11 && global.hardmode == 1) || global.maskindex == 27)
            {
                global.test = 1;
            }
        }
    }
    if (global.test == 1)
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
        global.bigballs = 0;
        my_id = instance_create(x, y, objDeadBody);
        if (instance_exists(objPlayer))
        {
            my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y);
        }
        my_id.speed = 2;
        my_id.image_angle = my_id.direction;
        my_id.sprite_index = sprHoboDeadBlunt;
        if (global.maskindex == 11 && instance_exists(objPlayer))
        {
            if (sprite_index == sprHoboWalkBat || sprite_index == sprHoboAttack)
            {
                objPlayerMouse.sprite_index = sprPWalkBat;
                objPlayerMouse.ammo = 0;
            }
            if (sprite_index == sprHoboWalkDoubleBarrel || sprite_index == sprHoboAttackDoubleBarrel1 || sprite_index == sprHoboAttackDoubleBarrel2)
            {
                objPlayerMouse.sprite_index = sprPWalkDoubleBarrel;
                objPlayerMouse.ammo = ammo;
            }
        }
        else if (sprite_index != sprHoboWalk)
        {
            my_id = instance_create(x, y, objWeaponThrow);
            if (instance_exists(objVan))
            {
                my_id.decadenced = 1;
            }
            my_id.image_index = scrCurrentWeaponExt(sprite_index);
            my_id.direction = (other.direction - 70) + random(40);
            my_id.speed = 2 + random(2);
            my_id.ammo = ammo;
        }
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndPunch, 0, false);
        audio_play_sound(sndBonesBreak, 0, false);
        instance_create(x, y, objLevelComplete);
        global.done = 1;
        with (objPlayerMouse)
        {
            if (global.maskindex != 22)
            {
                alarm[2] = 125;
            }
        }
        instance_destroy();
    }
    if (global.test == 2)
    {
        my_id = instance_create(x, y, objHoboKnockedOut);
        my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y);
        my_id.speed = 2;
        my_id.image_angle = my_id.direction;
        if (global.maskindex == 11 && instance_exists(objPlayer))
        {
            if (sprite_index == sprHoboWalkBat || sprite_index == sprHoboAttack)
            {
                objPlayerMouse.sprite_index = sprPWalkBat;
                objPlayerMouse.ammo = 0;
            }
            if (sprite_index == sprHoboWalkDoubleBarrel || sprite_index == sprHoboAttackDoubleBarrel1 || sprite_index == sprHoboAttackDoubleBarrel2)
            {
                objPlayerMouse.sprite_index = sprPWalkDoubleBarrel;
                objPlayerMouse.ammo = ammo;
            }
        }
        else if (sprite_index != sprHoboWalk)
        {
            my_id = instance_create(x, y, objWeaponThrow);
            if (instance_exists(objVan))
            {
                my_id.decadenced = 1;
            }
            my_id.image_index = scrCurrentWeaponExt(sprite_index);
            my_id.direction = (other.direction - 70) + random(40);
            my_id.speed = 2 + random(2);
            my_id.ammo = ammo;
        }
        audio_play_sound(sndPunch, 0, false);
        instance_destroy();
    }
}
else
{
    speed = 0;
    if (sprite_index == sprHoboWalk || sprite_index == sprHoboWalkDoubleBarrel)
    {
        image_speed = 0;
    }
    exit;
}
scrMoveSolidOn();
if (reload > 0)
{
    reload -= 1;
}
if (sprite_index == sprHoboWalk)
{
    nothing = 0;
}
else
{
    global.factor += sign(alert);
}
if (path_index > 0)
{
    if (image_speed < 0.2)
    {
        image_speed = 0.2;
    }
    if (alert == 0 && path_position == 1)
    {
        path_end();
    }
}
else if (image_speed < 1)
{
    image_speed = speed * 0.1;
}
if (scrIsAttacking(sprite_index) && !instance_exists(objPlayerDead))
{
    angle = direction;
    image_speed = 0.5;
    if (place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objPlayer) || place_meeting(x, y, objPlayer))
    {
        global.my_id = id;
        global.sprite = sprite_index;
        with (objPlayer)
        {
            scrPlayerDieMelee();
        }
        speed = 0;
    }
}
scrHoboStep();
scrMoveSolidOff();
if (sprite_index == sprHoboWalkDoubleBarrel || sprite_index == sprHoboAttackDoubleBarrel1 || sprite_index == sprHoboAttackDoubleBarrel2)
{
    scrStayAwayFromPlayer();
}
