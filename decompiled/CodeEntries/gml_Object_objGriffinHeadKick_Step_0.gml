if (image_index < 9)
{
    image_index += 0.2;
}
else
{
    if (global.maskindex == 4)
    {
        global.factor += 4;
    }
    global.myx = x + lengthdir_x(5, image_angle);
    global.myy = y + lengthdir_y(5, image_angle);
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
    ds_list_add(global.bonuslist, "Execution");
    if (global.combotime < 12)
    {
        global.combotime = 12;
    }
    my_id = instance_create(global.myx, global.myy, objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprEBackKicked;
    my_id.image_angle = image_angle;
    global.angle = image_angle - 180;
    my_id = instance_create(x, y, objPlayerGriffin);
    my_id.sprite_index = sprGriffinWalk;
    my_id.ammo = ammo;
    my_id.reload = 30;
    with (my_id)
    {
        move_contact_solid(global.angle, 12);
    }
    instance_destroy();
}
if (bled == 0 && image_index >= 5)
{
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    global.shake = 10;
    bled = 1;
    global.myx = x + lengthdir_x(8, image_angle);
    global.myy = y + lengthdir_y(8, image_angle);
    repeat (8)
    {
        dir = random(360);
        my_id = instance_create(global.myx + lengthdir_x(4, dir), global.myy + lengthdir_y(4, dir), objBloodSmoke);
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
