if (sprite_index == sprPExecuteChainsaw)
{
    if (image_index < 17)
    {
        image_index += 0.15;
        if (round(random(12)) == 2)
        {
            my_id = instance_create(x + lengthdir_x(image_index * 0.7, image_angle), y + lengthdir_y(image_index * 0.7, image_angle), objBloodSquirt);
            diradd = 90 - (round(random(1)) * 180);
            my_id.image_angle = (image_angle - 25) + random(50) + diradd;
        }
        if (round(random(12)) == 2 && image_index < 10)
        {
            my_id = instance_create(x + lengthdir_x(image_index * 0.7, image_angle), y + lengthdir_y(image_index * 0.7, image_angle), objGuts2);
            diradd = 90 - (round(random(1)) * 180);
            my_id.image_angle = (image_angle - 25) + random(50) + diradd;
            my_id.direction = my_id.image_angle;
            my_id.speed = 1.5 + random(1.5);
        }
        if (round(random(10)) == 2)
        {
            my_id = instance_create(x + lengthdir_x(image_index * 0.7, image_angle), y + lengthdir_y(image_index * 0.7, image_angle), objBloodSplat);
            diradd = 90 - (round(random(1)) * 180);
            my_id.image_angle = (image_angle - 25) + random(50) + diradd;
            my_id.direction = my_id.image_angle;
            my_id.speed = 1.5 + random(1.5);
            my_id.friction = 0.15;
        }
        if (round(random(16)) == 2)
        {
            my_id = instance_create(((x + lengthdir_x(image_index * 0.7, image_angle)) - 4) + random(8), ((y + lengthdir_y(image_index * 0.7, image_angle)) - 4) + random(8), objBloodSmoke);
            my_id.image_blend = c_red;
            my_id.color1 = 255;
            my_id.color2 = 128;
            my_id.image_angle = point_direction(x, y, my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = random(1);
        }
        if (image_index > 13 && dead == 0)
        {
            repeat (6)
            {
                my_id = instance_create(x + lengthdir_x(14, image_angle), y + lengthdir_y(14, image_angle), objBloodSquirt);
                my_id.image_angle = (image_angle - 20) + random(40);
            }
            dead = 1;
        }
    }
    else
    {
        global.factor = 2;
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
        repeat (3)
        {
            instance_create(x + lengthdir_x(17, image_angle), y + lengthdir_y(17, image_angle), objBigBlood);
        }
        my_id = instance_create(x, y, objDeadBody);
        if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3)
        {
            my_id.sprite_index = sprPoliceDieChainsaw1;
        }
        else
        {
            my_id.sprite_index = sprEDieChainsaw;
        }
        my_id.image_index = 17;
        my_id.image_angle = image_angle;
        my_id = instance_create(x, y, objPlayerMouse);
        my_id.sprite_index = sprPWalkChainsaw;
        my_id.ammo = ammo;
        my_id.alarm[3] = -1;
        instance_destroy();
    }
}
if (sprite_index == sprPExecuteChainsaw2)
{
    if (image_index < 17)
    {
        image_index += 0.15;
        if (image_index <= 14)
        {
            squirtpos = image_index * 0.7;
        }
        else
        {
            squirtpos = (14 - image_index) * 0.7;
        }
        if (round(random(12)) == 2)
        {
            my_id = instance_create(x + lengthdir_x(squirtpos, image_angle), y + lengthdir_y(squirtpos, image_angle), objBloodSquirt);
            diradd = 90 - (round(random(1)) * 180);
            my_id.image_angle = (image_angle - 25) + random(50) + diradd;
        }
        if (round(random(12)) == 2 && image_index < 10)
        {
            my_id = instance_create(x + lengthdir_x(squirtpos, image_angle), y + lengthdir_y(squirtpos, image_angle), objGuts2);
            diradd = 90 - (round(random(1)) * 180);
            my_id.image_angle = (image_angle - 25) + random(50) + diradd;
            my_id.direction = my_id.image_angle;
            my_id.speed = 1.5 + random(1.5);
        }
        if (round(random(11)) == 2)
        {
            my_id = instance_create(x + lengthdir_x(squirtpos, image_angle), y + lengthdir_y(squirtpos, image_angle), objBloodSplat);
            diradd = 90 - (round(random(1)) * 180);
            my_id.image_angle = (image_angle - 25) + random(50) + diradd;
            my_id.direction = my_id.image_angle;
            my_id.speed = 1.5 + random(1.5);
            my_id.friction = 0.15;
        }
        if (round(random(16)) == 2)
        {
            my_id = instance_create(((x + lengthdir_x(squirtpos, image_angle)) - 4) + random(8), ((y + lengthdir_y(squirtpos, image_angle)) - 4) + random(8), objSmokeHit);
            my_id.image_blend = c_red;
            my_id.color1 = 255;
            my_id.color2 = 128;
            my_id.image_angle = point_direction(x, y, my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = random(1);
        }
    }
    else
    {
        global.factor = 2;
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
        repeat (3)
        {
            instance_create(x, y, objBigBlood);
        }
        my_id = instance_create(x, y, objDeadBody);
        if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3)
        {
            my_id.sprite_index = sprPoliceDieChainsaw2;
        }
        else
        {
            my_id.sprite_index = sprEDieChainsaw2;
        }
        my_id.image_index = 17;
        my_id.image_angle = image_angle;
        my_id = instance_create(x, y, objPlayerMouse);
        my_id.sprite_index = sprPWalkChainsaw;
        my_id.ammo = ammo;
        instance_destroy();
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
