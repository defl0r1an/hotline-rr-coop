if (image_index < 10)
{
    image_index += 0.15;
    with (objPlayer)
    {
        dir = objIgelBikerKill.image_angle;
        legindex = 0;
        x = lerp(x, objIgelBikerKill.x, 0.25);
        y = lerp(y, objIgelBikerKill.y, 0.25);
        image_speed = 0.25;
    }
}
else
{
    instance_create(x + lengthdir_x(18, image_angle), y + lengthdir_y(18, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprBoss2Bash;
    my_id.image_index = 10;
    my_id.image_speed = 0;
    with (objPlayer)
    {
        my_id = instance_create(x, y, objPlayerMouse);
        my_id.sprite_index = sprPWalkUnarmed;
        my_id.maskon = 1;
        my_id.maskindex = global.maskindex;
        instance_destroy();
    }
    instance_create(x, y, objGoToCar);
    sxeasy_play(global.Static);
    with (objDoorH)
    {
        solid = 0;
    }
    with (objDoorH2)
    {
        solid = 0;
    }
    global.done = 1;
    instance_destroy();
    exit;
}
if (image_index >= 5 && hurtindex == 0)
{
    global.shake = 6;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    repeat (1 + random(3))
    {
        instance_create(x + lengthdir_x(18, (image_angle - 1) + random(2)), y + lengthdir_y(18, (image_angle - 1) + random(2)), objBloodSquirt);
    }
    repeat (4)
    {
        my_id = instance_create(x + lengthdir_x(18, image_angle), y + lengthdir_y(18, image_angle), objBloodSmoke);
        my_id.direction = random(360);
        my_id.image_angle = my_id.direction;
        my_id.speed = random(2);
    }
    hurtindex = 1;
}
if (image_index >= 9 && hurtindex == 1)
{
    global.shake = 8;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    repeat (2 + random(3))
    {
        instance_create(x + lengthdir_x(18, (image_angle - 1) + random(2)), y + lengthdir_y(18, (image_angle - 1) + random(2)), objBloodSquirt);
    }
    repeat (7)
    {
        my_id = instance_create(x + lengthdir_x(18, image_angle), y + lengthdir_y(18, image_angle), objBloodSmoke);
        my_id.direction = random(360);
        my_id.image_angle = my_id.direction;
        my_id.speed = random(2);
    }
    repeat (5)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = image_angle + random(180);
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    repeat (3)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objSkinPiece2);
        my_id.direction = image_angle + random_range(35, -35);
        my_id.speed = 3 + random_range(0.5, -0.5);
        my_id.image_angle = my_id.direction;
    }
    repeat (5)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBrainChunk2);
        my_id.direction = image_angle + random_range(35, -35);
        my_id.speed = 2 + random(1);
        my_id.image_angle = my_id.direction;
    }
    hurtindex = 2;
}
