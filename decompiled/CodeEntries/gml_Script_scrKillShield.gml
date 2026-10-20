if (reload > 0)
{
    exit;
}
if (sprite_index == sprPLeaveBag || sprite_index == sprPTakePhone || sprite_index == sprPSprintChainsaw || sprite_index == sprPStartChainsaw || objPlayer.sprite_index == sprPOverheatingChainsaw || objPlayer.sprite_index == sprPCoolingChainsaw)
{
    exit;
}
lastweapon = scrCurrentWeapon();
lastammo = ammo;
global.throwindex = throwindex;
global.executionx = x;
global.executiony = y;
scrThroatEnemy();
if (global.test == 3)
{
    exit;
}
global.exposed = 0;
release = 0;
with (objKnockedOut)
{
    image_xscale = 3;
    image_yscale = 3;
    if (global.maskindex == 21 && (object_index == objFatKnockedOut || sprite_index == sprEMafiaDodgerGetUp))
    {
        mask_index = sprNothing;
    }
    if (object_index == objSubwayKnockedOut || sprite_index == sprEDogGetUp)
    {
        mask_index = sprNothing;
    }
}
if (ammo > 0)
{
    if (global.maskindex != 3)
    {
        if (sprite_index == sprPWalkScorpion || sprite_index == sprPWalkMP5 || sprite_index == sprPWalkMagnum || sprite_index == sprPWalkDoubleBarrel || sprite_index == sprPWalkUzi || sprite_index == sprPWalkSilencer || sprite_index == sprPWalkSilencedUzi || sprite_index == sprPWalkAks || sprite_index == sprPWalkNailgun || sprite_index == sprPWalk9mm)
        {
            if (place_meeting(x, y, objKnockedOut))
            {
                my_id = instance_create(x, y, objPlayerShieldMouse);
                my_id.dir = dir;
                my_id.ammo = ammo;
                switch (sprite_index)
                {
                    case sprPWalkScorpion:
                        my_id.sprite_index = sprPHumanShieldScorpion;
                        break;
                    case sprPWalkMagnum:
                        my_id.sprite_index = sprPHumanShieldMagnum;
                        break;
                    case sprPWalkDoubleBarrel:
                        my_id.sprite_index = sprPHumanShieldDoubleBarrel;
                        break;
                    case sprPWalkSilencer:
                        my_id.sprite_index = sprPHumanShieldSilencer;
                        break;
                    case sprPWalkMP5:
                        my_id.sprite_index = sprPHumanShieldMP5;
                        break;
                    case sprPWalkUzi:
                        my_id.sprite_index = sprPHumanShieldUzi;
                        break;
                    case sprPWalkSilencedUzi:
                        my_id.sprite_index = sprPWalkHumanShieldSilencedUzi;
                        break;
                    case sprPWalkAks:
                        my_id.sprite_index = sprPWalkHumanShieldAks;
                        break;
                    case sprPWalkNailgun:
                        my_id.sprite_index = sprPWalkHumanShieldNailgun;
                        break;
                    case sprPWalk9mm:
                        my_id.sprite_index = sprPHumanShield9mm;
                        break;
                }
                global.bottom = "";
                global.test = 0;
                with (objKnockedOut)
                {
                    if (global.test == 0)
                    {
                        if (place_meeting(x, y, objPlayer))
                        {
                            if (sprite_index == sprPoliceGetUp || sprite_index == sprPoliceGetUpLean)
                            {
                                global.bottom = "Police";
                            }
                            global.test = 1;
                            instance_destroy();
                        }
                    }
                }
                my_id.bottom = global.bottom;
                instance_destroy();
                with (objKnockedOut)
                {
                    image_xscale = 1;
                    image_yscale = 1;
                }
                exit;
            }
        }
    }
}
global.test = 0;
global.drop = 1;
if (place_meeting(x, y, objKnockedOut) && global.exposed == 0)
{
    with (objKnockedOut)
    {
        if (object_index != objFatKnockedOut && object_index != objSubwayKnockedOut && sprite_index != sprEDogGetUp)
        {
            image_xscale = 3;
            image_yscale = 3;
            if (place_meeting(x, y, objPlayer) && global.test == 0)
            {
                global.test = 2;
                if (sprite_index == sprEGetUp || sprite_index == sprPoliceGetUp || ((sprite_index == sprEMafiaGunDodgerGetUp || sprite_index == sprEMafiaDodgerGetUp) && global.maskindex == 27 && global.powerIgel == 1))
                {
                    my_id = instance_create(x, y, scrGetKill(objPlayer.sprite_index));
                    global.willemweapon = objPlayer.sprite_index;
                    global.willemammo = objPlayer.ammo;
                }
                if (sprite_index == sprEGetUpLean)
                {
                    if (global.maskindex == 27)
                    {
                        image_xscale = 1;
                        image_yscale = 1;
                        reload = 5;
                        exit;
                    }
                    if ((objPlayer.sprite_index == sprPWalkChainsaw || objPlayer.sprite_index == sprPAttackChainsaw) && objPlayer.ammo > 0)
                    {
                        my_id = instance_create(x, y, objPKillChainsawLean);
                        my_id.ammo = objPlayer.ammo - 5;
                        global.usedkill[0] = 1;
                    }
                    else if (objPlayer.sprite_index == sprPAttackDrill || objPlayer.sprite_index == sprPWalkDrill)
                    {
                        my_id = instance_create(x, y, objPKillDrillLean);
                        global.usedkill[47] = 1;
                    }
                    else
                    {
                        global.willemweapon = objPlayer.sprite_index;
                        global.willemammo = objPlayer.ammo;
                        my_id = instance_create(x, y, objEnemyHeadKick);
                        global.usedkill[1] = 1;
                    }
                    if (objPlayer.sprite_index == sprPWalkBag || objPlayer.sprite_index == sprPAttackBag)
                    {
                        my_id.bag = 1;
                        my_id.sprite_index = sprPAttackFaceKickBag;
                    }
                    else
                    {
                        my_id.bag = 0;
                    }
                    global.test = 1;
                }
                if (sprite_index == sprPoliceGetUpLean)
                {
                    if (global.maskindex == 27)
                    {
                        image_xscale = 1;
                        image_yscale = 1;
                        reload = 5;
                        exit;
                    }
                    if ((objPlayer.sprite_index == sprPWalkChainsaw || objPlayer.sprite_index == sprPAttackChainsaw) && objPlayer.ammo > 0)
                    {
                        my_id = instance_create(x, y, objPKillChainsawLean);
                        my_id.ammo = objPlayer.ammo - 5;
                        global.usedkill[0] = 1;
                    }
                    else if (objPlayer.sprite_index == sprPAttackDrill || objPlayer.sprite_index == sprPWalkDrill)
                    {
                        my_id = instance_create(x, y, objPKillDrillLean);
                        my_id.sprite_index = sprPJacketKillPoliceDrillLean;
                        global.usedkill[47] = 1;
                    }
                    else
                    {
                        global.willemweapon = objPlayer.sprite_index;
                        global.willemammo = objPlayer.ammo;
                        my_id = instance_create(x, y, objEnemyHeadKick);
                        my_id.sprite_index = sprPKillPoliceLean;
                        global.usedkill[1] = 1;
                    }
                    if (objPlayer.sprite_index == sprPWalkBag || objPlayer.sprite_index == sprPAttackBag)
                    {
                        my_id.bag = 1;
                    }
                    else
                    {
                        my_id.bag = 0;
                    }
                    global.test = 1;
                }
                if (my_id.object_index == objPBluntKill)
                {
                    if (objPlayer.sprite_index == sprPWalkCrowbar || objPlayer.sprite_index == sprPAttackCrowbar)
                    {
                        my_id.sprite_index = sprPKillCrowbar;
                    }
                    if (objPlayer.sprite_index == sprPWalkBat || objPlayer.sprite_index == sprPAttackBat)
                    {
                        global.usedkill[2] = 1;
                        my_id.sprite_index = sprPBatKill;
                    }
                    if (objPlayer.sprite_index == sprPWalkPipe || objPlayer.sprite_index == sprPAttackPipe)
                    {
                        global.usedkill[3] = 1;
                        my_id.sprite_index = sprPPipeKill;
                    }
                    if (objPlayer.sprite_index == sprPWalkClub || objPlayer.sprite_index == sprPAttackClub)
                    {
                        global.usedkill[4] = 1;
                        my_id.sprite_index = sprPClubKill;
                    }
                    if (objPlayer.sprite_index == sprPWalkBag || objPlayer.sprite_index == sprPAttackBag)
                    {
                        global.usedkill[5] = 1;
                        my_id.sprite_index = sprPBagKill;
                    }
                    if (objPlayer.sprite_index == sprPWalkPot || objPlayer.sprite_index == sprPAttackPot)
                    {
                        global.usedkill[6] = 1;
                        my_id.sprite_index = sprPKillPot;
                    }
                    if (objPlayer.sprite_index == sprPWalkPan || objPlayer.sprite_index == sprPAttackPan)
                    {
                        global.usedkill[7] = 1;
                        my_id.sprite_index = sprPKillPan;
                    }
                    if (objPlayer.sprite_index == sprPWalkNightStick || objPlayer.sprite_index == sprPAttackNightStick)
                    {
                        global.usedkill[8] = 1;
                        my_id.sprite_index = sprPNightStickKill;
                    }
                    if (objPlayer.sprite_index == sprPJacketWalkSkateboard || objPlayer.sprite_index == sprPJacketAttackSkateboard)
                    {
                        my_id.sprite_index = sprPJacketKillSkateboard2;
                    }
                    if (sprite_index == sprPoliceGetUp)
                    {
                        my_id.bottom = 1348;
                    }
                }
                if (my_id.object_index == objDennisKillKnife)
                {
                    if (objPlayer.sprite_index == sprPWalkButterfly || objPlayer.sprite_index == sprPAttackButterfly)
                    {
                        my_id.sprite_index = sprPKillButterflySpecial;
                    }
                }
                if (my_id.object_index == objPKnifeKill)
                {
                    if ((global.knives > 0 || global.infiniteknives == 1) && global.maskindex == 6)
                    {
                        if (objPlayer.sprite_index != sprPWalkKnife || objPlayer.sprite_index != sprPWalkKnife)
                        {
                            my_id.sprite_index = sprPJacketKillThrowingKnife;
                        }
                    }
                }
                my_id.image_angle = angle;
                if (sprite_index == sprPoliceGetUp)
                {
                    switch (my_id.object_index)
                    {
                        case objEnemyBash:
                            my_id1 = instance_create(x + lengthdir_x(22, my_id.image_angle), y + lengthdir_y(22, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 1 + random(2);
                            my_id.sprite_index = sprPAttackBashPolice;
                            my_id.maskindex = global.maskindex;
                            break;
                        case objPDrillKill:
                            my_id.sprite_index = sprPDrillKillPolice;
                            my_id1 = instance_create(x + lengthdir_x(22, my_id.image_angle), y + lengthdir_y(22, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 1 + random(2);
                            break;
                        case objPHeadComeOffKill:
                            my_id.enemy = 2188;
                            break;
                        case objPMacheteKill:
                            my_id1 = instance_create(x + lengthdir_x(22, my_id.image_angle), y + lengthdir_y(22, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.sprite_index = sprPJacketKillPoliceMachete;
                            break;
                        case objPKillTaser:
                            my_id1 = instance_create(x + lengthdir_x(2, my_id.image_angle), y + lengthdir_y(2, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.sprite_index = sprPJacketKillPoliceTaser;
                            break;
                        case objPAxeKill:
                            my_id.bottom = 2225;
                            break;
                        case objPSwordKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.bottom = 2652;
                            break;
                        case objPPoolKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.bottom = 2651;
                            break;
                        case objPBrokenPoolKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.bottom = 2644;
                            break;
                        case objPSledgeKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.bottom = 2650;
                            break;
                        case objPSledgeKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.bottom = 2650;
                            break;
                        case objPBoilingPotKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.bottom = 2648;
                            break;
                        case objPScissorKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.sprite_index = sprPScissorKillPolice;
                            break;
                        case objPDartKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.bottom = 2649;
                            break;
                        case objPBottleKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.sprite_index = sprPJacketKillBottlePolice;
                            break;
                        case objPKillBeer:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.sprite_index = sprPJacketKillBeerPolice;
                            break;
                        case objPBrickKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.bottom = 2643;
                            break;
                        case objPKillNinjaStar:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.sprite_index = sprPJacketKillNinjaStarPolice;
                            break;
                        case objPHammerKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.sprite_index = sprPKillHammerPolice;
                            break;
                        case objPSkateboardKill:
                            my_id1 = instance_create(x + lengthdir_x(4, my_id.image_angle), y + lengthdir_y(4, my_id.image_angle), objPoliceHat);
                            my_id1.direction = (my_id.image_angle - 10) + random(20);
                            my_id1.speed = 2 + random(1);
                            my_id.bottom = 2674;
                            break;
                        case objPChopKill:
                            my_id.bottom = 2707;
                            break;
                    }
                }
                if (my_id.object_index == objPHeadComeOffKill && sprite_index == sprEMafiaGunDodgerGetUp)
                {
                    my_id.enemy = 2601;
                    my_id.sprite_index = sprPKillHeadComeOffDodgerG;
                }
                if (my_id.object_index == objPHeadComeOffKill && sprite_index == sprEMafiaDodgerGetUp)
                {
                    my_id.enemy = 2600;
                    my_id.sprite_index = sprPKillHeadComeOffDodger;
                }
                if (my_id.object_index == objPKillChainsaw)
                {
                    my_id.ammo = objPlayer.ammo - 5;
                }
                my_id.maskon = global.maskon;
                instance_destroy();
            }
            image_xscale = 1;
            image_yscale = 1;
            scrCheckUsedKills();
        }
        else if (object_index == objFatKnockedOut && global.maskindex == 17)
        {
            image_xscale = 3;
            image_yscale = 3;
            if (place_meeting(x, y, objPlayer) && global.test == 0)
            {
                if (objPlayer.sprite_index == sprPAttackAxe || objPlayer.sprite_index == sprPWalkAxe)
                {
                    if (place_meeting(x, y, objPlayer))
                    {
                        global.test = 2;
                        my_id = instance_create(x, y, objPKillFatAxe);
                        if (sprite_index == sprEFatGunGetUp)
                        {
                            my_id.sprite_index = sprPJacketKillFatGunAxe;
                        }
                        else if (sprite_index == sprEInspectorGetUp)
                        {
                            my_id.sprite_index = sprPJacketKillInspectorAxe;
                        }
                        my_id.ammo = ammo;
                        my_id.maskindex = global.maskindex;
                        my_id.maskon = global.maskon;
                        my_id.image_angle = angle;
                        global.usedkill[43] = 1;
                        instance_destroy();
                    }
                }
                if (objPlayer.sprite_index == sprPWalkSledgeHammer || objPlayer.sprite_index == sprPAttackSledgeHammer)
                {
                    if (place_meeting(x, y, objPlayer))
                    {
                        global.test = 2;
                        my_id = instance_create(x, y, objPKillFatSledgeHammer);
                        if (sprite_index == sprEFatGunGetUp)
                        {
                            my_id.sprite_index = sprPJacketKillFatGunSledgeHammer;
                        }
                        my_id.ammo = ammo;
                        my_id.maskindex = global.maskindex;
                        my_id.maskon = global.maskon;
                        my_id.image_angle = angle;
                        global.usedkill[44] = 1;
                        instance_destroy();
                    }
                }
                if (objPlayer.sprite_index == sprPWalkSword || objPlayer.sprite_index == sprPAttackSword)
                {
                    if (place_meeting(x, y, objPlayer))
                    {
                        global.test = 2;
                        my_id = instance_create(x, y, objPKillFatKatana);
                        if (sprite_index == sprEFatGunGetUp)
                        {
                            my_id.sprite_index = sprPJacketKillFatGunKatana;
                        }
                        my_id.ammo = ammo;
                        my_id.maskindex = global.maskindex;
                        my_id.maskon = global.maskon;
                        my_id.image_angle = angle;
                        global.usedkill[45] = 1;
                        instance_destroy();
                    }
                }
                if (objPlayer.sprite_index == sprPWalkMachete || objPlayer.sprite_index == sprPAttackMachete)
                {
                    if (place_meeting(x, y, objPlayer))
                    {
                        global.test = 2;
                        my_id = instance_create(x, y, objPKillFatMachete);
                        if (sprite_index == sprEFatGunGetUp)
                        {
                            my_id.sprite_index = sprPJacketKillFatGunMachete;
                        }
                        else if (sprite_index == sprEInspectorGetUp)
                        {
                            my_id.sprite_index = sprPJacketKillInspectorMachete;
                        }
                        my_id.ammo = ammo;
                        my_id.maskindex = global.maskindex;
                        my_id.maskon = global.maskon;
                        my_id.image_angle = angle;
                        global.usedkill[46] = 1;
                        instance_destroy();
                    }
                }
                scrCheckUsedKills();
            }
        }
    }
    with (objKnockedOut)
    {
        image_xscale = 1;
        image_yscale = 1;
    }
    if (global.test == 1)
    {
        if (sprite_index == sprPAttackDrill || sprite_index == sprPWalkDrill || sprite_index == sprPWalkUnarmed || sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || ((sprite_index == sprPWalkChainsaw || sprite_index == sprPAttackChainsaw) && lastammo >= 5) || (global.hardmode == 1 && global.maskindex == 6) || (global.maskindex == 11 && global.hardmode == 0) || (global.powerIgel == 0 && global.maskindex == 27))
        {
            nothing = 1;
        }
        else
        {
            my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
            my_id.image_index = lastweapon;
            my_id.direction = dir + 70 + random(40);
            my_id.speed = 1 + random(2);
            my_id.ammo = lastammo;
        }
        instance_destroy();
        exit;
    }
    if (global.test == 2)
    {
        with (objKnockedOut)
        {
            image_xscale = 1;
            image_yscale = 1;
        }
        instance_destroy();
        exit;
    }
}
if (place_meeting(x, y, objFatKnockedOut))
{
    with (objFatKnockedOut)
    {
        image_xscale = 3;
        image_yscale = 3;
        if (global.maskindex == 2)
        {
            if (place_meeting(x, y, objPlayer) && global.test == 0 && global.exposed == 0)
            {
                global.test = 2;
                my_id = instance_create(x, y, objPKillFat);
                my_id.maskindex = global.maskindex;
                my_id.maskon = global.maskon;
                my_id.image_angle = angle;
                if (sprite_index == sprEInspectorGetUp)
                {
                    my_id.sprite = 1981;
                }
                else if (sprite_index == sprEFatGunGetUp)
                {
                    my_id.sprite = 2272;
                    my_id.ammo = ammo;
                }
                instance_destroy();
            }
        }
    }
}
if (global.test == 1)
{
    if (sprite_index == sprPAttackDrill || sprite_index == sprPWalkDrill || sprite_index == sprPWalkUnarmed || sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || ((sprite_index == sprPWalkChainsaw || sprite_index == sprPAttackChainsaw) && lastammo >= 5) || (global.hardmode == 1 && global.maskindex == 6) || (global.maskindex == 11 && global.hardmode == 0) || (global.powerIgel == 0 && global.maskindex == 27))
    {
        nothing = 1;
    }
    else
    {
        my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
        my_id.image_index = lastweapon;
        my_id.direction = dir + 70 + random(40);
        my_id.speed = 1 + random(2);
        my_id.ammo = lastammo;
    }
    instance_destroy();
    exit;
}
if (global.test == 2)
{
    with (objKnockedOut)
    {
        image_xscale = 1;
        image_yscale = 1;
    }
    with (objFatKnockedOut)
    {
        image_xscale = 1;
        image_yscale = 1;
    }
    instance_destroy();
    exit;
}
with (objKnockedOut)
{
    image_xscale = 1;
    image_yscale = 1;
    mask_index = sprMask;
}
