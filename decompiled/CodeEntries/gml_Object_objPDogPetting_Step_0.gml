_diff = angle_difference(point_direction(x, y, global.executionx, global.executiony), image_angle);
dirdog = point_direction(global.executionx, global.executiony, x, y);
image_angle += (_diff * 0.1);
energie = round(random(1));
if (End <= 0)
{
    x = lerp(x, global.executionx + lengthdir_x(29, dirdog), 0.25);
    y = lerp(y, global.executiony + lengthdir_y(29, dirdog), 0.25);
}
if (sprite_index == sprPDogPettingEnd && image_index > 15)
{
    image_index = 0;
    image_speed = 0;
    sprite_index = sprPWalkUnarmed;
    End = 1;
}
if (sprite_index == sprPDogPettingEnd && sound == 0)
{
    audio_play_sound(sndToken, 0, false);
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "Good boy!";
    sound = 1;
}
if (End == 1)
{
    x = lerp(x, xstart, 1);
    y = lerp(y, ystart, 1);
    if (x == xstart && y == ystart)
    {
        my_id = instance_create(xstart, ystart, objPlayerMouse);
        global.angle = image_angle - 180;
        my_id.reload = 3;
        my_id.sprite_index = sprPWalkUnarmed;
        if (instance_exists(objEnemy))
        {
            my_id = instance_create(global.executionx, global.executiony, objDogPatrol);
        }
        else
        {
            my_id = instance_create(global.executionx, global.executiony, objDogPatrolFriend);
        }
        my_id.sprite_index = sprDogSit;
        my_id.direction = dirdog;
        instance_destroy();
    }
}
if (mouse_check_button(mb_right))
{
    if (End != 1)
    {
        End = -1;
    }
}
else if (End != 1)
{
    if (sprite_index == sprPDogPettingLoop)
    {
        End = 0;
    }
}
