if (room != rmApartment2Upstairs)
{
    exit;
}
if (!instance_exists(objPlayerMouse) || talked == 1)
{
    exit;
}
if (place_meeting(x + lengthdir_x(32, 90), y - lengthdir_y(32, 90), objPlayer) && global.hardmode == 1 && global.done == 1)
{
    talked = 1;
    if (instance_exists(objPlayerMouse))
    {
        with (objPlayerMouse)
        {
            my_id = instance_create(x, y, objPlayerMouseHouse);
            my_id.active = 0;
            my_id.sprite_index = sprite_index;
            my_id.ammo = ammo;
            global.maskon = 1;
            my_id.maskon = 1;
            my_id.image_angle = image_angle;
            instance_destroy();
        }
    }
    with (objEffector)
    {
        my_id = instance_create(x, y, objEffectorHouse);
        my_id.amount = 180;
        instance_destroy();
    }
    scrGetMessage(0);
}
