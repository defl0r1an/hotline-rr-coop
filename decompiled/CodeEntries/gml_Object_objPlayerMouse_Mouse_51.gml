if (sprite_index == sprGriffinWalk)
{
    audio_play_sound(snd9mm, 0, false);
    scrHearPlayer();
    ammo -= 1;
    reload = 10;
    global.shake = 10;
    if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objSolid) || place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objDoorV))
    {
        my_id = instance_create(x, y, objSmokeHit);
        my_id.image_angle = image_angle;
        global.dir = dir;
        with (my_id)
        {
            move_contact_solid(global.dir, 16);
        }
    }
    else
    {
        my_id = instance_create(x + lengthdir_x(20, dir - 7), y + lengthdir_y(20, dir - 7), objBullet);
        if (instance_exists(my_id))
        {
            my_id.direction = ((griffinaccuracy + dir) - 3) + random(6);
            my_id.speed = 16;
            my_id.image_angle = my_id.direction;
        }
    }
    my_id = instance_create(x + lengthdir_x(16, dir - 7 - (4 * left)), y + lengthdir_y(16, dir - 7 - (4 * left)), objShell);
    my_id.sprite_index = sprUziShell;
    my_id.image_angle = dir;
    my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
    my_id.speed = 1 + random(3);
    sprite_index = sprGriffinAttack9mm;
    image_speed = griffinspd + 0.5;
    image_index = 0;
    light = 12;
}
else
{
    if (global.xbox == 1)
    {
        exit;
    }
    if (sprite_index == sprPWalkSkippy && global.powerIgel == 0 && global.deadIgel == 0 && ammo >= 1)
    {
        image_index = 0;
        sprite_index = sprPStartSkippyAim;
        image_speed = 0.175;
    }
    if (sprite_index == sprPWalkUnarmed && global.powerIgel == 1 && global.maskindex == 27 && reload <= 0)
    {
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        sprite_index = sprPPushing;
        image_index = 0;
        image_speed = 0.35;
        reload = 10;
        global.shake = 2;
        impact = 3;
        impside = 8;
    }
    if (release < 20)
    {
        release += 1;
    }
    else
    {
        scrPlayerPickUp2();
    }
}
