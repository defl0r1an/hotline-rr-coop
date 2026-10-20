if (stage == 2)
{
    with (objSubwayDoor)
    {
        if (place_meeting(x, y, objTrainTransition) && on == 3)
        {
            instance_destroy();
        }
    }
    image_index = 1;
}
