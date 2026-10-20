if (image_index < 10.25)
{
    image_index += 0.25;
}
else
{
    global.myx = x + lengthdir_x(7, image_angle);
    global.myy = y + lengthdir_y(7, image_angle);
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(kill + (bold * global.factor)) + "pts";
    global.myscore += (kill + (bold * global.factor));
    global.killscore += kill;
    global.boldscore += (bold * global.factor);
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
    my_id = instance_create(global.myx, global.myy, objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprEDeadHammer;
    my_id.image_speed = 0.15;
    my_id.image_angle = image_angle;
    with (my_id)
    {
        dir = image_angle + (image_yscale * 12);
        my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
        my_id.image_angle = random(360);
    }
    global.angle = image_angle - 180;
    my_id = instance_create(x, y, objPigButcher);
    my_id.reload = 10;
    if (global.maskindex == 11)
    {
        my_id.sprite_index = global.gun;
        with (my_id)
        {
            scrGetAmmo(sprite_index);
        }
    }
    with (my_id)
    {
        move_outside_solid(global.angle, 6);
    }
    instance_destroy();
}
if (bled == 0 && image_index >= 9)
{
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    global.shake = 10;
    bled = 1;
    global.myx = x + lengthdir_x(8, image_angle);
    global.myy = y + lengthdir_y(8, image_angle);
    repeat (8)
    {
        dir = random(360);
        my_id = instance_create(global.myx + lengthdir_x(4, dir), global.myy + lengthdir_y(4, dir), objBloodSmoke);
        my_id.direction = dir;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.1;
    }
}
