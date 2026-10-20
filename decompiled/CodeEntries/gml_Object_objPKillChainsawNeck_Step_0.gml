if (image_index < 7)
{
    image_index += 0.25;
}
else
{
    global.myx = x + lengthdir_x(5, image_angle);
    global.myy = y + lengthdir_y(5, image_angle);
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(800 + (400 * global.factor)) + "pts";
    global.myscore += (800 + (400 * global.factor));
    global.killscore += 800;
    global.boldscore += (400 * global.factor);
    global.combotime = 240;
    global.combo += 1;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
    global.blink = 1;
    ds_list_add(global.bonuslist, "Mercy Kill");
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprite;
    my_id.image_index = 7;
    my_id.image_angle = image_angle;
    global.angle = image_angle - 180;
    if (global.controller == 1)
    {
        my_id = instance_create(global.executionx, global.executiony, objPlayerController);
    }
    else
    {
        my_id = instance_create(global.executionx, global.executiony, objPlayerMouse);
    }
    my_id.reload = 30;
    my_id.ammo = ammo;
    my_id.sprite_index = sprPWalkChainsaw;
    with (my_id)
    {
        move_outside_solid(global.angle, 16);
    }
    instance_destroy();
}
if (sound == 0)
{
    audio_play_sound(sndChainsawAttack, 0, false);
    sound = 1;
}
if (bled == 0 && image_index >= 4)
{
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    repeat (7)
    {
        my_id = instance_create(((x + lengthdir_x(12, image_angle)) - 1) + random(2), ((y + lengthdir_y(12, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = (image_angle - 15) + random(30);
    }
    repeat (12)
    {
        my_id = instance_create(((x + lengthdir_x(12, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(12, image_angle - 3)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    my_id = instance_create(((x + lengthdir_x(15, image_angle)) - 1) + random(2), ((y + lengthdir_y(15, image_angle)) - 1) + random(2), objBodyPart);
    my_id.direction = image_angle;
    my_id.speed = 2;
    my_id.image_angle = image_angle;
    bled = 1;
}
