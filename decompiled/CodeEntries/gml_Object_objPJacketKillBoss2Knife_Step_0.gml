if (image_index < 29)
{
    image_index += 0.25;
}
else
{
    instance_create(x + lengthdir_x(18, image_angle), y + lengthdir_y(18, image_angle), objBloodPool);
    my_id = instance_create(x, y - 2, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprBoss2DeadKnife;
    my_id.image_index = 0;
    my_id.image_yscale = 1;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkButterfly;
    my_id.maskon = 1;
    my_id.maskindex = global.maskindex;
    instance_create(x, y, objGoToCar);
    with (objDoorH)
    {
        solid = 0;
    }
    with (objDoorH2)
    {
        solid = 0;
    }
    instance_destroy();
    global.done = 1;
    sxeasy_play(global.Static);
    exit;
}
if (image_index == 2 && stage == 0)
{
    global.shake = 5;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    stage = 1;
}
if (image_index == 8 && stage == 1)
{
    global.shake = 7;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    repeat (4)
    {
        instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (6)
    {
        my_id = instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    stage = 2;
}
if (image_index == 14 && stage == 2)
{
    global.shake = 8;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    repeat (4)
    {
        instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (6)
    {
        my_id = instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    stage = 3;
}
if (image_index == 23 && stage == 3)
{
    global.shake = 9;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    repeat (4)
    {
        instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (6)
    {
        my_id = instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    if (!global.bikerKills[2])
    {
        ini_open("Achievements.ini");
        count = ini_read_real("AchData", "Deaths Biker", 0);
        ini_write_real("AchData", "Deaths Biker", ++count);
    }
    global.bikerKills[2] = 1;
    test = 1;
    i = 0;
    repeat (4)
    {
        if (!global.bikerKills[i])
        {
            test = 0;
        }
        i++;
    }
    if (test)
    {
        scrAchievementSet("You're Dead Meat");
    }
    scrSaveUnlocked();
}
