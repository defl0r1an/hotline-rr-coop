scrZackDieWhileKilling();
if (image_index < 21)
{
    if (global.maskindex == 16 || global.maskindex == 27)
    {
        image_index += ((global.combotime / 1000) + 0.2);
    }
    else
    {
        image_index += 0.2;
    }
}
else
{
    instance_create(x + lengthdir_x(22, image_angle), y + lengthdir_y(22, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = bottom;
    my_id.image_index = -1;
    my_id = instance_create(x + lengthdir_x(3, image_angle), y + lengthdir_y(3, image_angle), objPlayerMouse);
    my_id.sprite_index = sprPJacketWalkSkateboard;
    my_id.maskon = global.maskon;
    my_id.maskindex = global.maskindex;
    global.angle = image_angle - 180;
    my_id.reload = 10;
    with (my_id)
    {
        move_outside_solid(global.angle, 16);
    }
    instance_destroy();
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(600 + (400 * global.factor)) + "pts";
    global.myscore += (600 + (400 * global.factor));
    global.killscore += 600;
    global.boldscore += (400 * global.factor);
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
if (image_index >= 16 && bled == 0)
{
    bled = 1;
    hurtindex = 15;
    targetindex = 17;
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
energie = round(random(1));
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 3;
    }
}
