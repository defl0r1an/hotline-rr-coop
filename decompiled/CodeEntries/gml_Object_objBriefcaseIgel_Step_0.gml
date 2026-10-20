if (wait > 0)
{
    wait -= 1;
}
if (waitend > 0)
{
    waitend -= 1;
}
if (stage == 1)
{
    if (wait == 0)
    {
        audio_play_sound(sndSkippyReadyShootMedium, 0.1, false);
        lightswitch = 1;
        wait = 10;
        waitend = 40;
        stage = 2;
    }
}
if (stage == 2)
{
    if (wait == 0)
    {
        lightswitch = 0;
        lightspeed = 0.05;
    }
    if (visiblekaka == 1)
    {
        view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.15);
        view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.15);
    }
    else
    {
        if (random(10) > 5)
        {
            view_xview[0] += random_range(shake, -shake);
        }
        else
        {
            view_yview[0] += random_range(shake, -shake);
        }
        if (round(random(100)) == 2)
        {
            objEffectorHouse.brus = 2 + floor(random(8));
        }
        with (objPlayerCarEnter)
        {
            if (point_distance(x, y, objPlayer.x, objPlayer.y) < 150 && solid == 1)
            {
                objBriefcaseIgel.waitend = 190;
                audio_play_sound(sndCarEngine, 1, false);
                my_id = instance_create(x, y, objPlayerCarTroll);
                my_id.image_angle = image_angle;
                instance_destroy();
            }
        }
    }
    if (waitend == 0 && visiblekaka == 1)
    {
        objEffectorHouse.brus = 2 + floor(random(8));
        objPlayerMouseHouse.active = 1;
        objPlayerMouseHouse.aimon = 1;
        instance_create(x, y, objLightingEngine);
        my_id = instance_create(x, y, objLight);
        my_id.color = 8421504;
        my_id.targetstrength = 5;
        my_id.linked = 0;
        my_id.radius = 96;
        my_id = instance_create(objPlayerCarEnter.x, objPlayerCarEnter.y, objLight);
        my_id.color = 8421504;
        my_id.targetstrength = 1;
        my_id.linked = 1;
        my_id.radius = 120;
        if (sound == 0)
        {
            audio_play_sound(sndPickupWeapon, 0, false);
            sound = 1;
        }
        objPlayerMouseHouse.sprite_index = sprPWalkBag;
        global.igelcutscenes = -2;
        with (objBackgroundColor)
        {
            instance_destroy();
        }
        with (objСameo)
        {
            if (object_index == objIgelMystery || object_index == objNicklasBar)
            {
                if (object_index != objNicklasBar)
                {
                    instance_create(204, 93, objIgelMini);
                    my_id = instance_create(181, 297, objShoes);
                    my_id.image_index = 6;
                    my_id = instance_create(185, 298, objGloves);
                    my_id.image_index = choose(2, 3);
                    my_id = instance_create(175, 296, objGloves);
                    my_id.image_index = choose(2, 3);
                    my_id = instance_create(178, 307, objIgelClothes);
                    my_id.image_angle = 90;
                    my_id = instance_create(178, 307, objIgelHat);
                }
                instance_destroy();
                exit;
            }
            alarm[0] = 0;
            image_blend = c_black;
            image_speed = 0;
            solid = 0;
            my_id = instance_create(x, y, objBombGround);
            my_id.image_angle = random(360);
        }
        depth = -99;
        visiblekaka = 0;
    }
    if (visiblekaka == 0)
    {
        with (objLight)
        {
            if (linked == 0)
            {
                x = lerp(x, objPlayer.x, 0.1);
                y = lerp(y, objPlayer.y, 0.1);
                if (!instance_exists(objPlayerCarEnter))
                {
                    color = merge_color(c_white, c_red, objBriefcaseIgel.shake);
                    targetstrength = 1 + round(random(objBriefcaseIgel.shake * 8));
                }
            }
            if (linked == 1)
            {
                if (instance_exists(objPlayerCarTroll))
                {
                    x = lerp(x, objPlayerCarTroll.x, 0.5);
                    y = lerp(y, objPlayerCarTroll.y, 0.5);
                }
            }
        }
    }
    if (instance_exists(objBigIgel))
    {
        with (objBigIgel)
        {
            if (image_index >= 4)
            {
                if (minipop == 0)
                {
                    objEffectorHouse.brus = 12;
                    minipop = 1;
                }
                if (objEffectorHouse.brus == 0 && minipop == 1)
                {
                    room_goto(rmDream2);
                }
            }
        }
    }
}
if (instance_exists(objPlayerCarTroll))
{
    shake = lerp(shake, 1, 0.025);
}
light = lerp(light, lightswitch, 0.15);
