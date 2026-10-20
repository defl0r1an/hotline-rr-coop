if (gettrigger_l(0) > 100)
{
    if (pressltrig == 0)
    {
        pressltrig = 1;
        if (place_meeting(x, y, objPlayer))
        {
            with (objPlayer)
            {
                if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || sprite_index == sprPAttackBash)
                {
                    noweapon = 1;
                }
                else
                {
                    noweapon = 0;
                }
                if (noweapon == 0)
                {
                    my_id = instance_create(x, y, objWeaponThrow);
                    my_id.direction = random(360);
                    my_id.speed = 2 + random(1);
                    my_id.image_index = scrCurrentWeaponExt(sprite_index);
                    my_id.ammo = ammo;
                }
            }
            objPlayer.sprite_index = sprPWalkBag;
            my_id = instance_create(x, y, objCheckpoint);
            if (global.maskindex == 19)
            {
                my_id.text = "ZONE CLAIR";
            }
            else
            {
                my_id.text = "STAGE CLEAR";
            }
            instance_destroy();
            global.done = 1;
            instance_create(x, y, objTrainshake);
        }
    }
}
else
{
    pressltrig = 0;
}
