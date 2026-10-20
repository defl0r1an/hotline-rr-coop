if (sprite_index == sprEGetUpLean || sprite_index == sprPoliceGetUpLean)
{
    global.my_id = id;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    global.shake = 5;
    global.blink = 1;
    global.myx = x + lengthdir_x(8, image_angle);
    global.myy = y + lengthdir_y(8, image_angle);
    my_id = instance_create(global.myx - 12, global.myy, objBloodPool);
    repeat (8)
    {
        dir = random(360);
        my_id = instance_create(global.myx + lengthdir_x(4, dir), global.myy + lengthdir_y(4, dir), objBloodSmoke);
        my_id.direction = dir;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.1;
    }
    repeat (4)
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, dir), (y - 3) + random(6) + lengthdir_y(8, dir), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), my_id.x, my_id.y);
        my_id.sprite_index = sprBloodSplatSmall;
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(4);
    }
    repeat (4)
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, dir), (y - 3) + random(6) + lengthdir_y(8, dir), objBloodSmudge);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), my_id.x, my_id.y);
        my_id.direction = random(360);
        my_id.speed = 1 + random(1);
        if (room == rmTrainstationEntrance && objTrain.visible == true)
        {
            my_id.train = 1;
        }
    }
    repeat (4)
    {
        my_id = instance_create(x, y, objBloodSplat);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), my_id.x, my_id.y);
        my_id.direction = random(360);
        if (room == rmTrainstationEntrance && objTrain.visible == true)
        {
            my_id.train = 1;
        }
    }
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(100 + (100 * global.factor)) + "pts";
    global.myscore += (100 + (100 * global.factor));
    global.boldscore = 100 * global.factor;
    global.killscore += 100;
    global.combo += 1;
    global.combotime = 240;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
    global.shake = 7;
    my_id = instance_create(x, y, objDeadBody);
    if (sprite_index == sprPoliceGetUpLean)
    {
        my_id.sprite_index = sprEPoliceDeadLeanTKnife;
        my_id1 = instance_create(x, y, objPoliceHat);
        my_id1.direction = (image_angle + random_range(-5, 5)) - (90 * objPlayer.left);
        my_id1.speed = 1.5 + random(1.5);
    }
    else
    {
        my_id.sprite_index = sprEMafiaDeadLeanTKnife;
    }
    my_id.image_index = 1 + floor(random(5));
    my_id.image_angle = angle;
    with (objDennisThrowingKnife)
    {
        if (place_meeting(x, y, global.my_id))
        {
            instance_destroy();
        }
    }
    instance_destroy();
    scrMoveSolidOff();
    exit;
}
