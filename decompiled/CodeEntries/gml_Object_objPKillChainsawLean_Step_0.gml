if (image_index < 13)
{
    image_index += 0.15;
    if (round(random(12)) == 2)
    {
        my_id = instance_create(x + lengthdir_x(8, image_angle), y + lengthdir_y(8, image_angle), objBloodSquirt);
        my_id.image_angle = (image_angle - 180 - 40) + random(80);
    }
    if (round(random(10)) == 2)
    {
        my_id = instance_create(x + lengthdir_x(8, image_angle), y + lengthdir_y(8, image_angle), objSplat);
        diradd = 90 - (round(random(1)) * 180);
        my_id.image_angle = (image_angle - 180 - 40) + random(80);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1.5 + random(1.5);
    }
    if (round(random(13)) == 2)
    {
        my_id = instance_create(x + lengthdir_x(8, image_angle), y + lengthdir_y(8, image_angle), objGuts2);
        diradd = 90 - (round(random(1)) * 180);
        my_id.image_angle = (image_angle - 180 - 40) + random(80);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1.5 + random(1.5);
    }
    if (round(random(16)) == 2)
    {
        my_id = instance_create(((x + lengthdir_x(8, image_angle)) - 4) + random(8), ((y + lengthdir_y(8, image_angle)) - 4) + random(8), objSmokeHit);
        my_id.image_blend = c_red;
        my_id.color1 = 255;
        my_id.color2 = 128;
        my_id.image_angle = (image_angle - 180 - 40) + random(80);
        my_id.direction = my_id.image_angle;
        my_id.speed = random(1);
    }
    if (image_index > 13 && dead == 0)
    {
        repeat (6)
        {
            my_id = instance_create(x + lengthdir_x(8, image_angle), y + lengthdir_y(8, image_angle), objBloodSquirt);
            my_id.image_angle = (image_angle - 180 - 20) + random(40);
        }
        dead = 1;
    }
}
else
{
    repeat (3)
    {
        instance_create(x, y, objBigBlood);
    }
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
    if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3)
    {
        my_id.sprite_index = sprPoliceDieChainsawLean;
        my_id.image_index = 13;
        my_id.image_angle = image_angle;
    }
    else
    {
        my_id.sprite_index = sprEDieChainsawLean;
        my_id.image_index = 13;
        my_id.image_angle = image_angle;
    }
    my_id = instance_create(x - lengthdir_x(10, image_angle), y - lengthdir_y(10, image_angle), objPlayerMouse);
    my_id.sprite_index = sprPWalkChainsaw;
    my_id.ammo = ammo;
    my_id.alarm[3] = -1;
    instance_destroy();
}
