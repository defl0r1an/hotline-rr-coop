if (image_index < 16)
{
    image_index += 0.2;
}
else
{
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(600 + (500 * global.factor)) + "pts";
    global.myscore += (600 + (500 * global.factor));
    global.killscore += 600;
    global.boldscore += (500 * global.factor);
    global.combotime = 240;
    global.combo += 1;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
    global.blink = 1;
    ds_list_add(global.bonuslist, "Execution");
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprite_index;
    my_id.image_index = 17;
    my_id.image_angle = image_angle;
    my_id.image_speed = 0.15;
    my_id = instance_create(x - lengthdir_x(10, image_angle), y - lengthdir_y(10, image_angle), objPlayerMouse);
    my_id.sprite_index = sprPWalkDrill;
    instance_destroy();
    exit;
}
if (image_index > 4 && image_index < 14)
{
    global.myx = x + lengthdir_x(8, image_angle);
    global.myy = y + lengthdir_y(8, image_angle);
    if (sound == 0)
    {
        audio_play_sound(sndDrill, 0, false);
        audio_play_sound(sndPunch, 0, false);
        audio_play_sound(asset_get_index("sndBulletHit" + string(round(random_range(1, 3)))), 0, false);
        repeat (2 + round(random(1)))
        {
            my_id = instance_create(x + lengthdir_x(-4, image_angle), y + lengthdir_y(-4, image_angle), objBloodSquirt);
            my_id.image_angle = (image_angle - 180 - 40) + random(80);
        }
        if (sprite_index == sprPJacketKillPoliceDrillLean)
        {
            my_id1 = instance_create(((x + lengthdir_x(-4, image_angle)) - 1) + random(2), ((y + lengthdir_y(-4, image_angle)) - 1) + random(2), objPoliceHat);
            my_id1.speed = 2.5 + random(1);
            my_id1.direction = image_angle - 180;
        }
        sound = 1;
    }
    if (round(random(31)) == 2)
    {
        my_id = instance_create(x + lengthdir_x(-4, image_angle), y + lengthdir_y(-4, image_angle), objBrainChunk2);
        my_id.image_angle = (image_angle - 180 - 40) + random(80);
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(1);
    }
    if (round(random(22)) == 2)
    {
        my_id = instance_create(x + lengthdir_x(-4, image_angle), y + lengthdir_y(-4, image_angle), objBloodSquirt);
        my_id.image_angle = (image_angle - 180 - 40) + random(80);
    }
    if (image_index < 4)
    {
        dir = random(360);
        my_id = instance_create(global.myx + lengthdir_x(-2, dir), global.myy + lengthdir_y(-2, dir), objBloodSmoke);
        my_id.direction = dir;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.1;
    }
    if (round(random(24)) == 2)
    {
        my_id = instance_create(x + lengthdir_x(-4, image_angle), y + lengthdir_y(-4, image_angle), objBloodDrop);
        diradd = 90 - (round(random(1)) * 180);
        my_id.image_angle = (image_angle - 180 - 40) + random(80);
        my_id.speed = 1.5 + random(1.5);
        my_id.image_xscale = 0.5 + random(0.5);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = my_id.direction;
    }
    if (round(random(25)) == 2)
    {
        my_id = instance_create(((x + lengthdir_x(-4, image_angle)) - 4) + random(8), ((y + lengthdir_y(-4, image_angle)) - 4) + random(8), objSmokeHit);
        my_id.image_blend = c_red;
        my_id.color1 = 255;
        my_id.color2 = 128;
        my_id.image_angle = (image_angle - 180 - 40) + random(80);
        my_id.direction = my_id.image_angle;
        my_id.speed = random(1);
    }
}
energie = round(random(1));
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 3;
    }
}
