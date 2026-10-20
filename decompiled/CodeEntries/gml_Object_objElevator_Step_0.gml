if (global.deadIgel == 1)
{
    exit;
}
mask_index = sprElevatorFloor;
touch = 0;
if (!place_meeting(x, y, objPlayer))
{
    if (wait < 30)
    {
        wait = 30;
    }
}
if ((instance_number(objPlayerMouse) + instance_number(objPlayerMouseHouse) + instance_number(objPlayerBiker) + instance_number(objPlayerBikerHouse)) == 0)
{
    exit;
}
if (valid == 0)
{
    exit;
}
if (instance_exists(objEnemy) || instance_exists(objBoss) || instance_exists(objEventTriggerElevator))
{
    if (place_meeting(x, y, objPlayer))
    {
        if (wait > 0)
        {
            wait -= 1;
        }
        else if (index < 6)
        {
            index += 0.5;
        }
    }
    if (index < 3)
    {
        mask_index = sprite_index;
    }
    else
    {
        mask_index = sprElevatorMask;
    }
    image_index = index;
}
if (room == rmHotelEntrance || room == rmHotel1)
{
    test = 1;
    if (objFatmanEating.sprite_index == sprDeputyFatmanEating || objFatmanEating.sprite_index == sprDeputyFatmanEatingGiveUp || objFatmanTelephone.sprite_index == sprDeputyFatmanTelephone || objFatmanTelephone.sprite_index == sprDeputyFatmanTelephoneGiveUp)
    {
        test = 0;
    }
    if (test == 0)
    {
        exit;
    }
}
if (room == rmHotelSuite || room == rmHotel3)
{
    test = 1;
    if (objFatmanShit.sprite_index == sprDeputyFatmanShit || objFatmanShit.sprite_index == sprDeputyFatmanShitGiveUp)
    {
        test = 0;
    }
    if (test == 0)
    {
        exit;
    }
}
if (room == rmPhoneHomUpstairs)
{
    if (global.done == 1)
    {
        test = 0;
    }
}
if ((instance_number(objEventTriggerElevator) + instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objBoss) + instance_number(objFiles) + instance_number(objMiscEnemy) + (instance_number(objBossgun) && global.maskindex != 27)) == 0)
{
    if (global.done == 0)
    {
        if (place_meeting(x, y, objPlayer))
        {
            touch = 1;
            if (instance_exists(objPlayerMouse))
            {
                global.sprinttime = objPlayerMouse.alarm[3];
                global.coolingtime = objPlayerMouse.alarm[1];
                if (global.maskindex == 11 && global.hardmode == 1 && objPlayerMouse.sprite_index != sprPWalkUnarmed && objPlayerMouse.sprite_index != sprPWalkBag && objPlayerMouse.sprite_index != sprPAttackPunch)
                {
                    dir = image_angle - 90 - 180;
                    global.dir = dir;
                    my_id = instance_create(x, y, objWeaponThrow);
                    with (my_id)
                    {
                        move_contact_solid(global.dir, 12);
                    }
                    audio_play_sound(sndThrow, 0, false);
                    with (objPlayerMouse)
                    {
                        decadenced = 0;
                    }
                    my_id.speed = 5;
                    my_id.direction = (dir - 5) + random(10);
                    my_id.ammo = objPlayerMouse.ammo;
                    my_id.image_index = scrCurrentWeaponExt(objPlayerMouse.sprite_index);
                    objPlayerMouse.sprite_index = sprPWalkUnarmed;
                    release = 1;
                }
                else
                {
                    global.weaponsprite = objPlayerMouse.sprite_index;
                    global.ammoweapon = objPlayerMouse.ammo;
                }
            }
            objPlayer.addx = 0;
            objPlayer.addy = 0;
            if (objPlayer.x < (x - 2))
            {
                objPlayer.x += 2;
            }
            if (objPlayer.x > (x + 2))
            {
                objPlayer.x -= 2;
            }
            if (objPlayer.y < (y - 2))
            {
                objPlayer.y += 2;
            }
            if (objPlayer.y > (y + 2))
            {
                objPlayer.y -= 2;
            }
            if (objPlayer.x < (x + 2) && objPlayer.x > (x - 2) && objPlayer.y > (y - 2) && objPlayer.y < (y + 2))
            {
                nothing = 1;
            }
            else
            {
                objPlayer.image_index += 0.15;
                objPlayer.legindex += 0.4;
            }
            objPlayer.persistent = true;
            if (image_angle == 0)
            {
                if (objPlayer.y > y)
                {
                    objPlayer.addy = 0;
                }
            }
            if (image_angle == 90)
            {
                if (objPlayer.x > x)
                {
                    objPlayer.addx = 0;
                }
            }
            if (image_angle == 180)
            {
                if (objPlayer.y < y)
                {
                    objPlayer.addy = 0;
                }
            }
            if (image_angle == 270)
            {
                if (objPlayer.x < x)
                {
                    objPlayer.addx = 0;
                }
            }
            if (wait > 0)
            {
                wait -= 1;
            }
            else
            {
                if (index > 0)
                {
                    index -= 0.5;
                }
                if (objEffector.fade == 0)
                {
                    objPlayer.movex = movex;
                    objPlayer.movey = movey;
                    if (abs(movex) > 0 || abs(movey) > 0)
                    {
                        objPlayer.move = 1;
                    }
                    objEffector.next = 1;
                    objEffector.fade = 1;
                    objEffector.nextroom = nextroom;
                    global.combosave = global.combo;
                    global.combotimesave = global.combotime;
                    if (global.maskindex == 13 && global.hardmode == 1)
                    {
                        global.combotime = 240;
                        global.combotimesave = global.combotime;
                    }
                    global.drawscoresave = global.drawscore;
                    global.myscoresave = global.myscore;
                    global.flexibilityscoresave = global.flexibilityscore;
                    global.mobilityscoresave = global.mobilityscore;
                    global.specialscoresave = global.specialscore;
                    global.myscoresave = global.myscore;
                    global.killscoresave = global.killscore;
                    global.boldscoresave = global.boldscore;
                    global.comboscoresave = global.comboscore;
                    global.shellssave = global.shells;
                    global.knivessave = global.knives;
                    global.meleeenergiesave = global.meleeenergie;
                    global.dogsavelife = global.dogsave;
                    global.BuffSkippysave = global.BuffSkippy;
                    global.bigballssave = global.bigballs;
                    if (instance_exists(objPlayerMouse))
                    {
                        shell = global.shells;
                        global.weaponsprite = objPlayerMouse.sprite_index;
                        global.ammoweapon = objPlayerMouse.ammo;
                        global.throwindex = objPlayerMouse.throwindex;
                        with (objPlayerMouse)
                        {
                            scrPlayerAnimationEnd();
                        }
                    }
                    with (objWeapon)
                    {
                        const = 1;
                    }
                    if (room == rmHotelEntrance && x > 434)
                    {
                        global.overright = 1;
                    }
                }
                if (objEffector.amount == 0)
                {
                    if (global.maskindex == 1 && (room == rmPoliceHQShootingRange || room == rmPoliceHQFloor2))
                    {
                        scrResetSurfaces();
                    }
                }
            }
        }
        else if (index < 6)
        {
            index += 0.2;
        }
    }
    else if (place_meeting(x, y, objPlayer))
    {
        if (instance_exists(objPlayerCarEnter) || instance_exists(objMCBike))
        {
            if (wait > 0)
            {
                index = 0;
                wait -= 1;
            }
            else if (index < 6)
            {
                index += 0.5;
            }
        }
        else
        {
            touch = 1;
            objPlayer.addx = 0;
            objPlayer.addy = 0;
            if (objPlayer.x < (x - 2))
            {
                objPlayer.x += 2;
            }
            if (objPlayer.x > (x + 2))
            {
                objPlayer.x -= 2;
            }
            if (objPlayer.y < (y - 2))
            {
                objPlayer.y += 2;
            }
            if (objPlayer.y > (y + 2))
            {
                objPlayer.y -= 2;
            }
            if (objPlayer.x < (x + 2) && objPlayer.x > (x - 2) && objPlayer.y > (y - 2) && objPlayer.y < (y + 2))
            {
                nothing = 1;
            }
            else
            {
                objPlayer.image_index += 0.15;
                objPlayer.legindex += 0.15;
            }
            objPlayer.persistent = true;
            if (image_angle == 0)
            {
                if (objPlayer.y > y)
                {
                    objPlayer.addy = 0;
                }
            }
            if (image_angle == 90)
            {
                if (objPlayer.x > x)
                {
                    objPlayer.addx = 0;
                }
            }
            if (image_angle == 180)
            {
                if (objPlayer.y < y)
                {
                    objPlayer.addy = 0;
                }
            }
            if (image_angle == 270)
            {
                if (objPlayer.x < x)
                {
                    objPlayer.addx = 0;
                }
            }
            if (wait > 0)
            {
                wait -= 1;
            }
            else
            {
                if (index > 0)
                {
                    index -= 0.5;
                }
                if (objEffector.fade == 0)
                {
                    objPlayer.movex = movex;
                    objPlayer.movey = movey;
                    if (abs(movex) > 0 || abs(movey) > 0)
                    {
                        objPlayer.move = 1;
                    }
                    objEffector.next = 1;
                    objEffector.fade = 1;
                    objEffector.nextroom = nextroom;
                    objPlayer.persistent = true;
                    global.combosave = global.combo;
                    global.combotimesave = global.combotime;
                    global.drawscoresave = global.drawscore;
                    global.myscoresave = global.myscore;
                    global.flexibilityscoresave = global.flexibilityscore;
                    global.mobilityscoresave = global.mobilityscore;
                    global.specialscoresave = global.specialscore;
                    global.myscoresave = global.myscore;
                    global.killscoresave = global.killscore;
                    global.boldscoresave = global.boldscore;
                    global.comboscoresave = global.comboscore;
                    global.shellssave = global.shells;
                    global.dogsavelife = global.dogsave;
                    global.BuffSkippysave = global.BuffSkippy;
                    global.bigballssave = global.bigballs;
                    if (instance_exists(objPlayerMouse))
                    {
                        shell = global.shells;
                        global.weaponsprite = objPlayerMouse.sprite_index;
                        global.ammoweapon = objPlayerMouse.ammo;
                        global.throwindex = objPlayerMouse.throwindex;
                        with (objPlayerMouse)
                        {
                            scrPlayerAnimationEnd();
                        }
                    }
                }
                if (objEffector.amount == 0)
                {
                    if (global.maskindex == 1 && (room == rmPoliceHQShootingRange || room == rmPoliceHQFloor2))
                    {
                        scrResetSurfaces();
                    }
                }
            }
        }
    }
}
if (index < 3)
{
    mask_index = sprite_index;
}
else
{
    mask_index = sprElevatorMask;
}
image_index = index;
valid = 1;
