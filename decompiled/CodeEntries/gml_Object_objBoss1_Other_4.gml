with (objSurveillanceCamera)
{
    observer = 0;
}
i = 0;
repeat (global.weaponsaveground)
{
    if (instance_number(objWeapon) < global.weaponsaveground)
    {
        if (!place_meeting(global.weaponsavegroundx[i], global.weaponsavegroundy[i], objWeapon))
        {
            my_id = instance_create(global.weaponsavegroundx[i], global.weaponsavegroundy[i], objWeapon);
            my_id.decadenced = 1;
            if (round(random(100)) <= 50)
            {
                my_id.image_index = choose(1, 6);
                if (my_id.image_index == 1)
                {
                    my_id.ammo = 6;
                }
                if (my_id.image_index == 6)
                {
                    my_id.ammo = 2;
                }
            }
            with (objWeapon)
            {
                if (decadenced == 0)
                {
                    instance_destroy();
                }
            }
        }
    }
    i++;
}
