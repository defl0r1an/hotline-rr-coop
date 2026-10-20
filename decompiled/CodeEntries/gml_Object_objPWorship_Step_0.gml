if (state == 0)
{
    if (alarm_get(0) == -1)
    {
        alarm[0] = 60;
    }
}
else if (state == 1)
{
    if (image_index < (image_number - 1))
    {
        image_index += 0.15;
    }
    else
    {
        state++;
        instance_create(x, y, objLightning);
        instance_create(x, y, objRain);
        global.rain = 1;
        sprite_index = sprPEndPanther;
        image_index = 0;
    }
}
else if (state == 2)
{
    if (alarm_get(0) == -1)
    {
        alarm[0] = 80;
    }
}
else if (state == 3)
{
    if (image_index < (image_number - 1))
    {
        image_index += 0.15;
    }
    else
    {
        state++;
        sprite_index = sprPMaskSlip;
        image_index = 0;
    }
}
else if (state == 4)
{
    if (image_index < (image_number - 1))
    {
        image_index += 0.15;
    }
    else
    {
        my_id = instance_create(x, y, objPlayerMouse);
        my_id.maskon = 1;
        my_id.maskindex = global.maskindex;
        global.maskon = 1;
        my_id.sprite_index = sprPWalkUnarmed;
        global.hardmodemasks[16] = 1;
        scrSaveUnlocked();
        scrAchievementSet("This Is My True Nature!");
        instance_destroy();
    }
}
vdist = point_distance(224, 272, room_width / 2, room_height / 2);
vdir = point_direction(room_width / 2, room_height / 2, x, y);
viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), 224 + lengthdir_x(vdist * 0.2, vdir - 180), 272 + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), 224 + lengthdir_x(vdist * 0.2, vdir - 180), 272 + lengthdir_y(vdist * 0.2, vdir - 180));
view_xview[0] += lengthdir_x(viewspeed, viewdir);
view_yview[0] += lengthdir_y(viewspeed, viewdir);
view_angle[0] = -lengthdir_y(vdist * 0.00625, vdir * 2);
scrHardMode();
