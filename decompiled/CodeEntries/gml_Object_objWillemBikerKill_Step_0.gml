if (image_index < 27)
{
    image_index += 0.25;
}
else
{
    if (global.hardmode == 0)
    {
        global.willemget = 1;
        objEffector.brus = 10;
        global.hardmodemasks[11] = 1;
        scrSaveUnlocked();
    }
    instance_create(x + lengthdir_x(18, image_angle), y + lengthdir_y(18, image_angle), objBloodPool);
    my_id = instance_create(x, y - 2, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprBikerDeadWillem;
    my_id.image_index = 0;
    my_id.image_yscale = 1;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkUnarmed;
    my_id.maskon = 1;
    my_id.maskindex = global.maskindex;
    my_id = instance_create(x, y, objCleaverDrop);
    my_id.pickable = 0;
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
    exit;
}
if (image_index == 4 && stage == 0)
{
    global.blink = 0.2;
    global.shake = 5;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    repeat (2 + random(1))
    {
        instance_create(((x + lengthdir_x(12, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(12, image_angle - 3)) - 1) + random(2), objBloodSquirt);
    }
    repeat (2)
    {
        my_id = instance_create(((x + lengthdir_x(12, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(12, image_angle - 3)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    stage = 1;
}
if (image_index == 12 && stage == 1)
{
    global.blink = 0.4;
    global.shake = 7;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    repeat (2 + random(2))
    {
        instance_create(((x + lengthdir_x(12, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(12, image_angle - 3)) - 1) + random(2), objBloodSquirt);
    }
    repeat (3)
    {
        my_id = instance_create(((x + lengthdir_x(12, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(12, image_angle - 3)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    stage = 2;
}
if (image_index == 18 && stage == 2)
{
    global.blink = 0.6;
    global.shake = 8;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    repeat (3 + random(2))
    {
        instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objBloodSquirt);
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    stage = 3;
}
if (image_index == 26 && stage == 3)
{
    global.blink = 1;
    global.shake = 9;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(12, image_angle)) - 1) + random(2), ((y + lengthdir_y(12, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = (image_angle - 15) + random(30);
    }
    repeat (12)
    {
        my_id = instance_create(((x + lengthdir_x(12, image_angle - 3)) - 1) + random(2), ((y + lengthdir_y(12, image_angle - 3)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    my_id = instance_create(((x + lengthdir_x(16, image_angle)) - 1) + random(2), ((y + lengthdir_y(16, image_angle)) - 1) + random(2), objSeveredHead);
    my_id.sprite_index = sprBikerHead;
    my_id.speed = 2;
    my_id.direction = image_angle;
    if (!global.bikerKills[3])
    {
        ini_open("Achievements.ini");
        count = ini_read_real("AchData", "Deaths Biker", 0);
        ini_write_real("AchData", "Deaths Biker", ++count);
    }
    global.bikerKills[3] = 1;
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
