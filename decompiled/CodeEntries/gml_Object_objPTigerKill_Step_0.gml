if (global.hardmode == 1)
{
    if (image_index < 7)
    {
        image_index += 0.5;
    }
}
if (image_index >= 7 || hurtindex == 8)
{
    if (global.maskindex == 2)
    {
        global.factor += 1.5;
    }
    myx = x + lengthdir_x(5, image_angle);
    myy = y + lengthdir_y(5, image_angle);
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(200 + (400 * global.factor)) + "pts";
    global.myscore += (200 + (400 * global.factor));
    global.killscore += 200;
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
    my_id = instance_create(x, y, objDeadBody);
    if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3 || room == rmPoliceHQFloor3TigerHard)
    {
        my_id.sprite_index = sprPoliceDieTiger;
        my_id.image_index = 7;
        my_id.image_angle = image_angle;
    }
    else
    {
        my_id.sprite_index = sprEDieTiger;
        my_id.image_index = 7;
        my_id.image_angle = image_angle;
    }
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkUnarmed;
    instance_destroy();
}
if ((image_index > 2 && dead == 0) || hurtindex == 2)
{
    audio_play_sound(sndPunch, 0, false);
    audio_play_sound(sndHit, 0, false);
    global.shake = 5;
    global.blink = 0.4;
    repeat (1 + random(2))
    {
        my_id = instance_create(((x + lengthdir_x(17, image_angle)) - 1) + random(2), ((y + lengthdir_y(17, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = (image_angle - 120) + random(240);
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSmudge);
        my_id.direction = image_angle + 30 + random_range(-5, 5);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    if (sprite == 1891)
    {
        my_id1 = instance_create(((x + lengthdir_x(17, image_angle)) - 1) + random(2), ((y + lengthdir_y(17, image_angle)) - 1) + random(2), objPoliceHat);
        my_id1.speed = 1.5 + random(1.5);
        my_id1.direction = image_angle + 30 + random_range(-5, 5);
    }
    dead = 1;
}
if ((image_index > 5 && dead == 1) || hurtindex == 5)
{
    audio_play_sound(sndPunch, 0, false);
    audio_play_sound(sndHit, 0, false);
    global.shake = 10;
    global.blink = 0.6;
    repeat (1 + random(2))
    {
        my_id = instance_create(((x + lengthdir_x(17, image_angle)) - 1) + random(2), ((y + lengthdir_y(17, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = (image_angle - 120) + random(240);
    }
    repeat (4)
    {
        my_id = instance_create(((x + lengthdir_x(18, image_angle)) - 1) + random(2), ((y + lengthdir_y(18, image_angle)) - 1) + random(2), objBloodSmudge);
        my_id.direction = (image_angle - 30) + random_range(-5, 5);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
    dead = 2;
    repeat (3)
    {
        instance_create(x + lengthdir_x(17, image_angle), y + lengthdir_y(17, image_angle), objBigBlood);
    }
}
energie = round(random(1));
