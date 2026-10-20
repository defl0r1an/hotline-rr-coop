if (place_meeting(x, y, objToken))
{
    with (objToken)
    {
        audio_play_sound(sndToken, 0, false);
        my_id = instance_create(x, y, objLetterFound);
        my_id.text = '"' + scrGetTokenLetter(letter) + '"';
        global.letter[letter] = 1;
        scrSaveUnlocked();
        instance_destroy();
    }
    exit;
}
if (place_meeting(x, y, objToken_new))
{
    with (objToken_new)
    {
        audio_play_sound(sndToken, 0, false);
        my_id = instance_create(x, y, objLetterFound);
        my_id.text = '"' + scrGetTokenLetter(letter) + '"';
        global.letter[letter] = 1;
        scrSaveUnlocked();
        instance_destroy();
    }
    exit;
}
with (objBrokenWeaponSkippy)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32)
    {
        if (GlowSkippy == 0 && image_index == 3 && glow > 0)
        {
            audio_play_sound(sndToken, 0, false);
            my_id = instance_create(x, y, objLetterFound);
            my_id.text = '"super pop"';
            global.puzzleIgel = 1;
            scrSaveUnlocked();
            instance_destroy();
        }
        else
        {
            exit;
        }
    }
}
with (objShootingRangeAmmo)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32 && active)
    {
        image_index = scrCurrentWeaponExt(objPlayer.sprite_index);
        temp = scrGunIndexGetMaxAmmo();
        if (objPlayer.ammo == 0)
        {
            objPlayer.ammo = temp;
            audio_play_sound(sndPickupWeapon, 0, false);
        }
        exit;
    }
}
if (global.masks[26] == 0 && room == rmAlley)
{
    if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSecretMask) || place_meeting(x, y, objSecretMask))
    {
        with (objSecretMask)
        {
            global.masks[26] = 1;
            scrCheckMasks();
            global.newmask[global.newmasks] = 26;
            global.newmasks += 1;
            audio_play_sound(sndToken, 0, false);
            my_id = instance_create(x, y, objLetterFound);
            my_id.text = '"' + scrMaskGetName(26) + '"';
            instance_destroy();
        }
        exit;
    }
}
if (room == rmApartment2Upstairs && global.hardmode == 1)
{
    if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSecretMask) || place_meeting(x, y, objSecretMask))
    {
        with (objSecretMask)
        {
            global.hardmodemasks[21] = 1;
            audio_play_sound(sndToken, 0, false);
            my_id = instance_create(x, y, objLetterFound);
            my_id.text = '"' + scrMaskGetName(31) + '"';
            scrAchievementSet("Tusk");
            instance_destroy();
        }
        exit;
    }
}
if (global.masks[22] == 0)
{
    if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSecretMask) || place_meeting(x, y, objSecretMask))
    {
        with (objSecretMask)
        {
            if (image_index == 22)
            {
                global.masks[22] = 1;
                scrCheckMasks();
                global.newmask[global.newmasks] = 22;
                global.newmasks += 1;
                audio_play_sound(sndToken, 0, false);
                my_id = instance_create(x, y, objLetterFound);
                my_id.text = '"' + scrMaskGetName(22) + '"';
                instance_destroy();
            }
        }
        exit;
    }
}
if ((place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objMaskDrop) || place_meeting(x, y, objMaskDrop)) && room == rmSecretSewer && global.done == 1)
{
    with (objMaskDrop)
    {
        if (image_index == 22)
        {
            global.hardmodemasks[22] = 1;
            scrSaveUnlocked();
            audio_play_sound(sndToken, 0, false);
            my_id = instance_create(x, y, objLetterFound);
            my_id.text = '"' + scrMaskGetName(36) + '"';
            scrAchievementSet("Sewer Alligator");
            instance_destroy();
        }
    }
    exit;
}
if (room == rmNoodleShop || room == rmHotelEntrance || room == rmHotel1)
{
    if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSecretMask) || place_meeting(x, y, objSecretMask))
    {
        with (objSecretMask)
        {
            audio_play_sound(sndToken, 0, false);
            if (room == rmNoodleShop)
            {
                global.masks[17] = 1;
                scrCheckMasks();
                global.newmask[global.newmasks] = 17;
                global.newmasks += 1;
                my_id = instance_create(x, y, objLetterFound);
                my_id.text = '"' + scrMaskGetName(17) + '"';
            }
            else if (room == rmHotel1 || room == rmHotelEntrance)
            {
                global.hardmodemasks[17] = 1;
                my_id = instance_create(x, y, objLetterFound);
                my_id.text = '"' + scrMaskGetName(34) + '"';
                scrAchievementSet("Special Dish");
            }
            instance_destroy();
        }
        exit;
    }
}
if (global.hardmodemasks[13] == 0 && global.hardmode == 1 && room == rmPoliceHQFloor2)
{
    if (place_meeting(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), objSecretMask) || place_meeting(x, y, objSecretMask))
    {
        with (objSecretMask)
        {
            if (room == rmPoliceHQFloor2)
            {
                audio_play_sound(sndToken, 0, false);
                global.hardmodemasks[13] = 1;
                my_id = instance_create(x, y, objLetterFound);
                my_id.text = 'HARDMODE "' + scrMaskGetName(13) + '"' + " UNLOCKED";
                scrSaveUnlocked();
                scrAchievementSet("Kwa, Kwa clap!!!");
            }
            instance_destroy();
        }
        exit;
    }
}
if (global.masks[24] == 0)
{
    if (place_meeting(x, y, objCobraDead))
    {
        with (objCobraDead)
        {
            if (taken == 0)
            {
                taken = 1;
                global.masks[24] = 1;
                scrCheckMasks();
                global.newmask[global.newmasks] = 24;
                global.newmasks += 1;
                audio_play_sound(sndToken, 0, false);
                my_id = instance_create(x, y, objLetterFound);
                my_id.text = '"' + scrMaskGetName(24) + '"';
            }
        }
        exit;
    }
}
if (place_meeting(x, y, objLocustDead) && global.masks[23] == 0)
{
    with (objLocustDead)
    {
        if (taken == 0)
        {
            taken = 1;
            global.masks[23] = 1;
            scrCheckMasks();
            global.newmask[global.newmasks] = 23;
            global.newmasks += 1;
            audio_play_sound(sndToken, 0, false);
            my_id = instance_create(x, y, objLetterFound);
            my_id.text = '"' + scrMaskGetName(23) + '"';
        }
    }
    exit;
}
if (place_meeting(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), objWalrusDead) && global.hardmode == 0)
{
    with (objWalrusDead)
    {
        if (taken == 0)
        {
            taken = 1;
            global.masks[21] = 1;
            scrCheckMasks();
            global.newmask[global.newmasks] = 21;
            global.newmasks += 1;
            audio_play_sound(sndToken, 0, false);
            my_id = instance_create(x, y, objLetterFound);
            my_id.text = '"' + scrMaskGetName(21) + '"';
        }
    }
    exit;
}
if (instance_exists(objDogPatrol) && place_meeting(x + lengthdir_x(35, dir), y + lengthdir_y(35, dir), objDogPatrol))
{
    with (objDogPatrol)
    {
        if (instance_exists(objPlayerMouse) && sprite_index == sprDogSit && place_meeting(x + lengthdir_x(35, direction), y + lengthdir_y(35, direction), objPlayer))
        {
            global.executionx = x;
            global.executiony = y;
            with (objPlayer)
            {
                if (scrNoweapon(sprite_index) == 0)
                {
                    lastweapon = scrCurrentWeapon();
                    lastammo = ammo;
                    my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
                    my_id.image_index = lastweapon;
                    my_id.direction = dir + 70 + random(40);
                    my_id.speed = 1 + random(2);
                    my_id.ammo = lastammo;
                }
                my_id = instance_create(x, y, objPDogPetting);
                my_id.image_angle = dir;
                my_id.direction = point_direction(x, y, global.executionx, global.executiony);
                instance_destroy();
            }
            instance_destroy();
        }
    }
    exit;
}
if (instance_exists(objDogPatrolFriend) && place_meeting(x + lengthdir_x(35, dir), y + lengthdir_y(35, dir), objDogPatrolFriend))
{
    with (objDogPatrolFriend)
    {
        if (instance_exists(objPlayerMouse) && sprite_index == sprDogSit && place_meeting(x + lengthdir_x(35, direction), y + lengthdir_y(35, direction), objPlayer))
        {
            global.executionx = x;
            global.executiony = y;
            with (objPlayer)
            {
                if (scrNoweapon(sprite_index) == 0)
                {
                    lastweapon = scrCurrentWeapon();
                    lastammo = ammo;
                    my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
                    my_id.image_index = lastweapon;
                    my_id.direction = dir + 70 + random(40);
                    my_id.speed = 1 + random(2);
                    my_id.ammo = lastammo;
                }
                my_id = instance_create(x, y, objPDogPetting);
                my_id.image_angle = dir;
                my_id.direction = point_direction(x, y, global.executionx, global.executiony);
                instance_destroy();
            }
            instance_destroy();
        }
    }
    exit;
}
if (place_meeting(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), objEvidenceTable))
{
    with (objEvidenceTable)
    {
        if (taken == 0)
        {
            taken = 1;
            global.masks[25] = 1;
            global.newmask[global.newmasks] = 25;
            global.newmasks += 1;
            audio_play_sound(sndToken, 0, false);
            my_id = instance_create(x, y, objLetterFound);
            my_id.text = '"' + scrMaskGetName(25) + '"';
        }
    }
    exit;
}
if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objFoodTrayOctopus))
{
    with (objFoodTrayOctopus)
    {
        if (open == 0)
        {
            open = 1;
        }
    }
    exit;
}
if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objBox))
{
    if (objBox.sprite_index == sprBox)
    {
        objBox.sprite_index = sprBoxOpen;
        objBox.image_index = 0;
        audio_play_sound(sndBox, 0, false);
        my_id = instance_create(objBox.x, objBox.y, objWeapon);
        my_id.image_index = choose(7, 10, 28, 42);
        if (my_id.image_index == 7 || my_id.image_index == 28)
        {
            my_id.ammo = 13;
        }
        else
        {
            my_id.ammo = 6;
        }
        if (my_id.image_index == 42)
        {
            my_id.ammo = 20;
        }
        exit;
    }
}
if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objDrugs))
{
    with (objDrugs)
    {
        my_id = instance_create(x, y + 20, objJacketDrugs);
        my_id.image_angle = 90;
    }
    instance_destroy();
    exit;
}
if (place_meeting(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), objGift))
{
    with (objGift)
    {
        if (touch == 0)
        {
            touch = 1;
            image_index = 1;
            audio_play_sound(sndBox, 0, false);
            my_id = instance_create(x, y, objWeapon);
            my_id.image_index = choose(7, 9, 10, 11, 28, 42);
            if (my_id.image_index == 7 || my_id.image_index == 28)
            {
                my_id.ammo = 13;
            }
            else if (my_id.image_index == 10)
            {
                my_id.ammo = 6;
            }
            else if (my_id.image_index == 9)
            {
                my_id.ammo = 30;
            }
            else if (my_id.image_index == 11 || my_id.image_index == 42)
            {
                my_id.ammo = 20;
            }
            my_id.image_angle = 45;
            my_id.depth = -2;
            exit;
        }
    }
}
with (objShotgunShellsSupply)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32)
    {
        reload = 5;
        global.shells += 2;
        audio_play_sound(sndPickupWeapon, 0, false);
        instance_destroy();
        exit;
    }
}
with (objGasCanister)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32 && objPlayer.sprite_index == sprPWalkChainsaw)
    {
        reload = 5;
        if ((objPlayer.ammo + fuel) <= 100)
        {
            objPlayer.ammo += fuel;
        }
        else
        {
            objPlayer.ammo = 100;
        }
        audio_sound_pitch(audio_play_sound(sndPickupGasoline, 0, false), pitch);
        instance_destroy();
        exit;
    }
}
release = 0;
if (reload > 0)
{
    reload = 0;
}
if (sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || sprite_index == sprPWalkBossgun || sprite_index == sprPLeaveBag || sprite_index == sprPTakePhone || ((global.maskindex == 2 || global.maskindex == 6) && global.hardmode == 1 && room != rmMansionMainHall) || sprite_index == sprPStartChainsaw || sprite_index == sprPCoolingChainsaw || sprite_index == sprPSprintChainsaw || sprite_index == sprPOverheatingChainsaw || (global.maskindex == 11 && sprite_index == sprPWalkCleaver) || global.maskindex == 27)
{
    exit;
}
if (sprite_index == sprPIdleFlameThrower)
{
    image_speed = 0;
}
lastweapon = scrCurrentWeaponExt(sprite_index);
lastammo = ammo;
lastHotWeaponAlpha = HotWeaponAlpha;
global.gotweapon = 0;
global.exposed = 1;
global.test = 0;
if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || sprite_index == sprPPushing || sprite_index == sprPKillHeadComeOff || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPJacketKillDog)
{
    noweapon = 1;
}
else
{
    noweapon = 0;
}
with (objWeapon)
{
    maxammo = scrGunIndexGetMaxAmmo();
    if (global.test == 0)
    {
        if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32)
        {
            if (ammo > 0)
            {
                global.etest = 0;
                with (objEnemy)
                {
                    if (sprite_index == sprEWalkUnarmed || sprite_index == sprEGiveUp || object_index == objEHideM16 || object_index == objEnemyAmbush)
                    {
                        nothing = 1;
                    }
                    else if (alert == 1)
                    {
                        global.etest = 1;
                    }
                }
                if (global.etest == 1)
                {
                    my_id = instance_create(x, y - 12, objScore);
                    my_id.text = "+" + string(60 * global.factor) + "pts";
                    global.myscore += (60 * global.factor);
                    ds_list_add(global.bonuslist, "Dangerous Pickup");
                }
            }
            reload = 5;
            global.gotweapon = 1;
            scrGetWeapon();
            global.test = 1;
            if (global.hardmode == 1 && !instance_exists(objEffectorInstant))
            {
                if (ammo > (maxammo / 2) && image_index != 39 && image_index != 27 && image_index != 25 && image_index != 26 && image_index != 40 && image_index != 41 && image_index != 38)
                {
                    if (global.maskindex == 17)
                    {
                        ammo = round(ammo / 4);
                    }
                    else
                    {
                        ammo = round(ammo / 2);
                    }
                }
            }
            if (objPlayer.Spark != 0)
            {
                my_id = instance_create(objPlayer.x, objPlayer.y, objLighter);
                my_id.direction = (objPlayer.direction - 25) + random(50);
                my_id.speed = 4 + random(0.5);
                objPlayer.image_speed = 0;
            }
            objPlayer.ammo = ammo;
            objPlayer.HotWeaponAlpha = hotalpha;
            audio_play_sound(sndPickupWeapon, 0, false);
            instance_destroy();
        }
    }
}
if (noweapon == 1)
{
    global.test = 4;
}
else if (lastweapon > 30 && lastweapon < 38)
{
    global.test = 2;
}
if (lastweapon < 0)
{
    exit;
}
if (sprite_index == sprPWalkUnarmed || room == rmSecretSewer)
{
    exit;
}
switch (global.test)
{
    case 0:
        global.dir = dir;
        my_id = instance_create(x, y, objWeaponThrow);
        with (my_id)
        {
            move_contact_solid(global.dir, 12);
        }
        audio_play_sound(sndThrow, 0, false);
        if (decadenced == 1)
        {
            my_id.decadenced = 1;
        }
        with (objPlayerMouse)
        {
            decadenced = 0;
        }
        my_id.speed = 10;
        my_id.direction = (dir - 5) + random(10);
        my_id.ammo = lastammo;
        my_id.image_index = lastweapon;
        my_id.hotalpha = lastHotWeaponAlpha;
        sprite_index = sprPWalkUnarmed;
        release = 1;
        break;
    case 1:
        global.dir = dir;
        my_id = instance_create(x, y, objWeaponThrow);
        with (my_id)
        {
            move_contact_solid(global.dir, 12);
        }
        audio_play_sound(sndThrow, 0, false);
        if (decadenced == 1)
        {
            my_id.decadenced = 1;
        }
        with (objPlayerMouse)
        {
            decadenced = 0;
        }
        my_id.speed = 10;
        my_id.direction = (dir - 5) + random(10);
        my_id.ammo = lastammo;
        my_id.image_index = lastweapon;
        my_id.hotalpha = lastHotWeaponAlpha;
        release = 1;
        break;
    case 2:
        global.dir = dir + (left * -20);
        my_id = instance_create(x, y, objThrowingWeapon);
        with (my_id)
        {
            move_contact_solid(global.dir, 12);
        }
        audio_play_sound(sndThrow, 0, false);
        if (decadenced == 1)
        {
            my_id.decadenced = 1;
        }
        with (objPlayerMouse)
        {
            decadenced = 0;
        }
        my_id.speed = 11;
        my_id.direction = (dir - 5) + random(10);
        my_id.ammo = lastammo;
        my_id.image_index = lastweapon - 30;
        my_id.hotalpha = lastHotWeaponAlpha;
        global.usedthrow[my_id.image_index] = 1;
        if (global.gotweapon == 0)
        {
            sprite_index = sprPWalkUnarmed;
        }
        release = 1;
        break;
}
