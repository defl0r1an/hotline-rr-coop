if (image_index < 12)
{
    image_index += 0.25;
}
else
{
    global.myx = x + lengthdir_x(5, image_angle);
    global.myy = y + lengthdir_y(5, image_angle);
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(800 + (400 * global.factor)) + "pts";
    global.myscore += (800 + (400 * global.factor));
    global.killscore += 800;
    global.boldscore += (400 * global.factor);
    global.combotime = 240;
    global.combo += 1;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills += 1;
    global.blink = 1;
    ds_list_add(global.bonuslist, "Mercy Kill");
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprEFrontSnap;
    my_id.image_index = 1;
    if (sprite == 2210)
    {
        my_id.sprite_index = sprite;
        my_id.image_index = 13;
    }
    my_id.image_angle = image_angle;
    global.angle = image_angle - 180;
    if (global.controller == 1)
    {
        my_id = instance_create(global.executionx, global.executiony, objPlayerController);
    }
    else
    {
        my_id = instance_create(global.executionx, global.executiony, objPlayerMouse);
    }
    my_id.reload = 30;
    if (bag == 1)
    {
        my_id.sprite_index = sprPWalkBag;
    }
    with (my_id)
    {
        move_outside_solid(global.angle, 16);
    }
    instance_destroy();
}
if (bled == 0 && image_index >= 6)
{
    bled = 1;
    audio_play_sound(sndBonesBreak, 0, false);
    global.shake = 12;
}
if (global.maskindex != 7)
{
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
    viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
    view_xview[0] += lengthdir_x(viewspeed, viewdir);
    view_yview[0] += lengthdir_y(viewspeed, viewdir);
    view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
}
else
{
    vdist = 0;
    vdir = 0;
}
scrHardMode();
