if (place_meeting(x, y, objBloodPool))
{
    bloodsled = 1;
}
if (myxspeed != 0 || myyspeed != 0)
{
    if (bloodstep > 0)
    {
        bloodstep -= 1;
    }
    else if (bloodsled > 0)
    {
        my_id = instance_create(x, y, objLegSled);
        my_id.image_speed = 0;
        my_id.sprite_index = sprLegSleds;
        if (bloodscale == 1)
        {
            my_id.image_index = 0;
        }
        else
        {
            my_id.image_index = 1;
        }
        my_id.image_angle = legdir;
        my_id.image_alpha = bloodsled;
        bloodsled -= random_range(0.05, 0.1);
        bloodstep = 10;
        bloodscale = -bloodscale;
    }
    idletimer = 900;
}
else if (idletimer > 0 && maskon == 1)
{
    idletimer--;
}
else if (maskon == 1)
{
    if (round(random(18)) == 1)
    {
        scrSetRasmusEvent("He is deeper underground", 666, 100, "mystical");
    }
    else
    {
        scrSetRasmusEvent(choose("What are you trying to say?", "Are you going to just stand here?", "Are you still there?", "There is no idle animnation", "You know what? Fuck you", "Time doesnt stretch", "Are you waiting for something?"), 0, 100);
    }
    idletimer = 2700;
}
if (sprite_index == sprPLeaveBag)
{
    dir = point_direction(x, y, objDumpster.x + 20, objDumpster.y + 12);
}
if (global.xbox == 1)
{
    dir = scrXboxPlayerLook();
}
else
{
    dir = point_direction(x, y, global.mousex, global.mousey);
}
if (room == rmTrailer)
{
    x = objFix.x;
    y = objFix.y;
}
if (colorredux > 0)
{
    colorredux -= 1;
}
scrAmmoFix();
if (global.xbox == 1)
{
    scrXboxPlayerMouse();
}
if (sprite_index == sprPMaskSlipOff)
{
    exit;
}
if (sprite_index == sprPSkippyPunchStart && image_index > 2 && audioskippy == 0)
{
    audio_play_sound(sndSwing2, 0, false);
    audioskippy = 1;
}
if (sprite_index == sprPSkippyPunchStart && image_index > 7 && audioskippy == 1)
{
    audio_play_sound(sndSwing1, 0, false);
    audioskippy = 2;
}
if (sprite_index == sprPAttackSledgeHammer && round(image_index) == 5)
{
    impact = 5;
    impside = 8;
    if (global.maskindex == 5)
    {
        impact *= 2.35;
    }
}
if (sprite_index == sprPWalkBoilingPot)
{
    if (round(random(5)) == 2)
    {
        instance_create(x + lengthdir_x(11, dir - (33 * left)), y + lengthdir_y(11, dir - (33 * left)), objSteam);
    }
}
if (sprite_index == sprPAttackChainsaw)
{
    if (round(random(5)) == 2)
    {
        instance_create(x + lengthdir_x(11, dir - (33 * left)), y + lengthdir_y(11, dir - (33 * left)), objSteam);
    }
}
if (sprite_index == sprPStartChainsaw && (image_index == 3.08 || image_index == 9.02))
{
    repeat (6 + round(random(2)))
    {
        my_id = instance_create(x + lengthdir_x(5, dir - (90 * left)), y + lengthdir_x(5, dir - (90 * left)), objSteam);
        my_id.speed = 1 + random(1);
        my_id.friction = 0.1;
        my_id.direction = dir - (90 * left);
    }
}
if (sprite_index == sprPStartChainsaw2 && (image_index == 7.1 || round(image_index) == 16))
{
    if (image_index == 7.1)
    {
        repeat (2 + round(random(1)))
        {
            my_id = instance_create(x + lengthdir_x(5, dir + (90 * left)), y + lengthdir_x(5, dir + (90 * left)), objSteam);
            my_id.speed = 1 + random(1);
            my_id.friction = 0.1;
            my_id.direction = dir + (90 * left);
        }
    }
    else if (round(random(2)) == 1)
    {
        my_id = instance_create(x + lengthdir_x(5, dir + (90 * left)), y + lengthdir_x(5, dir + (90 * left)), objSteam);
        my_id.speed = 1 + random(1);
        my_id.friction = 0.1;
        my_id.direction = dir + (90 * left);
    }
}
if (sprite_index == sprPSprintChainsaw)
{
    if (round(random(6)) == 2)
    {
        instance_create(x + lengthdir_x(11, dir), y + lengthdir_y(11, dir), objSteam);
    }
}
if (sprite_index == sprPOverheatingChainsaw)
{
    if (round(random(5)) == 2)
    {
        instance_create(x + lengthdir_x(11, dir - (33 * left)), y + lengthdir_y(11, dir - (33 * left)), objSteam);
    }
}
if (sprite_index == sprPWalkFlameThrower || sprite_index == sprPIdleFlameThrower)
{
    left = 1;
}
if (myyspeed == 0 && myxspeed == 0 && sprite_index == sprPWalkFlameThrower && ammo != 0)
{
    sprite_index = sprPIdleFlameThrower;
    image_speed = 0.15;
    image_index = 0;
}
else if (sprite_index == sprPIdleFlameThrower && (myyspeed != 0 || myxspeed != 0))
{
    sprite_index = sprPWalkFlameThrower;
    image_speed = 0;
    image_index = 0;
}
if (myyspeed == 0 && myxspeed == 0 && sprite_index == sprPWalkLighter)
{
    sprite_index = sprPIdleLighter;
    image_speed = 0.15;
    image_index = 0;
}
else if (sprite_index == sprPIdleLighter && (myyspeed != 0 || myxspeed != 0))
{
    sprite_index = sprPWalkLighter;
    image_speed = 0;
    image_index = 0;
}
if ((sprite_index == sprPWalkFlameThrower || sprite_index == sprPAttackFlameThrower || sprite_index == sprPIdleFlameThrower) && mouse_check_button(mb_left) && ammo > 0)
{
    flamethrower = 1;
}
else if (flamethrower == 1)
{
    audio_stop_sound(sndFlameThrower);
    audio_play_sound(sndFlameThrowerEnd, 0, false);
    flamethrower = 0;
}
if (sprite_index == sprPAttackShotgunTurn && image_index == 7.2)
{
    my_id = instance_create(x + lengthdir_x(5, dir - (5 * left)), y + lengthdir_y(5, dir - (5 * left)), objShell);
    my_id.sprite_index = sprShotgunShell;
    my_id.image_angle = dir;
    my_id.direction = ((griffinaccuracy + dir) - (90 * left) - 20) + random(30);
    my_id.speed = 1 + random(3);
}
if (objPlayerMouse.meleeenergie > global.meleeenergie)
{
    objPlayerMouse.meleeenergie = global.meleeenergie;
}
if (sprite_index == sprPigButcherShoot)
{
    if (!mouse_check_button(mb_left))
    {
        if (image_index > 0.2)
        {
            image_index -= 0.2;
        }
        else
        {
            image_index = 0;
            sprite_index = sprPigButcherWalkMP5;
        }
    }
}
if (room == rmTrainstationDownstairs || room == rmPoliceHQFloor3 || room == rmPoliceHQFloor3TigerHard || instance_exists(objVan) || room == rmPhoneHomUpstairs)
{
    clear = 1;
}
if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objECrawl) + instance_number(objMiscEnemy) + instance_number(objBoss) + instance_number(objEHideM16) + instance_number(objEBullet)) == 0)
{
    test = 1;
    if (room == rmHotelEntrance || room == rmHotel1)
    {
        if (objFatmanEating.sprite_index == sprDeputyFatmanEating || objFatmanEating.sprite_index == sprDeputyFatmanEatingGiveUp || objFatmanTelephone.sprite_index == sprDeputyFatmanTelephone || objFatmanTelephone.sprite_index == sprDeputyFatmanTelephoneGiveUp)
        {
            test = 0;
        }
    }
    if (room == rmHotelSuite || room == rmHotel3)
    {
        if (objFatmanShit.sprite_index == sprDeputyFatmanShit || objFatmanShit.sprite_index == sprDeputyFatmanShitGiveUp)
        {
            test = 0;
        }
    }
    if (room == rmSecretSewer || (instance_exists(objTrainTransition) && objTrainTransition.stage != 2))
    {
        test = 0;
    }
    if (test == 1)
    {
        if (clear == 0 && global.done == 0 && room != rmApartment1Entrance && room != rmPoliceHQShootingRange && !instance_exists(objDogPatrolFriend))
        {
            clear = 1;
            my_id = instance_create(x, y, objCheckpoint);
            if (global.maskindex == 19)
            {
                my_id.text = "ZONE CLAIR";
            }
            else
            {
                my_id.text = "STAGE CLEAR";
            }
        }
    }
}
else
{
    clear = 0;
}
if (global.xbox == 0)
{
    aimfar = keyboard_check_direct(vk_shift);
}
else
{
    aimfar = checkbutton(0, getid(9));
}
if (global.ShiftLook == 1)
{
    aimfar = 1;
}
global.test = 0;
with (objWeapon)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32)
    {
        scrGunIndexGetMaxAmmo(image_index);
        global.test = 2;
    }
}
if (place_meeting(x, y, objKnockedOut))
{
    global.test = 1;
}
objEffector.action = global.test;
if (throwreload > 0)
{
    throwreload -= 1;
}
if (global.maskindex != 7)
{
    if (aimfar)
    {
        if (sprite_index == sprPWalkHuntingRifle || sprite_index == sprPAttackHuntingRifle)
        {
            factor = 2;
        }
        else
        {
            factor = 1;
        }
        if (global.xbox == 1)
        {
            viewx = objPlayer.x + (rightthumb_x(0) * 0.0045);
            viewy = objPlayer.y - (rightthumb_y(0) * 0.003);
        }
        else if (global.hardmode == 0)
        {
            viewx = objPlayer.x + ((((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width()) * factor);
            viewy = objPlayer.y + ((((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height()) * factor);
        }
        else
        {
            viewx = objPlayer.x - ((((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width()) * factor);
            viewy = objPlayer.y - ((((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height()) * factor);
        }
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy) * 0.1;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy);
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
    }
    else
    {
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir)) * 0.1;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir));
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
    }
}
else if (global.maskon == 1)
{
    if (!instance_exists(objMaskMenu))
    {
        view_xview[0] = lerp(view_xview[0], GeorgeCamX, 0.065);
        view_yview[0] = lerp(view_yview[0], GeorgeCamY, 0.065);
        if (George == 0)
        {
            view_wview[0] = lerp(view_wview[0], room_width, 0.065);
            view_hview[0] = lerp(view_hview[0], room_height, 0.065);
        }
        else
        {
            view_wview[0] = lerp(view_wview[0], GeorgeCamW, 0.065);
            view_hview[0] = lerp(view_hview[0], GeorgeCamH, 0.065);
        }
    }
    viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir)) * 0.1;
    viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir));
    if (room == rmEurogamer)
    {
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
    }
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
}
xview = view_xview[0];
yview = view_yview[0];
if (persistent == true && objEffector.fade == 1)
{
    if (place_free(x + addx, y))
    {
        x += addx;
    }
    if (place_free(x, y + addy))
    {
        y += addy;
    }
    if (image_speed == 0)
    {
        image_index += 0.15;
    }
    legindex += 0.4;
    exit;
}
impact = lerp(impact, 0, 0.25);
impx = lengthdir_x(impside, dir) + x;
impy = lengthdir_y(impside, dir) + y;
if (place_meeting(impx, impy, objShootThrough) || place_meeting(impx, impy, objElevator) || place_meeting(impx, impy, objTeleporter) || place_meeting(impx, impy, objElevator) || place_meeting(impx, impy, objTransitioner) || place_meeting(impx, impy, objCorner) || place_meeting(impx, impy, objSolid) || place_meeting(impx, impy, objFurniture) || (place_meeting(impx, impy, objHorBarrier) && objHorBarrier.solid == 1) || (place_meeting(impx, impy, objVertBarrier) && objVertBarrier.solid == 1) || place_meeting(impx, impy, objShootThrough) || place_meeting(x, y, objEffector) || place_meeting(impx, impy, objGlassPanelVBroken) || place_meeting(impx, impy, objGlassPanelHBroken) || place_meeting(impx, impy, objSubwayDoor) || global.impact == 0)
{
    impx = x;
    impy = y;
    impact = 0;
}
move_towards_point(impx, impy, impact);
scrPlayerMoveKeyboard();
scrPlayerIsAttacking();
scrPlayerIsPunching();
if (global.maskindex == 3)
{
    scrFlipShotgun();
}
draw_set_font(fntScore);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_color(c_black);
scrCheckKnifeCombo();
if (global.maskindex == 7 && global.maskon == 1)
{
    scrGeorgeCam();
}
if (global.maskindex == 13 && global.hardmode == 1 && global.done == 0 && instance_exists(objPlayer) && !instance_exists(objVan))
{
    if (global.killscoresave < global.killscore && global.killscored == 0)
    {
        global.killscored = 1;
    }
    if (global.combo == 0 && global.combotime == 0 && global.killscored != 0 && instance_number(objEnemy) > 0)
    {
        if (instance_exists(objClubOwner))
        {
            if (objClubOwner.state < 1)
            {
                instance_destroy();
                instance_create(x, y, objPlayerDead);
                objPlayerDead.sprite_index = sprPJacketHeadBlow;
                objPlayerDead.image_speed = 0.2;
                objPlayerDead.image_angle = dir;
                my_id = instance_create(x + lengthdir_x(2, (dir - 40) + random(80)), y + lengthdir_y(2, (dir - 40) + random(80)), objMaskDrop);
                my_id.image_index = global.maskindex;
                my_id.direction = (dir - 40) + random(80);
                my_id.speed = 1.5 + random(0.5);
            }
        }
        else
        {
            instance_destroy();
            instance_create(x, y, objPlayerDead);
            objPlayerDead.sprite_index = sprPJacketHeadBlow;
            objPlayerDead.image_speed = 0.2;
            objPlayerDead.image_angle = dir;
            my_id = instance_create(x + lengthdir_x(2, (dir - 40) + random(80)), y + lengthdir_y(2, (dir - 40) + random(80)), objMaskDrop);
            my_id.image_index = global.maskindex;
            my_id.direction = (dir - 40) + random(80);
            my_id.speed = 1.5 + random(0.5);
        }
    }
}
HotWeaponAlpha = lerp(HotWeaponAlpha, HotWeaponSwitch, HotWeaponSpeed);
if (sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Hot")))
{
    HotWeapon = asset_get_index(sprite_get_name(sprite_index) + "Hot");
}
else
{
    HotWeaponAlpha = 0;
}
dog = instance_number(objEnemy) + instance_number(objKnockedOut);
global.dogcheck = instance_number(objDogPatrol) + instance_number(objDogPatrolFriend);
if ((dog - global.dogcheck) == 0 && global.maskindex == 8)
{
    global.dog = -1;
}
if (mouse_check_button_released(mb_left) && ammo > 0)
{
    click = 0;
}
if (mouse_check_button_released(mb_left))
{
    emptyclick = 0;
}
if (mouse_check_button(mb_right))
{
    clampClick = 1;
    if (sprite_index == sprPWalkSkippyAim || sprite_index == sprPStartSkippyAim)
    {
        global.chargeSkippy = lerp(global.chargeSkippy, 1, 0.0255);
        if (global.chargeSkippy <= 0.9)
        {
            global.GlowCharge = global.chargeSkippy / 2;
        }
        global.zoomwview = lerp(global.zoomwview, global.wview / 5, 0.25);
        global.zoomhview = lerp(global.zoomhview, global.hview / 5, 0.25);
    }
}
else
{
    clampClick = 0;
    global.chargeSkippy = lerp(global.chargeSkippy, 0, 0.025);
    global.GlowCharge = global.chargeSkippy;
    if (global.chargeSkippy <= 0.9)
    {
        soundCharge = 0;
    }
}
if (!mouse_check_button(mb_middle) && !keyboard_check(ord("F")))
{
    if (sprite_index == sprPSkippyPunchWalk)
    {
        global.shake = 1;
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        audioskippy = 0;
        impact = 4;
        impside = 8;
        reload = 25;
        image_speed = 0.25;
        sprite_index = sprPSkippyPunch;
        image_index = 0;
    }
}
if (sprite_index == sprPSkippyPunchWalk || sprite_index == sprPSkippyPunchStart)
{
    global.zoomwview = lerp(global.zoomwview, global.wview / 4, 0.17);
    global.zoomhview = lerp(global.zoomhview, global.hview / 4, 0.17);
}
if ((!mouse_check_button(mb_right) || sprite_index == sprPAttackSkippyBig) && global.maskindex != 7 && global.deadIgel == 0)
{
    global.zoomwview = lerp(global.zoomwview, 0, 0.15);
    global.zoomhview = lerp(global.zoomhview, 0, 0.15);
}
if (soundCharge == 0 && global.chargeSkippy >= 0.9)
{
    audio_play_sound(sndSkippyReadyShootBig, 0, false);
    global.GlowCharge = 1;
    soundCharge = 1;
}
if (clampClick == 0 && sprite_index == sprPWalkSkippyAim)
{
    image_index = 0;
    sprite_index = sprPEndSkippyAim;
    image_speed = 0.25;
}
if (myyspeed == 0 && myxspeed == 0 && sprite_index == sprPWalkSkippy)
{
    waitidle += 1;
    if (waitidle >= 450 && round(random(120)) == 1)
    {
        sprite_index = sprPIdleSkippy2;
        image_speed = 0.2;
        image_index = 0;
        waitidle = 0;
    }
}
else if (myyspeed != 0 || myxspeed != 0)
{
    waitidle = 0;
    if (sprite_index == sprPIdleSkippy2)
    {
        sprite_index = sprPIdleSkippy2End;
        image_speed = 0.2;
        image_index = 0;
    }
}
if (global.EnergieSkippyGun <= -1)
{
    if (instance_exists(objBackgroundColor) && objBackgroundColor.lifeIgel != 0)
    {
        objBackgroundColor.lifeIgel -= 1;
        if (random(10) < 5)
        {
            global.IgelEmotions = "IgelAngry";
            global.IgelEmotionsimageindex = 0;
            global.IgelEmotionsWait = 0;
            global.IgelEmotionsEnd = 0;
        }
    }
    global.BuffSkippy = 0;
    audio_play_sound(sndPunchSkippyReset, 0, false);
    global.EnergieSkippyGun = 2 + global.hardmode;
}
if (waitdeadIgel > 0)
{
    waitdeadIgel -= 1;
}
if (global.deadIgel == 1)
{
    if (instance_exists(objEffector))
    {
        objEffector.playeroncareffector = 1;
    }
    if (deadIgel == 0)
    {
        global.blink = 1.2;
        waitdeadIgel = 60;
        sprite_index = sprPSkippyExplosion;
        image_index = 0;
        audio_play_sound(sndHeadshot, 0, false);
        instance_create(x + lengthdir_x(25, dir - (5 * left)), y + lengthdir_y(25, dir - (5 * left)), objExplosionSkippy);
        repeat (7)
        {
            my_id = instance_create(x + lengthdir_x(25, dir - (5 * left)), y + lengthdir_y(25, dir - (5 * left)), objSkinPiece2);
            my_id.image_xscale = 1;
            my_id.image_yscale = 1;
            my_id.direction = image_angle + random(360);
            my_id.speed = 2 + random(1.5);
            my_id.image_angle = my_id.direction;
            if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
            {
                my_id.decadenced = 1;
            }
        }
        repeat (4)
        {
            my_id = instance_create(x + lengthdir_x(25, dir - (5 * left)), y + lengthdir_y(25, dir - (5 * left)), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
            {
                my_id.decadenced = 1;
            }
            my_id.image_angle = (dir - 20) + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
            my_id = instance_create(x + lengthdir_x(25, dir - (5 * left)) + random(6), y + lengthdir_y(25, dir - (5 * left)) + random(6), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x, y, my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = 1 + random(5);
            if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
            {
                my_id.decadenced = 1;
            }
        }
        repeat (4)
        {
            my_id = instance_create(x + lengthdir_x(25, dir - (5 * left)), y + lengthdir_y(25, dir - (5 * left)), objBloodSquirt);
            my_id.image_angle = (image_angle - 40) + random(80);
            if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
            {
                my_id.decadenced = 1;
            }
        }
        i = 0;
        repeat (4)
        {
            my_id = instance_create(x + lengthdir_x(25, dir - (5 * left)), y + lengthdir_y(25, dir - (5 * left)), objBrokenWeaponSkippy);
            my_id.speed = 3 + random(2);
            my_id.direction = random(360);
            my_id.image_index = i;
            i += 1;
        }
        my_id = instance_create(x, y, objBigIgel);
        my_id.Emotion = "KillPlayerCutScene";
        deadIgel = 1;
    }
    energie = 10;
    if (round(random(120)) == 2)
    {
        my_id = instance_create((x - 10) + random(20), (y - 10) + random(20), objBloodSplat);
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
    }
    if (waitdeadIgel >= 60)
    {
        speeddeadIgel = lerp(speeddeadIgel, 1.75, 0.025);
        zoomdeadIgel = lerp(zoomdeadIgel, 4, 0.025);
    }
    else
    {
        speeddeadIgel = lerp(speeddeadIgel, 0, 0.015);
        zoomdeadIgel = lerp(zoomdeadIgel, 2, 0.005);
    }
    global.deadScreenIgelSpeed += clamp(0.25 + (global.deadScreenIgelSpeed / 36), 0, 6);
    global.deadScreenIgel = lerp(global.deadScreenIgel, 1, 0.05);
    global.IgelEmotions = "IgelPain";
    global.zoomwview = lerp(global.zoomwview, global.wview / zoomdeadIgel, 0.25);
    global.zoomhview = lerp(global.zoomhview, global.hview / zoomdeadIgel, 0.25);
    impact = global.ExplosionImpact;
    impside = -8;
    image_speed = global.ExplosionAnim;
}
