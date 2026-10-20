if (image_index < 7)
{
    image_index += 0.2;
}
else
{
    instance_create(x + lengthdir_x(18, image_angle), y + lengthdir_y(18, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3 || room == rmPoliceHQFloor3TigerHard)
    {
        my_id.sprite_index = sprEPoliceDieStock;
    }
    else
    {
        my_id.sprite_index = sprEMafiaDieStock;
    }
    my_id.image_index = image_index;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkM16;
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
if (image_index >= 4 && bled == 0)
{
    bled = 1;
    hurtindex = 1;
    targetindex = 3;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    global.shake = 9;
    if (sprite == 1955)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objPoliceHat);
        my_id.speed = 1 + random(2);
        my_id.direction = image_angle + 90 + random_range(-5, 5);
    }
    repeat (2 + random(2))
    {
        instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (2)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSmudge);
        my_id.direction = image_angle + 90 + random_range(-5, 5);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}
