if (slot == 0 && active == 1)
{
    with (instance_nearest(x, y, objEnemy))
    {
        if (sprite_index == sprEWalkM16)
        {
            alert = 4;
        }
    }
    slot = 1;
}
if (place_meeting(x, y, objEnemy))
{
    with (objEnemy)
    {
        if (alert == 5 && place_meeting(x, y, objEHideTrigger))
        {
            my_id = instance_create(x, y, objEHideM16);
            my_id.dir = objEHideTrigger.dir;
            my_id.image_index = 0;
            instance_destroy();
        }
    }
}
