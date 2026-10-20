if (image_index < 14)
{
    image_index += 0.2;
}
else
{
    instance_create(x + lengthdir_x(60, image_angle), y + lengthdir_y(60, image_angle), objBloodPool);
    my_id = instance_create(x, y, objPlayerBiker);
    global.angle = image_angle - 180;
    my_id.reload = 25;
    my_id.ammo = ammo;
    with (my_id)
    {
        move_outside_solid(global.angle, 12);
    }
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
    ds_list_add(global.bonuslist, "Execution");
    if (global.combotime < 12)
    {
        global.combotime = 12;
    }
    audio_play_sound(sndBodyFall1, 0, false);
    my_id = instance_create(x + lengthdir_x(24, image_angle), y + lengthdir_y(24, image_angle), objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprEFatDeadBiker;
    if (sprite_index == sprBikerKillFatGun)
    {
        my_id.sprite_index = sprEFatGunDeadBiker;
    }
    my_id.image_index = 0;
    my_id.speed = 2;
    my_id.direction = my_id.image_angle;
    my_id.image_yscale = image_yscale;
    instance_destroy();
    exit;
}
if (image_index > 3 && bled == 0)
{
    if (sprite_index == sprBikerKillFatGun)
    {
        my_id = instance_create(x + lengthdir_x(-5, image_angle + 90), y + lengthdir_y(-5, image_angle + 90), objWeaponThrow);
        my_id.image_index = 45;
        my_id.ammo = ammo;
        my_id.direction = image_angle - 90;
        my_id.speed = 2 + random(1);
    }
    global.shake = 7;
    bled = 1;
    hurtindex = 1;
    targetindex = 3;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    repeat (3 + random(2))
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = (image_angle - 110) + random(20);
    }
    repeat (4 + random(4))
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodDrop);
        my_id.direction = (image_angle - 110) + random(20);
        my_id.image_angle = my_id.direction;
    }
    repeat (1 + random(1))
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    repeat (3 + random(2))
    {
        my_id = instance_create(((x + lengthdir_x(12, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(12, image_angle - 3)) - 1) + random(2), objBloodSmoke);
        my_id.direction = (image_angle - 110) + random(20);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}
