if (image_index < 24)
{
    if (global.maskindex == 16)
    {
        image_index += ((global.combotime / 1000) + 0.3);
    }
    else
    {
        image_index += 0.25;
    }
}
else
{
    instance_create(x + lengthdir_x(24, image_angle), y + lengthdir_y(24, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprite_index;
    my_id.image_index = 25;
    my_id.image_speed = 0.25;
    my_id = instance_create(x + lengthdir_x(5, image_angle) + lengthdir_x(5, image_angle + 90), y + lengthdir_y(5, image_angle) + lengthdir_y(5, image_angle + 90), objPlayerMouse);
    my_id.sprite_index = sprPWalkTaser;
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
if (image_index >= 4 && state == 0)
{
    state = 1;
    audio_play_sound(sndTaserKill1, 0, false);
    i = 0;
    sparks = 10 + floor(random(20));
    repeat (sparks)
    {
        my_id1 = instance_create(((x + lengthdir_x(13, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(13, image_angle - 3)) - 1) + random(2), objSpark1);
        my_id1.direction = (i * 360) / sparks;
        my_id1.speed = 1.6 + lengthdir_x(0.2, my_id1.direction * sparks * 0.25);
        my_id1.image_angle = my_id1.direction;
        i += 1;
    }
    repeat (8 + random(8))
    {
        my_id1 = instance_create(((x + lengthdir_x(13, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(13, image_angle - 3)) - 1) + random(2), objSpark2);
        my_id1.direction = random(360);
        my_id1.speed = random(0.6);
    }
    instance_create(((x + lengthdir_x(13, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(13, image_angle - 3)) - 1) + random(2), objElectricLight);
}
if (image_index >= 18 && state == 1)
{
    state = 2;
    audio_play_sound(sndTaserKill2, 0, false);
    audio_play_sound(sndHit, 0, false);
    repeat (2 + random(3))
    {
        instance_create(((x + lengthdir_x(15, image_angle)) - 1) + random(2), ((y + lengthdir_y(15, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(15, image_angle)) - 1) + random(2), ((y + lengthdir_y(15, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}
