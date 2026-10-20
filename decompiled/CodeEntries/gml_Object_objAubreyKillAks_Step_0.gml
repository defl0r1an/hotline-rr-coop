if (image_index < 16 && ammo > 0)
{
    image_index += 0.2;
}
else
{
    instance_create(x + lengthdir_x(24, image_angle), y + lengthdir_y(24, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprEMafiaDieThreeShots;
    my_id.image_index = image_index;
    my_id = instance_create(x - lengthdir_x(9, image_angle), y - lengthdir_y(9, image_angle), objPlayerMouse);
    my_id.sprite_index = sprPWalkAks;
    my_id.ammo = ammo;
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
if (image_index >= 10 && bled == 0)
{
    scrHearPlayer();
    bled = 1;
    global.shake = 5;
    audio_play_sound(sndKalashnikov, 0, false);
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    repeat (2 + random(2))
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
    ammo -= 1;
}
if (image_index >= 12 && bled == 1)
{
    bled = 2;
    global.shake = 5;
    audio_play_sound(sndKalashnikov, 0, false);
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    repeat (2 + random(2))
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
    ammo -= 1;
}
if (image_index >= 14 && bled == 2)
{
    bled = 3;
    audio_play_sound(sndKalashnikov, 0, false);
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    global.shake = 5;
    repeat (2 + random(2))
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
    ammo -= 1;
}
