if (state == 0)
{
    exit;
}
if (state == 1)
{
    if (alarm_get(0) == -1)
    {
        alarm[0] = 120;
    }
    exit;
}
if (state == 2)
{
    if (image_index < 14)
    {
        valid = 0;
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x, y);
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x, y);
        view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.25);
        view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.25);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
        image_index += 0.15;
    }
    else
    {
        sprite_index = sprPantherCrawl;
        image_index = 0;
        state = 3;
        with (objPlayerMouseHouse)
        {
            active = 1;
            sprite_index = sprPWalkUnarmed;
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.maskon = 1;
            my_id.maskindex = maskindex;
            global.maskon = 1;
            my_id.sprite_index = sprPWalkButterfly;
            instance_destroy();
        }
    }
    exit;
}
if (speed > 0 && friction > 0)
{
    if (speed <= 0.2)
    {
        friction = 0;
        speed = 0;
    }
    exit;
}
with (objDoorH)
{
    solid = 1;
}
with (objDoorV)
{
    solid = 1;
}
with (objShootThrough)
{
    test = solid;
    solid = 1;
}
image_speed = 0.15;
speed = 0;
if (image_index > 0 && image_index < 3)
{
    speed = 0.3;
}
if (image_index > 5 && image_index < 9)
{
    speed = 0.3;
}
if (image_index > 12)
{
    speed = 0.3;
}
if (speed > 0)
{
    if (!place_free(x + lengthdir_x(16, direction), y + lengthdir_y(16, direction)))
    {
        image_angle += 4;
    }
    direction = image_angle;
    bloodsled -= 1;
    if (bloodsled == 0 && blood != 0)
    {
        my_id = instance_create(x, y, objBloodSled);
        my_id.image_index = round(random(2));
        my_id.image_xscale = 0.75;
        my_id.image_yscale = 0.75;
        my_id.image_angle = direction + choose(random_range(-4, 4));
        my_id.image_alpha = alphablood;
        alphablood -= 0.0075;
        blood -= 1;
        bloodsled = 26;
    }
}
with (objDoorH)
{
    solid = 0;
}
with (objDoorV)
{
    solid = 0;
}
with (objShootThrough)
{
    solid = test;
}
if (!instance_exists(objPlayer))
{
    exit;
}
if (point_distance(x, y, objPlayer.x, objPlayer.y) < 12 && objPlayer.object_index == objPlayerMouse)
{
    kill = keyboard_check(vk_space);
    if (kill)
    {
        my_id = instance_create(x, y, objPKillPanther);
        my_id.image_angle = image_angle;
        with (objPlayer)
        {
            if (object_index == objPlayerMouse || object_index == objPlayerController)
            {
                instance_destroy();
            }
        }
        instance_destroy();
    }
}
