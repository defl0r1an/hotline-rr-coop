if (global.xbox == 1)
{
    scrXboxBluntKill();
}
if (hurtindex == 11)
{
    if (image_index == 0)
    {
        my_id = instance_create(x, y, objPlayerMouse);
        my_id.sprite_index = global.weaponsprite;
        global.angle = image_angle - 180;
        my_id.reload = 10;
        with (my_id)
        {
            move_outside_solid(global.angle, 16);
        }
        my_id.maskon = global.maskon;
        my_id.maskindex = global.maskindex;
        global.done = 1;
        with (objDoorH)
        {
            solid = 0;
        }
        with (objDoorH2)
        {
            solid = 0;
        }
        my_id = instance_create(x + lengthdir_x(11, image_angle), y + lengthdir_y(11, image_angle), objBloodPool);
        my_id = instance_create(x, y, objDeadBody);
        my_id.sprite_index = sprBoss2Dead;
        my_id.image_angle = image_angle;
        sxeasy_play(global.Static);
        instance_destroy();
    }
}
energie = round(random(1));
