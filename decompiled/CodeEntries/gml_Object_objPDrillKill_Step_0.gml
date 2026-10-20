if (image_index < 19)
{
    image_index += 0.2;
}
else
{
    instance_create(x + lengthdir_x(24, image_angle), y + lengthdir_y(24, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprEBackDrill;
    if (sprite_index == sprPDrillKillPolice)
    {
        my_id.sprite_index = sprPoliceDeadDrill;
    }
    my_id.image_yscale = 1;
    my_id.image_index = 3;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkDrill;
    my_id.maskon = global.maskon;
    my_id.maskindex = global.maskindex;
    global.angle = image_angle - 180;
    my_id.reload = 30;
    with (my_id)
    {
        move_outside_solid(global.angle, 16);
    }
    instance_destroy();
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
    exit;
}
if (image_index > 3 && image_index < 17)
{
    if (round(random(12)) == 2)
    {
        my_id = instance_create(x + lengthdir_x(8, image_angle), y + lengthdir_y(8, image_angle), objBloodSquirt);
        my_id.image_angle = (image_angle - 180 - 40) + random(80);
    }
    if (image_index < 4)
    {
        my_id = instance_create(x + lengthdir_x(8, image_angle), y + lengthdir_y(8, image_angle), objBloodSmoke);
        diradd = 90 - (round(random(1)) * 180);
        my_id.image_angle = (image_angle - 180 - 40) + random(80);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1.5 + random(1.5);
    }
    if (round(random(13)) == 2)
    {
        my_id = instance_create(x + lengthdir_x(8, image_angle), y + lengthdir_y(8, image_angle), objBloodDrop);
        diradd = 90 - (round(random(1)) * 180);
        my_id.image_angle = (image_angle - 180 - 40) + random(80);
        my_id.speed = 1.5 + random(1.5);
        my_id.image_xscale = 0.5 + random(0.5);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = my_id.direction;
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
}
energie = round(random(1));
if (global.maskon == 1)
{
    if (global.maskindex == 9)
    {
        energie = 3;
    }
}
