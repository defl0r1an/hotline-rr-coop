if (room == rmSequence13)
{
    with (objPlayerMouseHouse)
    {
        if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objLaundryBasket))
        {
            if (objLaundryBasket.clothes == 1)
            {
                objLaundryBasket.clothes = 0;
                with (objPlayerPants)
                {
                    visible = true;
                }
                with (objPlayerJacket)
                {
                    visible = true;
                }
                mouse_clear(mb_left);
            }
        }
    }
}
