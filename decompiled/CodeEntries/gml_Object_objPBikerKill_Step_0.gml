if (image_index < 47)
{
    image_index += 0.25;
}
else
{
    instance_create(x + lengthdir_x(18, image_angle), y + lengthdir_y(18, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprBoss2Tigered;
    my_id.image_index = 0;
    my_id.image_yscale = 1;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkUnarmed;
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
if (image_index == 5 && stage == 0)
{
    global.shake = 5;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    stage = 1;
}
if (image_index == 13 || (image_index == 22 && stage == 1))
{
    global.shake = 5;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
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
if (image_index == 22)
{
    global.shake = 5;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
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
if (image_index == 31 && stage == 3)
{
    global.shake = 5;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    audio_play_sound(sndHeadshot, 0, false);
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
    repeat (3)
    {
        my_id = instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objBrainChunk2);
        my_id.direction = image_angle + random_range(-30, 30);
        my_id.speed = 1.5 + random(1.5);
        my_id.image_angle = my_id.direction;
    }
    repeat (2)
    {
        my_id = instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objSkinPiece2);
        my_id.direction = image_angle + random_range(-30, 30);
        my_id.speed = 1.5 + random(1.5);
        my_id.image_angle = my_id.direction;
    }
    if (!global.bikerKills[1])
    {
        ini_open("Achievements.ini");
        count = ini_read_real("AchData", "Deaths Biker", 0);
        ini_write_real("AchData", "Deaths Biker", ++count);
    }
    global.bikerKills[1] = 1;
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
