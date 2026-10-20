if (image_index < 17)
{
    image_index += 0.2;
}
else
{
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.direction = my_id.image_angle;
    my_id.sprite_index = sprEFatDeadKatana;
    if (sprite_index == sprPJacketKillFatGunKatana)
    {
        my_id.sprite_index = sprEFatGunDeadKatana;
    }
    my_id = instance_create(x - lengthdir_x(36, image_angle), y - lengthdir_y(36, image_angle), objPlayerMouse);
    my_id.sprite_index = sprPWalkSword;
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
    my_id.text = "+" + string(600 + (600 * global.factor)) + "pts";
    global.myscore += (600 + (600 * global.factor));
    global.killscore += 800;
    global.boldscore += (600 * global.factor);
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
if (image_index >= 4 && bled == 0)
{
    bled = 1;
    hurtindex = 1;
    targetindex = 3;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    global.shake = 9;
    repeat (3 + random(3))
    {
        my_id = instance_create(((x + lengthdir_x(8, image_angle)) - 1) + random(2), ((y + lengthdir_y(8, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = -image_angle + irandom_range(-30, 30);
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(8, image_angle)) - 1) + random(2), ((y + lengthdir_y(8, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    if (sprite_index == sprPJacketKillFatGunKatana)
    {
        my_id = instance_create(x + lengthdir_x(-5, image_angle + 90), y + lengthdir_y(-5, image_angle + 90), objWeaponThrow);
        my_id.ammo = ammo;
        my_id.image_index = 45;
        my_id.direction = (image_angle - 10) + random(20) + 90;
        my_id.speed = 2 + random(1);
    }
}
if (image_index >= 10 && bled == 1)
{
    bled = 2;
    hurtindex = 1;
    targetindex = 3;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    global.shake = 6;
    repeat (5 + random(2))
    {
        my_id = instance_create(((x + lengthdir_x(8, image_angle)) - 1) + random(2), ((y + lengthdir_y(8, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = -image_angle + irandom_range(-30, 30);
    }
    repeat (6)
    {
        my_id = instance_create(((x + lengthdir_x(8, image_angle)) - 1) + random(2), ((y + lengthdir_y(8, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}
if (image_index >= 15 && bled == 2)
{
    bled = 3;
    hurtindex = 1;
    targetindex = 3;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    global.shake = 13;
    repeat (5 + random(2))
    {
        my_id = instance_create(((x + lengthdir_x(8, image_angle)) - 1) + random(2), ((y + lengthdir_y(8, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (5)
    {
        my_id = instance_create(((x + lengthdir_x(8, image_angle)) - 1) + random(2), ((y + lengthdir_y(8, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}
