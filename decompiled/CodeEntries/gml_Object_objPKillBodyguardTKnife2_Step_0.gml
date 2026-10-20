if (image_index < 7)
{
    image_index += 0.15;
}
else
{
    global.myx = x + lengthdir_x(20, image_angle);
    global.myy = y + lengthdir_y(24, image_angle);
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(200 + (400 * (global.factor - 1))) + "pts";
    global.myscore += (200 + (400 * (global.factor - 1)));
    my_id = instance_create(global.myx, global.myy, objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprBodyguardDeadKnife;
    my_id.image_index = floor(random(4));
    my_id.image_angle = image_angle;
    if (global.controller == 1)
    {
        my_id = instance_create(x, y, objPlayerController);
    }
    else
    {
        my_id = instance_create(x, y, objPlayerMouse);
    }
    my_id.sprite_index = sprPWalkButterfly;
    my_id.reload = 30;
    instance_destroy();
}
if (image_index > 4 && bled == 0)
{
    bled = 1;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    global.shake = 5;
    repeat (2 + random(2))
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = (image_angle - 110) + random(20);
    }
}
