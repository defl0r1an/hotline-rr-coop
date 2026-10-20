if (image_index < 37)
{
    if (global.maskindex == 16 || global.maskindex == 27)
    {
        image_index += 0.3;
    }
    else
    {
        image_index += 0.2;
    }
}
else
{
    my_id = instance_create(x, y, objBodyguardCrawl);
    my_id.image_angle = image_angle;
    instance_destroy();
    exit;
}
if (image_index > 4.85 && image_index < 5.1)
{
    audio_play_sound(sndWeaponHit, 0, false);
    global.shake = 5;
}
if (image_index > 7.85 && image_index < 8.1)
{
    audio_play_sound(sndWeaponHit, 0, false);
    global.shake = 5;
}
if (image_index > 20.85 && image_index < 21.1)
{
    audio_play_sound(sndWeaponHit, 0, false);
    global.shake = 5;
}
if (image_index > 24.85 && image_index < 25.1)
{
    audio_play_sound(sndWeaponHit, 0, false);
    global.shake = 5;
}
if (image_index >= 33)
{
    if (!instance_exists(objPlayerMouse))
    {
        my_id = instance_create(x, y, objPlayerMouse);
        global.maskon = 1;
        my_id.maskon = 1;
        my_id.maskindex = global.maskindex;
        my_id.reload = 30;
        my_id.myxspeed = lengthdir_x(3, image_angle - 180);
        my_id.myyspeed = lengthdir_y(3, image_angle - 180);
        global.dir = image_angle - 180;
    }
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
