if (image_index < 10.25)
{
    image_index += 0.25;
}
else
{
    global.myx = x + lengthdir_x(7, image_angle);
    global.myy = y + lengthdir_y(7, image_angle);
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(kill + (bold * global.factor)) + "pts";
    global.myscore += (kill + (bold * global.factor));
    global.killscore += kill;
    global.boldscore += (bold * global.factor);
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
    my_id = instance_create(global.myx, global.myy, objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    if (sprite_index == sprPKillThroatPolice)
    {
        my_id.sprite_index = sprPoliceDeadThroat;
    }
    else
    {
        my_id.sprite_index = sprEBackThroat;
    }
    my_id.image_speed = 0.15;
    my_id.image_angle = image_angle;
    with (my_id)
    {
        dir = image_angle + (image_yscale * 12);
        my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
        my_id.image_angle = random(360);
    }
    global.angle = image_angle - 180;
    if (global.controller == 1)
    {
        my_id = instance_create(x, y, objPlayerController);
    }
    else
    {
        my_id = instance_create(x, y, objPlayerMouse);
    }
    my_id.reload = 10;
    if (global.maskindex == 11)
    {
        my_id.sprite_index = gun;
        my_id.ammo = ammo;
    }
    else if (global.maskindex == 6 && global.hardmode == 1)
    {
        my_id.sprite_index = sprPWalkButterfly;
    }
    with (my_id)
    {
        move_outside_solid(global.angle, 6);
    }
    instance_destroy();
}
if (bled == 0 && image_index >= 4)
{
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndThroatRip, 0, false);
    bled = 1;
    global.myx = x + lengthdir_x(8, image_angle);
    global.myy = y + lengthdir_y(8, image_angle);
    repeat (8)
    {
        dir = random(360);
        my_id = instance_create(global.myx + lengthdir_x(5, dir), global.myy + lengthdir_y(5, dir), objBloodSmoke);
        my_id.direction = dir;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.1;
    }
}
vdist = point_distance(x, y, room_width / 2, room_height / 2);
vdir = point_direction(room_width / 2, room_height / 2, x, y);
viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
view_xview[0] += lengthdir_x(viewspeed, viewdir);
view_yview[0] += lengthdir_y(viewspeed, viewdir);
view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
scrHardMode();
