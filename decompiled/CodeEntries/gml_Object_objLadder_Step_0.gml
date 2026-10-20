if (global.done == 1)
{
    if (place_meeting(x - 8, y, objPlayerBiker))
    {
        with (objPlayerBiker)
        {
            instance_destroy();
        }
        instance_create(x, y, objBikerClimbUp);
    }
    if (place_meeting(x, y + 8, objPlayerMouseHouse))
    {
        instance_create(x, y, objPlayerClimbUp);
        with (objPlayerMouseHouse)
        {
            objPlayerClimbUp.image_angle = image_angle;
            instance_destroy();
        }
    }
    if (place_meeting(x, y + 8, objPlayerMouse))
    {
        instance_create(x, y, objPlayerClimbUp);
        with (objPlayerMouse)
        {
            objPlayerClimbUp.image_angle = image_angle;
            instance_destroy();
        }
    }
}
