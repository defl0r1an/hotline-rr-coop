image_speed = 0;
switch (sprite_index)
{
    case sprPAttackShotgunTurn:
        sprite_index = sprPWalkShotgun;
        break;
    case sprPUnlockDoor:
    case sprPPoliceKeycardLockOpen:
        my_id = instance_create(x, y, objPlayerMouse);
        my_id.ammo = ammo;
        global.maskon = 1;
        my_id.maskon = 1;
        instance_destroy();
        exit;
    case sprPMaskSlipOff:
        maskindex = 0;
        global.maskindex = 0;
        sprite_index = sprPMaskSlip;
        image_speed = 0.5;
        with (objBoss1Spawn)
        {
            global.myx = x;
            global.myy = y;
            instance_create(global.myx, global.myy, objBossChair);
            instance_create(global.myx + 8, global.myy + 16, objBoss1);
            my_id = instance_create(x - 24, y, objBossJacket);
            my_id.image_angle = 170 + random(20);
            instance_destroy();
        }
        exit;
    case sprPVomit:
        maskindex = 0;
        global.maskindex = 0;
        sprite_index = sprPMaskSlip;
        image_speed = 0.5;
        with (objBoss1Spawn)
        {
            global.myx = x;
            global.myy = y;
            instance_create(global.myx, global.myy, objBossChair);
            instance_create(global.myx + 8, global.myy + 16, objBoss1);
            my_id = instance_create(x - 24, y, objBossJacket);
            my_id.image_angle = 170 + random(20);
            instance_destroy();
        }
        exit;
    case sprPHeadExplode:
        with (objBloodSpeck)
        {
            instance_destroy();
        }
        with (objBloodSmudge)
        {
            instance_destroy();
        }
        with (objBloodSplat)
        {
            instance_destroy();
        }
        with (objBloodSled)
        {
            instance_destroy();
        }
        with (objBrainChunk2)
        {
            instance_destroy();
        }
        with (objBrains2)
        {
            instance_destroy();
        }
        with (objSkinPiece2)
        {
            instance_destroy();
        }
        with (objWallBlood)
        {
            instance_destroy();
        }
        scrFreeSurfaces();
        instance_destroy();
        objEffector.brus = 10;
        with (objDreamPlayer)
        {
            alarm[0] = 100;
        }
        exit;
    case sprGriffinAttackKnife:
        sprite_index = sprGriffinWalk;
        break;
    case sprGriffinAttack9mm:
        sprite_index = sprGriffinWalk;
        break;
    case sprGriffinReload9mm:
        sprite_index = sprGriffinWalk;
        ammo = 17;
        break;
    case sprPigButcherAttack:
        sprite_index = sprPigButcher;
        left = -left;
        break;
    case sprPigButcherAttackBat:
        sprite_index = sprPigButcherWalkBat;
        left = -left;
        break;
    case sprPigButcherAttackPipe:
        sprite_index = sprPigButcherWalkPipe;
        left = -left;
        break;
    case sprPigButcherAttackClub:
        sprite_index = sprPigButcherWalkClub;
        left = -left;
        break;
    case sprPigButcherAttackKnife:
        sprite_index = sprPigButcherWalkKnife;
        left = -left;
        break;
    case sprPigButcherAttackM16:
        sprite_index = sprPigButcherWalkM16;
        break;
    case sprPigButcherAttackAK:
        sprite_index = sprPigButcherWalkAK;
        break;
    case sprPigButcherAttack9mm:
        sprite_index = sprPigButcherWalk9mm;
        break;
    case sprPAttackCrowbar:
        sprite_index = sprPWalkCrowbar;
        left = -left;
        break;
    case sprPigButcherAttackShotgun:
        sprite_index = sprPigButcherWalkShotgun;
        break;
    case sprPigButcherAttackSilencer:
        sprite_index = sprPigButcherWalkSilencer;
        break;
    case sprPigButcherAttackHammer:
        sprite_index = sprPigButcherWalkHammer;
        break;
    case sprPAttackM16:
        sprite_index = sprPWalkM16;
        break;
    case sprPAttackM60:
        sprite_index = sprPWalkM60;
        break;
    case sprPAttackAks:
        sprite_index = sprPWalkAks;
        break;
    case sprPAttackSkippyMedium:
        sprite_index = sprPWalkSkippy;
        break;
    case sprPAttackKalashnikov:
        sprite_index = sprPWalkKalashnikov;
        break;
    case sprPAttackHuntingRifle:
        sprite_index = sprPWalkHuntingRifle;
        break;
    case sprPAttackShotgun:
        sprite_index = sprPWalkShotgun;
        break;
    case sprPAttackDoubleBarrel1:
        sprite_index = sprPWalkDoubleBarrel;
        break;
    case sprPAttackDoubleBarrel2:
        sprite_index = sprPWalkDoubleBarrel;
        break;
    case sprPAttackSilencer:
        sprite_index = sprPWalkSilencer;
        break;
    case sprPAttack9mm:
        sprite_index = sprPWalk9mm;
        break;
    case sprPAttackUzi:
        sprite_index = sprPWalkUzi;
        break;
    case sprPStartSilencer:
        sprite_index = sprPWalkSilencer;
        break;
    case sprPStartSilencedUzi:
        sprite_index = sprPWalkSilencedUzi;
        break;
    case sprPStartChainsaw2:
        sprite_index = sprPWalkChainsaw;
        break;
    case sprPStartLighter:
        if (room == rmSecretSewer && global.hardmode == 1)
        {
            instance_create(169, 48, objJonesEnemyCrawl);
        }
        sprite_index = sprPWalkLighter;
        image_index = 0;
        break;
    case sprPAttackSilencedUzi:
        sprite_index = sprPWalkSilencedUzi;
        break;
    case sprPAttackMagnum:
        sprite_index = sprPWalkMagnum;
        break;
    case sprPAttackScorpion:
        sprite_index = sprPWalkScorpion;
        break;
    case sprPAttackMP5:
        sprite_index = sprPWalkMP5;
        break;
    case sprPAttackToyMP5:
        sprite_index = sprPWalkToyMP5;
        break;
    case sprJacketAttackShorty1:
        sprite_index = sprJacketWalkShorty;
        break;
    case sprJacketAttackShorty2:
        sprite_index = sprJacketWalkShorty;
        break;
    case sprPAttackNailgun:
        sprite_index = sprPWalkNailgun;
        break;
    case sprPAttackPan:
        sprite_index = sprPWalkPan;
        left = -left;
        break;
    case sprPAttackPool:
        sprite_index = sprPWalkPool;
        left = -left;
        break;
    case sprPAttackPoolBroke:
        sprite_index = sprPWalkPoolBroke;
        break;
    case sprPAttackAxe:
        sprite_index = sprPWalkAxe;
        left = -left;
        break;
    case sprPAttackSledgeHammer:
        sprite_index = sprPWalkSledgeHammer;
        left = -left;
        break;
    case sprPAttackPot:
        sprite_index = sprPWalkPot;
        left = -left;
        break;
    case sprPAttackBoilingPot:
        sprite_index = sprPWalkPot;
        left = -left;
        break;
    case sprPAttackMachete:
        sprite_index = sprPWalkMachete;
        left = -left;
        break;
    case sprPAttackChainsaw:
        sprite_index = sprPWalkChainsaw;
        left = -left;
        if (HotWeaponAlpha >= 1.5)
        {
            alarm[3] = 1;
            cooldown = 1;
        }
        break;
    case sprPAttackKnife:
        sprite_index = sprPWalkKnife;
        left = -left;
        break;
    case sprPJacketAttackCleaver:
    case sprPJacketAttackCleaver2:
        sprite_index = sprPWalkCleaver;
        break;
    case sprPAttackButterfly:
        sprite_index = sprPWalkButterfly;
        left = -left;
        break;
    case sprPAttackSword:
        sprite_index = sprPWalkSword;
        left = -left;
        break;
    case sprPJacketAttackSkateboard:
        sprite_index = sprPJacketWalkSkateboard;
        left = -left;
        break;
    case sprPAttackBat:
        sprite_index = sprPWalkBat;
        left = -left;
        break;
    case sprAubreyReloadShorty1ShellLeft:
        sprite_index = sprJacketWalkShorty;
        ammo = 2;
        global.shells -= 1;
        break;
    case sprAubreyReloadShorty1ShellRight:
        sprite_index = sprJacketWalkShorty;
        ammo = 1;
        global.shells -= 1;
        break;
    case sprAubreyReloadShorty2Shells:
        sprite_index = sprJacketWalkShorty;
        ammo = 2;
        global.shells -= 2;
        break;
    case sprPThrowKnife:
        sprite_index = prevsprite;
        break;
    case sprPAttackTaser:
        sprite_index = sprPWalkTaser;
        break;
    case sprPStartChainsaw:
        image_speed = 0.4;
        sprite_index = sprPSprintChainsaw;
        if (global.hardmode == 1)
        {
            alarm[3] = 370;
        }
        else
        {
            alarm[3] = 360;
        }
        left = 1;
        HotWeaponSwitch = 1;
        HotWeaponSpeed = 0.005;
        audio_play_sound(sndDoubleChainsawAttack, 0, false);
        break;
    case sprPOverheatingChainsaw:
        image_speed = 0;
        image_index = 4;
        break;
    case sprPCoolingChainsaw:
        sprite_index = sprPWalkChainsaw;
        break;
    case sprPSprintChainsaw:
        if (global.hardmode == 1)
        {
            image_speed = 0.3 + (HotWeaponAlpha / 3);
        }
        else
        {
            image_speed = 0.4;
        }
        audio_play_sound(sndDoubleChainsawAttack, 0, false);
        break;
    case sprPAttackFlameThrower:
        sprite_index = sprPWalkFlameThrower;
        break;
    case sprPIdleFlameThrower:
        image_speed = 0.15;
        break;
    case sprPIdleLighter:
        image_speed = 0.15;
        break;
    case sprPAttackPoolBreak:
        sprite_index = sprPWalkPoolBroke;
        break;
    case sprPSkippyPunch:
        sprite_index = sprPWalkSkippy;
        image_index = 0;
        break;
    case sprPEndSkippyAim:
        sprite_index = sprPWalkSkippy;
        break;
    case sprPStartSkippyAim:
        sprite_index = sprPWalkSkippyAim;
        break;
    case sprPSkippyPunchStart:
        sprite_index = sprPSkippyPunchWalk;
        break;
    case sprPKillHeadComeOffEnd:
        throwindex = 9;
        sprite_index = sprPWalkThrow;
        break;
    case sprPKillHeadComeOffEndDodger:
        throwindex = 11;
        sprite_index = sprPWalkThrow;
        break;
    case sprPKillHeadComeOffEndDodgerG:
        throwindex = 10;
        sprite_index = sprPWalkThrow;
        break;
    case sprPAttackSkippyBig:
        sprite_index = sprPWalkSkippy;
        soundCharge = 0;
        global.chargeSkippy = 0;
        break;
    case sprPAttackSkippyLow:
        sprite_index = sprPWalkSkippy;
        break;
    case sprPKillSkippyEnd:
        image_index = 0;
        sprite_index = sprPWalkSkippy;
        break;
    case sprPIdleSkippy2End:
        sprite_index = sprPWalkSkippy;
        break;
    case sprPAttackRPG:
        sprite_index = sprPJacketWalkRPGNoRocket;
        break;
    case sprPIdleSkippy2:
        image_index = 13;
        image_speed = 0;
        break;
    case sprPSkippyExplosion:
        with (objExplosionSkippy)
        {
            instance_destroy();
        }
        global.ExplosionAnim = 0;
        sprite_index = sprPWalkPainExplosion;
        break;
}
if (sprite_index == sprPAttackClub)
{
    sprite_index = sprPWalkClub;
    left = -left;
}
if (sprite_index == sprPAttackPipe)
{
    sprite_index = sprPWalkPipe;
    left = -left;
}
if (sprite_index == sprPAttackPunch || sprite_index == sprPPushing || sprite_index == sprPJacketAttackKnuckles)
{
    sprite_index = sprPWalkUnarmed;
    left = -left;
}
if (sprite_index == sprPAttackBag)
{
    sprite_index = sprPWalkBag;
    left = -left;
}
if (sprite_index == sprPAttackDrill)
{
    sprite_index = sprPWalkDrill;
    left = -left;
}
if (sprite_index == sprPAttackTrophy)
{
    sprite_index = sprPWalkTrophy;
    left = -left;
}
if (sprite_index == sprPAttackNightStick)
{
    sprite_index = sprPWalkNightStick;
    left = -left;
}
if (sprite_index == sprPAttackThrow || sprite_index == sprPJacketKillDog)
{
    sprite_index = sprPWalkUnarmed;
}
if (sprite_index == sprPDrink)
{
    sprite_index = sprPWalkUnarmed;
}
if (sprite_index == sprPStartSkippy)
{
    sprite_index = sprPWalkSkippy;
    global.igelcutscenes = 0;
}
if (sprite_index == sprPMaskSlip)
{
    sprite_index = sprPWalkUnarmed;
    maskon = 1;
    global.maskon = 1;
    if (global.maskindex == 1)
    {
        global.transitionshadow = 1;
        dialogue = choose("Why are you coming back?", "Lets start", "I knew it", "Lets try something new", "Keep your eyes open", "Do you have weapon in your trunk?", "Back to work", "After all, youre here", "Who are we going to kill today?");
        scrSetRasmusEvent(dialogue, 5, 75);
        scrSetRasmusEvent("Hello again," + environment_get_variable("USERNAME"), 5, 0.75, "mystical");
        if (room == rmBuildingFloor1)
        {
            with (objStroller)
            {
                touch = 0;
                image_index = 1;
                image_angle = -96;
            }
        }
        if (room == rmPoliceHQFloor1)
        {
            with (objElevator)
            {
                movex = -184;
                movey = -208;
                nextroom = 162;
            }
        }
    }
    if (global.maskindex == 9)
    {
        energie = 5;
    }
    if (global.maskindex == 6)
    {
        sprite_index = sprPWalkButterfly;
        global.usedmelee[19] = 1;
        scrCheckUsedMelee();
        ammo = 0;
        global.knives = 3;
        audio_play_sound(sndDrawKnife, 0, false);
    }
    if (global.maskindex == 22)
    {
        sprite_index = sprPStartChainsaw2;
        image_speed = 0.15;
        audio_play_sound(sndChainsawStart2, 0, false);
        global.usedmelee[17] = 1;
        scrCheckUsedMelee();
        ammo = 100;
        with (objWeapon)
        {
            if (object_index == objWeapon)
            {
                if (jones == 1 && instance_number(objGasCanister) < countgas && const == 0)
                {
                    instance_create(x, y, objGasCanister);
                    instance_destroy();
                }
                else if (const == 0)
                {
                    const = 1;
                }
            }
        }
    }
    if (global.maskindex == 23)
    {
        sprite_index = sprPWalkDrill;
        global.usedmelee[13] = 1;
        scrCheckUsedMelee();
        ammo = 0;
    }
    if (global.hardmode == 1)
    {
        if (global.maskindex == 5)
        {
            sprite_index = sprPWalkCrowbar;
            global.usedmelee[9] = 1;
            scrCheckUsedMelee();
            ammo = 0;
        }
    }
    if (global.maskindex == 15)
    {
        sprite_index = sprPWalkHuntingRifle;
        global.usedgun[9] = 1;
        scrCheckUsedGuns();
        ammo = 8;
    }
    if (global.maskindex == 3)
    {
        sprite_index = sprJacketWalkShorty;
        global.usedgun[12] = 1;
        scrCheckUsedGuns();
        ammo = 2;
        global.shells = 2;
        if (global.hardmode == 1)
        {
            with (objWeapon)
            {
                if (object_index == objWeapon)
                {
                    if (aubrey == 0)
                    {
                        image_index = choose(0, 1, 6, 7, 9, 10, 11, 12, 28, 29);
                        scrGunIndexGetAmmo(image_index);
                    }
                    else
                    {
                        instance_create(x, y, objShotgunShellsSupply);
                        instance_destroy();
                    }
                }
            }
            with (objEnemyMelee)
            {
                if (object_index == objEnemyMelee)
                {
                    instance_destroy();
                }
                my_id = instance_create(x, y, objEnemyPatrol);
                my_id.sprite_index = choose(sprEWalk9mm, sprEWalkScorpion);
                if (my_id.sprite_index == sprEWalk9mm && my_id.ammoget == 0)
                {
                    my_id.ammo = 13;
                    my_id.ammoget = 1;
                }
                if (my_id.sprite_index == sprEWalkScorpion && my_id.ammoget == 0)
                {
                    my_id.ammo = 20;
                    my_id.ammoget = 1;
                }
            }
            with (objPoliceMelee)
            {
                if (object_index == objPoliceMelee)
                {
                    instance_destroy();
                }
                my_id = instance_create(x, y, objPolicePatrol);
                my_id.sprite_index = sprPoliceWalkGun;
                my_id.ammo = 13;
                my_id.ammoget = 1;
            }
            with (objPoliceMeleeStationary)
            {
                if (object_index == objPoliceMeleeStationary)
                {
                    instance_destroy();
                }
                my_id = instance_create(x, y, objPoliceStationary);
                my_id.sprite_index = sprPoliceWalkGun;
                my_id.ammo = 13;
                my_id.ammoget = 1;
            }
            with (objEnemyMeleeStationary)
            {
                if (object_index == objEnemyMeleeStationary)
                {
                    instance_destroy();
                }
                my_id = instance_create(x, y, objEnemy);
                my_id.sprite_index = choose(sprEWalk9mm, sprEWalkScorpion);
                if (my_id.sprite_index == sprEWalk9mm && my_id.ammoget == 0)
                {
                    my_id.ammo = 13;
                    my_id.ammoget = 1;
                }
                if (my_id.sprite_index == sprEWalkScorpion && my_id.ammoget == 0)
                {
                    my_id.ammo = 20;
                    my_id.ammoget = 1;
                }
            }
        }
        else
        {
            with (objWeapon)
            {
                if (object_index == objWeapon)
                {
                    image_index = choose(0, 1, 6, 7, 9, 10, 11, 12, 28, 29);
                    scrGunIndexGetAmmo(image_index);
                }
            }
        }
    }
    if (global.maskindex == 17)
    {
        sprite_index = sprPWalkMachete;
        with (objWeapon)
        {
            if (object_index == objWeapon)
            {
                image_index = choose(2, 3, 4, 5, 8, 15, 18, 19);
                ammo = 0;
            }
        }
        global.usedmelee[10] = 1;
        scrCheckUsedMelee();
    }
    if (global.maskindex == 12)
    {
        sprite_index = sprPStartSilencer;
        image_speed = 0.15;
        audio_play_sound(sndStartSilencer, 0, false);
        global.usedgun[3] = 1;
        scrCheckUsedGuns();
        ammo = 13;
    }
    if (global.maskindex == 25)
    {
        sprite_index = sprPStartSilencedUzi;
        image_speed = 0.15;
        audio_play_sound(sndStartSilencerUzi, 0, false);
        global.usedgun[8] = 1;
        scrCheckUsedGuns();
        ammo = 30;
    }
    global.usedmask[global.maskindex] = 1;
}
if (sprite_index == sprPLeaveBag)
{
    sprite_index = sprPWalkUnarmed;
    maskon = 1;
    global.maskon = 1;
}
