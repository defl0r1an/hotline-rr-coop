wait -= 1;
if (wait <= 0)
{
    if (!instance_exists(objPhoneConversation))
    {
        image_index += 0.15;
    }
    if (sprite_index == sprBoss2CrawlStart)
    {
        if (image_index > 8)
        {
            if (image_angle == 0)
            {
                x -= 10;
                y -= 10;
            }
            if (image_angle == 90)
            {
                x -= 10;
                y += 10;
            }
            if (image_angle == 180)
            {
                x += 10;
                y += 10;
            }
            if (image_angle == 270)
            {
                x += 10;
                y -= 10;
            }
            sprite_index = sprBoss2Crawl;
            image_index = 0;
            talked = 1;
            with (objPlayer)
            {
                my_id = instance_create(x, y, objPlayerMouseHouse);
                my_id.maskindex = maskindex;
                my_id.maskon = 1;
                my_id.sprite_index = sprite_index;
                my_id.image_speed = 12;
                my_id.ammo = ammo;
                my_id.active = 0;
                instance_destroy();
            }
            scrGetMessage(1);
        }
    }
    speed = 0;
    direction = image_angle + 90;
    if (instance_exists(objPhoneConversation))
    {
        exit;
    }
    with (objPlayerMouseHouse)
    {
        my_id = instance_create(x, y, objPlayerMouse);
        my_id.maskindex = maskindex;
        my_id.maskon = 1;
        my_id.sprite_index = sprite_index;
        my_id.image_speed = 12;
        my_id.ammo = ammo;
        if (global.hardmodemasks[11] == 0)
        {
            scrSetRasmusEvent("Use his weapon...if you can", 10, 100, "mystical");
        }
        instance_destroy();
    }
    if (sprite_index == sprBoss2Crawl)
    {
        if (image_index > 0 && image_index < 3)
        {
            speed = 0.5;
        }
        if (image_index > 5 && image_index < 9)
        {
            speed = 0.5;
        }
        if (image_index > 12)
        {
            speed = 0.5;
        }
    }
    if (speed > 0)
    {
        if (!place_free(x + lengthdir_x(16, direction), y + lengthdir_y(16, direction)))
        {
            image_angle += 10;
        }
    }
}
if (wait > -100)
{
    exit;
}
if (point_distance(x, y, objPlayer.x, objPlayer.y) < 14)
{
    if (objPlayer.sprite_index == sprPWalkClub)
    {
        with (objPlayer)
        {
            instance_destroy();
        }
        my_id = instance_create(x, y, objPClubBoss2);
        my_id.image_angle = image_angle + 90;
        instance_destroy();
        exit;
    }
    else if (objPlayer.sprite_index == sprPWalkUnarmed && global.maskindex == 2 && global.hardmode == 1)
    {
        with (objPlayer)
        {
            instance_destroy();
        }
        my_id = instance_create(x, y - 2, objPTonyBikerKill);
        my_id.image_angle = image_angle + 90;
        instance_destroy();
        exit;
    }
    else if (objPlayer.sprite_index == sprPWalkButterfly && global.maskindex == 6 && global.hardmode == 1)
    {
        with (objPlayer)
        {
            instance_destroy();
        }
        my_id = instance_create(x, y - 2, objPJacketKillBoss2Knife);
        my_id.image_angle = image_angle + 90;
        instance_destroy();
        exit;
    }
    else if (objPlayer.sprite_index == sprPWalkCleaver && global.maskindex == 11)
    {
        with (objPlayer)
        {
            instance_destroy();
        }
        my_id = instance_create(x, y - 2, objWillemBikerKill);
        my_id.image_angle = image_angle + 90;
        instance_destroy();
        exit;
    }
    else if (objPlayer.sprite_index == sprPWalkCleaver && global.maskindex == 1)
    {
        with (objPlayer)
        {
            instance_destroy();
        }
        my_id = instance_create(x, y - 2, objBoss2DeadChop);
        my_id.image_angle = image_angle + 90;
        instance_destroy();
        exit;
    }
    else if (objPlayer.sprite_index == sprPWalkUnarmed && global.maskindex == 27)
    {
        with (objPlayer)
        {
            my_id = instance_create(x, y, objPlayerMouseHouse);
            my_id.maskindex = maskindex;
            my_id.maskon = 1;
            my_id.sprite_index = sprPWalkUnarmed;
            my_id.image_speed = 0.25;
            my_id.ammo = ammo;
            my_id.active = 0;
            my_id.aimon = 0;
            instance_destroy();
        }
        my_id = instance_create(x, y, objIgelBikerKill);
        my_id.image_angle = image_angle + 90;
        instance_destroy();
        exit;
    }
    if (objPlayer.sprite_index == sprPWalkCrowbar || objPlayer.sprite_index == sprPWalkBat || objPlayer.sprite_index == sprPWalkPipe || objPlayer.sprite_index == sprPWalkPot || objPlayer.sprite_index == sprPWalkPan || objPlayer.sprite_index == sprPWalkNightStick || objPlayer.sprite_index == sprPWalkSledgeHammer || objPlayer.sprite_index == sprPJacketWalkSkateboard)
    {
        with (objPlayer)
        {
            global.weaponsprite = sprite_index;
            instance_destroy();
        }
        my_id = instance_create(x, y, objPBashBoss2);
        my_id.image_angle = image_angle + 90;
        instance_destroy();
        exit;
    }
    if (objPlayer.sprite_index == sprPWalkAxe || objPlayer.sprite_index == sprPWalkSword)
    {
        with (objPlayer)
        {
            global.weaponsprite = sprite_index;
            instance_destroy();
        }
        my_id = instance_create(x, y, objPKillAxeAndSwordBoss2);
        my_id.image_angle = image_angle + 90;
        instance_destroy();
        exit;
    }
}
