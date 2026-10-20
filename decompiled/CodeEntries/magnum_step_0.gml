if (image_index < 15)
{
    image_index += 0.25;
}
else
{
    instance_create(x + lengthdir_x(24, image_angle), y + lengthdir_y(24, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprEMagnumed;
    my_id.image_index = image_index;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkMagnum;
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
    ds_list_add(global.bonuslist, "Execution");
    if (global.combotime < 12)
    {
        global.combotime = 12;
    }
    exit;
}
if (sound == 0)
{
    audio_play_sound(magnum_execution_with_shot_V3, 0, false);
    sound = 1;
}
if (image_index >= 12 && bled == 0)
{
    scrHearPlayer();
    global.shake = 15;
    bled = 1;
    hurtindex = 1;
    targetindex = 3;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndMagnum, 0, false);
    global.shake = 12;
    repeat (2 + random(2))
    {
        instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (8)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    repeat (7)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBrainChunk2);
        my_id.direction = image_angle + random_range(-30, 30);
        my_id.speed = 0.3 + random(2.5);
        my_id.image_angle = my_id.direction;
    }
    repeat (2)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objSkinPiece2);
        my_id.image_xscale = 0.75;
        my_id.image_yscale = 0.75;
        my_id.direction = (image_angle - 15) + random(30);
        my_id.speed = 1.5 + random(1);
        my_id.image_angle = my_id.direction;
    }
    ammo -= 1;
}
