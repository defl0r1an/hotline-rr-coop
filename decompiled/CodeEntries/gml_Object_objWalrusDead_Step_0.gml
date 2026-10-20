if (!event && global.done && room == rmApartment2Upstairs && global.hardmodemasks[21] == 0)
{
    scrSetRasmusEvent(choose("End his sufferings..."), 9, 100, "mystical");
    event = 1;
}
if (instance_exists(objPlayerMouseHouse) && talked == 1 && !instance_exists(objPhoneConversation))
{
    if (time > 0)
    {
        time -= 1;
    }
}
if (time == 0)
{
    if (instance_exists(objPlayerMouseHouse))
    {
        with (objPlayerMouseHouse)
        {
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.active = 0;
            my_id.sprite_index = sprite_index;
            my_id.ammo = ammo;
            global.maskon = 1;
            my_id.maskon = 1;
            my_id.image_angle = image_angle;
            instance_destroy();
        }
    }
    with (objEffectorHouse)
    {
        my_id = instance_create(x, y, objEffector);
        my_id.amount = 180;
        instance_destroy();
    }
    instance_create(x, y, objWalrusDeadTalked);
    instance_destroy();
}
