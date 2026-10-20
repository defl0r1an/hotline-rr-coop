if (keyboard_check_pressed(ord(global.restartkey)))
{
    event_perform(ev_keypress, ord("R"));
}
if (global.xbox == 1)
{
    scrXboxRestart();
}
if (active == 0 || !instance_exists(objPlayer))
{
    exit;
}
if (instance_exists(objBoss1Die))
{
    exit;
}
if (wait > 0)
{
    wait -= 1;
    exit;
}
if (state == 0)
{
    if ((objPlayer.x < 245 && objPlayer.y > 442) || point_distance(x, y, objPlayer.x, objPlayer.y) < 64)
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
                my_id.maskindex = global.maskindex;
                with (my_id)
                {
                    scrInitMaskPos();
                    scrUpdateMaskPos(sprite_index);
                }
                instance_destroy();
            }
        }
        if (objPlayer.x < 245 && objPlayer.y > 442)
        {
            scrGetMessage(2);
            scrAchievementSet("Egoist");
            scrSetRasmusEvent(choose("It will be better this way", "Right decision", "You forgot someone..."), 8, 100);
        }
        else
        {
            scrGetMessage(3);
        }
        state = 1;
    }
}
if (state == 1)
{
    if (!instance_exists(objPhoneConversation))
    {
        image_speed = 0;
        state = 2;
        image_index = 0;
        with (objPlayer)
        {
            active = 1;
        }
        scrSetRasmusEvent(choose("Are you sure?", "You will regret it...", "You know how it will end"), 8, 100);
    }
    else
    {
        image_speed = 0.1;
        sprite_index = sprGirlfriendTalk;
    }
}
if (state == 2)
{
    global.test = 0;
    pickup = 0;
    if (global.xbox == 1)
    {
        if (gettrigger_r(0) > 100 || gettrigger_l(0) > 100)
        {
            pickup = 1;
        }
    }
    else if (mouse_check_button_pressed(mb_right) || mouse_check_button(mb_left))
    {
        pickup = 1;
    }
    if (pickup == 1)
    {
        with (objPlayer)
        {
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objGirlfriend))
            {
                if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || sprite_index == sprPJacketAttackKnuckles)
                {
                    noweapon = 1;
                }
                else
                {
                    noweapon = 0;
                }
                if (noweapon == 0)
                {
                    my_id = instance_create(x, y, objWeapon);
                    my_id.direction = direction - 45;
                    my_id.speed = 1 + random(1);
                    my_id.friction = 0.2;
                    my_id.image_index = scrCurrentWeapon();
                }
                sprite_index = sprPWalkGirlfriend;
                instance_create(x, y, objGoToCar);
                scrUpdateMaskPos(sprite_index);
                with (objDoorV)
                {
                    solid = 0;
                }
                global.test = 1;
            }
        }
    }
    if (global.test == 1)
    {
        instance_destroy();
    }
}
