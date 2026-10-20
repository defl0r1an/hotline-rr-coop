if (!place_free(x, y))
{
    speed = 0;
}
if (speed == 0)
{
    if (state == 0)
    {
        if (wait > 0)
        {
            wait -= 1;
        }
        else
        {
            if (instance_exists(objPlayerMouse))
            {
                with (objPlayerMouse)
                {
                    my_id = instance_create(x, y, objPlayerMouseHouse);
                    my_id.active = 0;
                    my_id.sprite_index = sprite_index;
                    my_id.ammo = ammo;
                    my_id.image_index = floor(sprite_get_number(sprite_index));
                    global.maskon = 1;
                    my_id.maskon = 1;
                    with (my_id)
                    {
                        scrPlayerAnimationEnd();
                    }
                    instance_destroy();
                }
            }
            with (objEffector)
            {
                my_id = instance_create(x, y, objEffectorHouse);
                my_id.amount = 180;
                instance_destroy();
            }
            if (sprite_index == sprAssassinTalk)
            {
                scrGetMessage(2);
            }
            if (sprite_index == sprAssassinTalkShot || sprite_index == sprAssassinTalkKnife)
            {
                scrGetMessage(3);
            }
            if (sprite_index == sprAssassinTaser)
            {
                scrGetMessage(4);
            }
            state = 1;
            wait = 30;
        }
    }
    if (state == 1)
    {
        if (!instance_exists(objPhoneConversation))
        {
            if (sprite_index == sprAssassinTaser)
            {
                image_speed = 0;
            }
            if (wait > 0)
            {
                wait -= 1;
            }
            else
            {
                with (objPlayerMouseHouse)
                {
                    my_id = instance_create(x, y, objPlayerMouse);
                    my_id.active = 0;
                    my_id.sprite_index = sprite_index;
                    my_id.image_index = floor(sprite_get_number(my_id.sprite_index));
                    my_id.ammo = ammo;
                    global.maskon = 1;
                    my_id.maskon = 1;
                    with (my_id)
                    {
                        scrPlayerAnimationEnd();
                    }
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
                state = 2;
            }
        }
    }
}
if (state == 2)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 6)
    {
        with (objPlayer)
        {
            if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || sprite_index == sprPJacketAttackKnuckles)
            {
                nothing = 1;
            }
            else
            {
                global.executionx = objPlayer.x;
                global.executiony = objPlayer.y;
                my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                my_id.direction = dir + 70 + random(40);
                my_id.speed = 1 + random(2);
                my_id.ammo = ammo;
            }
            instance_destroy();
        }
        my_id = instance_create(x, y, objAssassinDie);
        my_id.image_angle = image_angle;
        if (sprite_index == sprAssassinTalk || sprite_index == sprAssassinTaser)
        {
            my_id.shot = 0;
        }
        if (sprite_index == sprAssassinTalkShot)
        {
            my_id.shot = 1;
        }
        if (sprite_index == sprAssassinTalkKnife)
        {
            my_id.shot = 2;
        }
        instance_destroy();
    }
}
