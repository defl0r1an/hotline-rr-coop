if (image_index < 17)
{
    image_index += 0.2;
}
else
{
    instance_create(x + lengthdir_x(18, image_angle), y + lengthdir_y(18, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprBoss2Clubbed;
    my_id.image_index = hurtindex;
    my_id.image_yscale = 1;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkClub;
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
if (image_index >= 11 && bled == 0)
{
    bled = 1;
    hurtindex = 1;
    targetindex = 3;
    audio_play_sound(sndPunch, 0, false);
    audio_play_sound(sndDoorHit, 0, false);
    audio_play_sound(sndNeck, 0, false);
    audio_play_sound(sndHit, 0, false);
    global.shake = 5;
    repeat (3 + random(3))
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = 0.5 + random(1);
    }
    repeat (16 + random(6))
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodDrop);
        my_id.direction = (image_angle - 100) + random(200);
        my_id.speed = 2 + random(5);
    }
    repeat (4 + random(3))
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = image_angle + random(30);
    }
    repeat (6)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objBrainChunk2);
        my_id.direction = image_angle + random_range(-30, 30);
        my_id.speed = 1.5 + random(1.5);
        my_id.image_angle = my_id.direction;
    }
    repeat (3)
    {
        my_id = instance_create(((x + lengthdir_x(24, image_angle)) - 1) + random(2), ((y + lengthdir_y(24, image_angle)) - 1) + random(2), objSkinPiece2);
        my_id.direction = image_angle + random_range(-30, 30);
        my_id.speed = 1.5 + random(1.5);
        my_id.image_angle = my_id.direction;
    }
    if (!global.bikerKills[0])
    {
        ini_open("Achievements.ini");
        count = ini_read_real("AchData", "Deaths Biker", 0);
        ini_write_real("AchData", "Deaths Biker", ++count);
    }
    global.bikerKills[0] = 1;
    i = 0;
    test = 1;
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
