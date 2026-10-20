if (image_index < 8.05)
{
    image_index += 0.35;
}
else
{
    if (global.maskindex == 2)
    {
        global.factor += 4;
    }
    myx = x + lengthdir_x(5, image_angle);
    myy = y + lengthdir_y(5, image_angle);
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(200 + (400 * global.factor)) + "pts";
    global.myscore += (200 + (400 * global.factor));
    global.killscore += 200;
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
    my_id = instance_create(x, y, objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprite;
    my_id.image_index = 8;
    my_id.image_angle = image_angle;
    my_id.direction = image_angle;
    if (global.controller == 1)
    {
        my_id = instance_create(x, y, objPlayerController);
    }
    else
    {
        my_id = instance_create(x, y, objPlayerMouse);
    }
    my_id.reload = 30;
    with (my_id)
    {
        move_contact_solid(global.angle, 12);
    }
    instance_destroy();
}
if (bled == 0 && image_index >= 4)
{
    global.angle = image_angle - 180;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    global.shake = 4;
    bled = 1;
    if (sprite == 1981)
    {
        my_id = instance_create(x, y, objPoliceHat);
        my_id.sprite_index = sprInspectorHat;
        my_id.direction = (image_angle - 10) + random(20);
        my_id.speed = 1 + random(2);
    }
    else if (sprite == 2272)
    {
        my_id = instance_create(x + lengthdir_x(-5, image_angle + 90), y + lengthdir_y(-5, image_angle + 90), objWeaponThrow);
        my_id.ammo = ammo;
        my_id.image_index = 45;
        my_id.direction = (image_angle - 10) + random(20) + 90;
        my_id.speed = 2 + random(1);
    }
    myx = x + lengthdir_x(8, image_angle);
    myy = y + lengthdir_y(8, image_angle);
    repeat (8)
    {
        dir = random(360);
        my_id = instance_create(myx + lengthdir_x(4, dir), myy + lengthdir_y(4, dir), objBloodSmoke);
        my_id.direction = dir;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.1;
    }
}
