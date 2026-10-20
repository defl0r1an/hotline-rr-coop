if (image_index < 15)
{
    image_index += 0.25;
}
else
{
    my_id = instance_create(x + scrPosDirX(9, 7, image_angle), y + scrPosDirY(9, 7, image_angle), objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprDogDeadBlunt;
    my_id.image_index = 5;
    my_id = instance_create(x, y, objPlayerMouse);
    global.angle = image_angle - 180;
    my_id.reload = 3;
    my_id.sprite_index = sprite_index;
    my_id.image_index = 16;
    my_id.image_speed = 0.25;
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
    targetindex = 3;
    ini_open("Achievements.ini");
    count = ini_read_real("AchData", "Dogs Killed", 0);
    if (!(count == 99))
    {
        count++;
        ini_write_real("AchData", "Dogs Killed", count);
    }
    else
    {
        scrAchievementSet("Dog Lover");
    }
    ini_close();
    audio_play_sound(sndPunch, 0, false);
    audio_play_sound(sndHit, 0, false);
    global.shake = 4;
    repeat (3 + random(2))
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = random(360);
    }
    repeat (2 + random(1))
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSmudge);
        my_id.direction = image_angle + random_range(80, 150);
        my_id.speed = random(2);
        my_id.image_angle = my_id.direction;
    }
    repeat (2 + random(1))
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBrainChunk2);
        my_id.image_angle = image_angle + random_range(80, 150);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1.75 + random(0.5);
    }
    bled = 1;
}
energie = round(random(1));
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 3;
    }
}
