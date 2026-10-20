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
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkUzi;
    my_id.ammo = ammo;
    my_id.maskon = global.maskon;
    my_id.maskindex = global.maskindex;
    global.angle = image_angle - 180;
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
    global.blink = 1;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
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
    reloads = 6;
    hurtindex = 1;
    targetindex = 3;
    global.shake = 8;
    global.blink = 0.2;
    repeat (2 + random(2))
    {
        instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (2)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSmudge);
        my_id.direction = image_angle + random_range(-5, 5);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    ammo -= 1;
}
if (image_index >= 12 && bled == 1)
{
    bled = 2;
    hurtindex = 1;
    targetindex = 3;
    global.shake = 8;
    global.blink = 0.4;
    repeat (2 + random(2))
    {
        instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (2)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSmudge);
        my_id.direction = image_angle + random_range(-10, 10);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    ammo -= 1;
}
if (image_index >= 14 && bled == 2)
{
    bled = 3;
    hurtindex = 1;
    targetindex = 3;
    global.shake = 8;
    global.blink = 0.6;
    repeat (2 + random(2))
    {
        instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (2)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSmudge);
        my_id.direction = image_angle + random_range(-15, 15);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    ammo -= 1;
}
if (image_index >= 10 && image_index <= 14)
{
    reloads -= 1;
    if (reloads == 0)
    {
        reloads = 6;
    }
    if (reloads == 5 && sound < 3)
    {
        audio_play_sound(sndUzi, 0, false);
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndPunch, 0, false);
        my_id = instance_create(x + lengthdir_x(16, image_angle - (4 * image_yscale)), y + lengthdir_y(16, image_angle - (4 * image_yscale)), objShell);
        my_id.sprite_index = sprUziShell;
        my_id.image_angle = image_angle;
        my_id.direction = (image_angle - (90 * image_yscale) - 20) + random(30);
        my_id.speed = 1 + random(3);
        sound += 1;
    }
}
