if ((sprite_index == sprPAxeKill && image_index < 8) || (sprite_index == sprPSwordKill && image_index < 15))
{
    image_index += 0.15;
}
else
{
    my_id = instance_create(x, y, objPlayerMouse);
    if (sprite_index == sprPAxeKill)
    {
        my_id.sprite_index = sprPWalkAxe;
    }
    if (sprite_index == sprPSwordKill)
    {
        my_id.sprite_index = sprPWalkSword;
    }
    global.angle = image_angle - 180;
    my_id.reload = 10;
    with (my_id)
    {
        move_outside_solid(global.angle, 16);
    }
    my_id.maskon = global.maskon;
    my_id.maskindex = global.maskindex;
    global.done = 1;
    with (objDoorH)
    {
        solid = 0;
    }
    with (objDoorH2)
    {
        solid = 0;
    }
    my_id = instance_create(x + lengthdir_x(11, image_angle), y + lengthdir_y(11, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprBoss2AxeAndSword;
    my_id.image_angle = image_angle;
    my_id.image_index = 3;
    sxeasy_play(global.Static);
    instance_destroy();
    exit;
}
if (image_index >= 5 && bled == 0)
{
    global.blink = 1;
    bled = 1;
    hurtindex = 1;
    targetindex = 3;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    global.shake = 18;
    repeat (3 + random(3))
    {
        instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}
