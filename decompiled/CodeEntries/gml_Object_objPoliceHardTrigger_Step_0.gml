if (state == 0)
{
    if (wait > 0)
    {
        wait -= 1;
    }
    else if (objEffector.amount >= 180)
    {
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
                instance_destroy();
            }
        }
        scrGetMessage(0);
        state = 1;
        wait = 30;
    }
}
if (state == 1)
{
    if (!instance_exists(objPhoneConversation))
    {
        if (wait > 0)
        {
            wait -= 1;
        }
        else
        {
            state = 2;
            with (objPlayer)
            {
                my_id = instance_create(x, y, objPlayerMouse);
                my_id.active = 0;
                my_id.sprite_index = sprite_index;
                my_id.ammo = ammo;
                my_id.maskon = 1;
                my_id.maskindex = global.maskindex;
                instance_destroy();
            }
            viewx = view_xview[0];
            viewy = view_yview[0];
            with (objEffector)
            {
                instance_destroy();
            }
            my_id = instance_create(x, y, objEffector);
            my_id.blackx = 15;
            my_id.amount = 180;
            view_xview[0] = viewx;
            view_yview[0] = viewy;
        }
    }
}
