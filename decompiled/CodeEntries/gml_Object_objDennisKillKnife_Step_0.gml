if (image_index > 0 && knifekill == 0)
{
    image_index -= 0.5;
}
if (image_index == 0 && hurtindex == 4)
{
    instance_create(x + lengthdir_x(15, image_angle), y + lengthdir_y(15, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3)
    {
        my_id.sprite_index = sprEPoliceDieKnifeSpecial;
    }
    else
    {
        my_id.sprite_index = sprEDieKnifeDennis;
    }
    my_id.image_index = hurtindex;
    my_id = instance_create(x, y, objPlayerMouse);
    if (sprite_index == sprPKillButterflySpecial)
    {
        my_id.sprite_index = sprPWalkButterfly;
    }
    else
    {
        my_id.sprite_index = sprPWalkKnife;
    }
    my_id.maskon = global.maskon;
    my_id.maskindex = global.maskindex;
    global.angle = image_angle - 180;
    my_id.reload = 10;
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
if (image_index >= 3 && knifekill == 1)
{
    knifekill = 0;
    hurtindex = 4;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    global.shake = 5;
    repeat (2 + random(2))
    {
        my_id = instance_create(((x + lengthdir_x(11, image_angle)) - 1) + random(2), ((y + lengthdir_y(11, image_angle)) - 1) + random(2), objBloodSquirt);
        my_id.image_angle = (image_angle - 110) + random(20);
    }
}
