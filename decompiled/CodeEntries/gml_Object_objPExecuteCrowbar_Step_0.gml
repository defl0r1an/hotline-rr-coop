if (image_index < 22)
{
    if (global.maskindex == 16)
    {
        image_index += ((global.combotime / 1000) + 0.3);
    }
    else
    {
        image_index += 0.2;
    }
}
else
{
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    if (enemy == 148)
    {
        my_id.sprite_index = sprPoliceDeadCrowbar;
    }
    else
    {
        my_id.sprite_index = sprEDeadCrowbar;
    }
    my_id.image_speed = 0.2;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkCrowbar;
    my_id.maskon = global.maskon;
    my_id.maskindex = global.maskindex;
    global.angle = image_angle - 180;
    my_id.reload = 30;
    with (my_id)
    {
        move_outside_solid(global.angle, 16);
    }
    instance_destroy();
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(1000 + (700 * global.factor)) + "pts";
    global.myscore += (1000 + (700 * global.factor));
    global.killscore += 200;
    global.boldscore += (800 + (700 * global.factor));
    global.combotime = 240;
    global.combo += 1;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
    global.blink = 1;
    ds_list_add(global.bonuslist, "Execution");
    if (global.combotime < 12)
    {
        global.combotime = 12;
    }
    exit;
}
if (image_index == 3 && bled == 0)
{
    bled = 1;
    if (!audio_is_playing(sndPunch))
    {
        audio_play_sound(sndPunch, 0, false);
    }
    if (!audio_is_playing(sndHit))
    {
        audio_play_sound(sndHit, 0, false);
    }
    if (!audio_is_playing(sndBonesBreak))
    {
        audio_play_sound(sndBonesBreak, 0, false);
    }
    global.shake = 10;
    repeat (2 + random(3))
    {
        instance_create(((x + lengthdir_x(12, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(12, image_angle - 3)) - 1) + random(2), objBloodSquirt);
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(12, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(12, image_angle - 3)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}
if (image_index >= 6 && image_index < 22)
{
    if (!audio_is_playing(sndBonesBreak))
    {
        audio_play_sound(sndBonesBreak, 0, false);
    }
}
