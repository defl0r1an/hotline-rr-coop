if (global.igelcutscenes == 1 || instance_exists(objJonesEnemyCrawl))
{
    exit;
}
if (global.player_lock == 0)
{
    if (global.xbox == 1)
    {
        scrXboxPlayerMove();
    }
    else if (global.hardmode == 0)
    {
        if (instance_exists(objMaskMenu) || instance_exists(objPhoneConversation) || sprite_index == sprShieldSnapDoubleBarrel || sprite_index == sprShieldSnapMagnum || sprite_index == sprShieldSnapMP5 || sprite_index == sprShieldSnapScorpion || sprite_index == sprShieldSnapSilencer || sprite_index == sprShieldSnapUzi || sprite_index == sprPShieldSnapAks || sprite_index == sprPShieldSnapNailgun || sprite_index == sprPDrink || sprite_index == sprPHumanShieldSnap9mm || sprite_index == sprPStartSilencer || sprite_index == sprPStartSilencedUzi || sprite_index == sprPStartChainsaw2 || sprite_index == sprPStartLighter)
        {
            nothing = 1;
        }
        else
        {
            global.test = 0;
            with (objElevator)
            {
                if (touch == 1)
                {
                    global.test = 1;
                }
            }
            if (persistent == true && global.test == 1)
            {
                nothing = 1;
            }
            else
            {
                myspeed = 3;
                factor = 1;
                speedo = myspeed;
                if (object_index == objPlayerBiker)
                {
                    myspeed = 3.5;
                    factor = 1;
                }
                if (object_index == objPlayerShieldMouse)
                {
                    myspeed = 2.5;
                    factor = 1;
                }
                if (global.maskindex == 5 && global.maskon == 1)
                {
                    myspeed = 3.5;
                    factor = 1;
                }
                if (global.maskindex == 16 && global.maskon == 1)
                {
                    myspeed = 4;
                    factor = 1;
                }
                if (sprite_index == sprPJacketWalkSkateboard)
                {
                    myspeed = 3.15;
                    factor = 1;
                }
                if (sprite_index == sprPWalkFlameThrower || sprite_index == sprPAttackFlameThrower)
                {
                    speedo = myspeed;
                    myspeed = clamp(speedo - (HotWeaponAlpha / 2.5), 2.65, myspeed);
                    factor = 1.35;
                }
                if (place_meeting(x, y, objShadowH) || place_meeting(x, y, objShadowV))
                {
                    speedo = myspeed;
                    myspeed = speedo - 0.75;
                    factor = 1.35;
                }
                if (sprite_index == sprPWalkGirlfriend)
                {
                    speedo = myspeed;
                    myspeed = speedo - 1.5;
                    factor = 1.35;
                }
                if (sprite_index == sprPWalkHospital || sprite_index == sprPWalkHospitalScalpelBlood)
                {
                    myspeed = 2;
                }
                if (object_index == objPlayerHospital)
                {
                    factor = 2;
                    myspeed = 1.5;
                }
                if (sprite_index == sprBikerWalkWounded)
                {
                    factor = 2;
                    myspeed = 1.5;
                }
                if (sprite_index == sprPSprintChainsaw)
                {
                    factor = 2;
                    myspeed = 4 - slowhit;
                }
                if (sprite_index == sprPStartChainsaw)
                {
                    factor = 2;
                    myspeed = 1.5;
                }
                if (sprite_index == sprPOverheatingChainsaw)
                {
                    myspeed = 1.5;
                }
                if (sprite_index == sprPWalkM60 || sprite_index == sprPAttackM60)
                {
                    speedo = myspeed;
                    myspeed = clamp(speedo - HotWeaponAlpha, 1.5, myspeed);
                }
                if (global.deadIgel == 1 || global.igelcutscenes == -2)
                {
                    myspeed = speeddeadIgel;
                    factor = 1;
                }
                if (global.maskindex == 27 && global.powerIgel == 1 && global.deadIgel != 1)
                {
                    myspeed = 3.75;
                    factor = 1;
                }
                if (global.maskindex == 20)
                {
                    if (keyboard_check_direct(ord(global.rightkey)))
                    {
                        if (myxspeed > -myspeed)
                        {
                            myxspeed -= 0.5;
                        }
                        else
                        {
                            myxspeed = -myspeed;
                        }
                    }
                    if (keyboard_check_direct(ord(global.leftkey)))
                    {
                        if (myxspeed < myspeed)
                        {
                            myxspeed += 0.5;
                        }
                        else
                        {
                            myxspeed = myspeed;
                        }
                    }
                    if (keyboard_check_direct(ord(global.downkey)))
                    {
                        if (myyspeed > -myspeed)
                        {
                            myyspeed -= 0.5;
                        }
                        else
                        {
                            myyspeed = -myspeed;
                        }
                    }
                    if (keyboard_check_direct(ord(global.upkey)))
                    {
                        if (myyspeed < myspeed)
                        {
                            myyspeed += 0.5;
                        }
                        else
                        {
                            myyspeed = myspeed;
                        }
                    }
                }
                else
                {
                    if (keyboard_check_direct(ord(global.leftkey)))
                    {
                        if (myxspeed > -myspeed)
                        {
                            myxspeed -= 0.5;
                        }
                        else
                        {
                            myxspeed = -myspeed;
                        }
                    }
                    if (keyboard_check_direct(ord(global.rightkey)))
                    {
                        if (myxspeed < myspeed)
                        {
                            myxspeed += 0.5;
                        }
                        else
                        {
                            myxspeed = myspeed;
                        }
                    }
                    if (keyboard_check_direct(ord(global.upkey)))
                    {
                        if (myyspeed > -myspeed)
                        {
                            myyspeed -= 0.5;
                        }
                        else
                        {
                            myyspeed = -myspeed;
                        }
                    }
                    if (keyboard_check_direct(ord(global.downkey)))
                    {
                        if (myyspeed < myspeed)
                        {
                            myyspeed += 0.5;
                        }
                        else
                        {
                            myyspeed = myspeed;
                        }
                    }
                }
                if (!keyboard_check_direct(ord(global.rightkey)) && !keyboard_check_direct(ord(global.leftkey)))
                {
                    if (myxspeed > 0)
                    {
                        myxspeed -= 0.5;
                    }
                    else if (myxspeed < -0.5)
                    {
                        myxspeed += 0.5;
                    }
                    else
                    {
                        myxspeed = 0;
                    }
                }
                if (!keyboard_check_direct(ord(global.upkey)) && !keyboard_check_direct(ord(global.downkey)))
                {
                    if (myyspeed > 0)
                    {
                        myyspeed -= 0.5;
                    }
                    else if (myyspeed < -0.5)
                    {
                        myyspeed += 0.5;
                    }
                    else
                    {
                        myyspeed = 0;
                    }
                }
                scrMoveSolidOn();
                while ((abs(myxspeed) + abs(myyspeed)) > (myspeed + 2))
                {
                    myxspeed *= 0.98;
                    myyspeed *= 0.98;
                }
                if (abs(myxspeed) == 0 && abs(myyspeed) == 0)
                {
                    legindex = 0;
                }
                else
                {
                    legindex += ((abs(myxspeed) + abs(myyspeed)) * 0.1 * factor);
                    if (room != rmMorgue && room != rmMadnessMorgue)
                    {
                        if (global.hardmode == 0)
                        {
                            with (objDizzy)
                            {
                                if (dizziness < 1)
                                {
                                    dizziness += 0.01;
                                }
                            }
                        }
                        else
                        {
                            with (objDizzy)
                            {
                                if (dizziness < 1)
                                {
                                    dizziness += 0.25;
                                }
                            }
                        }
                    }
                    if (scrIsWalking(sprite_index))
                    {
                        image_index += ((abs(myxspeed) + abs(myyspeed)) * 0.05);
                    }
                    if (sprite_index == sprBikerWalkWounded)
                    {
                        image_index += ((abs(myxspeed) + abs(myyspeed)) * 0.01);
                    }
                }
                legdir = point_direction(0, 0, myxspeed, myyspeed);
                if (abs(myxspeed) > 0)
                {
                    if (place_free(x + myxspeed, y))
                    {
                        x += myxspeed;
                    }
                    else if (myyspeed == 0)
                    {
                        if (place_free(x + myxspeed, y - 8))
                        {
                            y -= myspeed;
                        }
                        else if (place_free(x + myxspeed, y + 8))
                        {
                            y += myspeed;
                        }
                        else
                        {
                            move_contact_solid(90 - (sign(myxspeed) * 90), abs(myxspeed));
                            myxspeed = 0;
                        }
                    }
                }
                if (abs(myyspeed) > 0)
                {
                    if (place_free(x, y + myyspeed))
                    {
                        y += myyspeed;
                    }
                    else if (myxspeed == 0)
                    {
                        if (place_free(x - 8, y + myyspeed))
                        {
                            x -= myspeed;
                        }
                        else if (place_free(x + 8, y + myyspeed))
                        {
                            x += myspeed;
                        }
                        else
                        {
                            move_contact_solid(-sign(myyspeed) * 90, abs(myyspeed));
                            myyspeed = 0;
                        }
                    }
                }
                if (x < -64)
                {
                    x = -64;
                }
                if (x > (room_width + 64))
                {
                    x = room_width + 64;
                }
                if (y < -64)
                {
                    y = -64;
                }
                if (y > (room_height + 64))
                {
                    y = room_height + 64;
                }
                scrMoveSolidOff();
            }
        }
    }
    else if (instance_exists(objMaskMenu) || instance_exists(objPhoneConversation) || sprite_index == sprShieldSnapDoubleBarrel || sprite_index == sprShieldSnapMagnum || sprite_index == sprShieldSnapMP5 || sprite_index == sprShieldSnapScorpion || sprite_index == sprShieldSnapSilencer || sprite_index == sprShieldSnapUzi || sprite_index == sprPShieldSnapAks || sprite_index == sprPShieldSnapNailgun || sprite_index == sprPHumanShieldSnap9mm || sprite_index == sprPDrink || sprite_index == sprPStartSilencer || sprite_index == sprPStartSilencedUzi || sprite_index == sprPStartChainsaw2 || sprite_index == sprPStartLighter)
    {
        nothing = 1;
    }
    else
    {
        global.test = 0;
        with (objElevator)
        {
            if (touch == 1)
            {
                global.test = 1;
            }
        }
        if (persistent == true && global.test == 1)
        {
            nothing = 1;
        }
        else
        {
            myspeed = 3;
            factor = 1;
            if (object_index == objPlayerBiker)
            {
                myspeed = 3.5;
                factor = 1;
            }
            if (object_index == objPlayerShieldMouse)
            {
                myspeed = 1.5;
                factor = 1;
            }
            if (global.maskindex == 16 && global.maskon == 1)
            {
                myspeed = 3.5 + floor(global.combo / 30);
                myspeed = clamp(global.combo, 3.5, 4.4);
                factor = 1;
            }
            if (sprite_index == sprPJacketWalkSkateboard)
            {
                myspeed = 3.15;
                factor = 1;
            }
            if (sprite_index == sprPWalkFlameThrower || sprite_index == sprPAttackFlameThrower)
            {
                speedo = myspeed;
                myspeed = clamp(speedo - (HotWeaponAlpha / 2.5), 2.65, myspeed);
                factor = 1.35;
            }
            if (place_meeting(x, y, objShadowH) || place_meeting(x, y, objShadowV))
            {
                speedo = myspeed;
                myspeed = speedo - 0.75;
                factor = 1.35;
            }
            if (sprite_index == sprPWalkGirlfriend)
            {
                speedo = myspeed;
                myspeed = speedo - 1.5;
                factor = 1.35;
            }
            if (sprite_index == sprPWalkHospital || sprite_index == sprPWalkHospitalScalpelBlood)
            {
                myspeed = 2;
            }
            if (object_index == objPlayerHospital)
            {
                factor = 2;
                myspeed = 1.5;
            }
            if (sprite_index == sprBikerWalkWounded)
            {
                factor = 2;
                myspeed = 1.5;
            }
            if (meleeenergie == 1)
            {
                factor = 1;
                myspeed = 2.75;
            }
            if (meleeenergie == 0)
            {
                factor = 1;
                myspeed = 2.5;
            }
            if (sprite_index == sprPSprintChainsaw)
            {
                factor = 2;
                myspeed = (3.15 - slowhit) + (HotWeaponAlpha * 1.85);
            }
            if (sprite_index == sprPStartChainsaw)
            {
                factor = 2;
                myspeed = 1.5;
            }
            if (sprite_index == sprPOverheatingChainsaw)
            {
                myspeed = 1.5;
            }
            if (sprite_index == sprPWalkM60 || sprite_index == sprPAttackM60)
            {
                speedo = myspeed;
                myspeed = clamp(speedo - HotWeaponAlpha, 1.5, myspeed);
            }
            if (global.deadIgel == 1 || global.igelcutscenes == -2)
            {
                myspeed = speeddeadIgel;
                factor = 1;
            }
            if (global.maskindex == 27 && global.powerIgel == 1 && global.deadIgel != 1)
            {
                myspeed = 3.75;
                factor = 1;
            }
            if (global.maskindex == 20)
            {
                if (keyboard_check_direct(ord(global.leftkey)))
                {
                    if (myxspeed > -myspeed)
                    {
                        myxspeed -= 0.5;
                    }
                    else
                    {
                        myxspeed = -myspeed;
                    }
                }
                if (keyboard_check_direct(ord(global.rightkey)))
                {
                    if (myxspeed < myspeed)
                    {
                        myxspeed += 0.5;
                    }
                    else
                    {
                        myxspeed = myspeed;
                    }
                }
                if (keyboard_check_direct(ord(global.upkey)))
                {
                    if (myyspeed > -myspeed)
                    {
                        myyspeed -= 0.5;
                    }
                    else
                    {
                        myyspeed = -myspeed;
                    }
                }
                if (keyboard_check_direct(ord(global.downkey)))
                {
                    if (myyspeed < myspeed)
                    {
                        myyspeed += 0.5;
                    }
                    else
                    {
                        myyspeed = myspeed;
                    }
                }
            }
            else
            {
                if (keyboard_check_direct(ord(global.rightkey)))
                {
                    if (myxspeed > -myspeed)
                    {
                        myxspeed -= 0.5;
                    }
                    else
                    {
                        myxspeed = -myspeed;
                    }
                }
                if (keyboard_check_direct(ord(global.leftkey)))
                {
                    if (myxspeed < myspeed)
                    {
                        myxspeed += 0.5;
                    }
                    else
                    {
                        myxspeed = myspeed;
                    }
                }
                if (keyboard_check_direct(ord(global.downkey)))
                {
                    if (myyspeed > -myspeed)
                    {
                        myyspeed -= 0.5;
                    }
                    else
                    {
                        myyspeed = -myspeed;
                    }
                }
                if (keyboard_check_direct(ord(global.upkey)))
                {
                    if (myyspeed < myspeed)
                    {
                        myyspeed += 0.5;
                    }
                    else
                    {
                        myyspeed = myspeed;
                    }
                }
            }
            if (!keyboard_check_direct(ord(global.rightkey)) && !keyboard_check_direct(ord(global.leftkey)))
            {
                if (myxspeed > 0)
                {
                    myxspeed -= 0.5;
                }
                else if (myxspeed < -0.5)
                {
                    myxspeed += 0.5;
                }
                else
                {
                    myxspeed = 0;
                }
            }
            if (!keyboard_check_direct(ord(global.upkey)) && !keyboard_check_direct(ord(global.downkey)))
            {
                if (myyspeed > 0)
                {
                    myyspeed -= 0.5;
                }
                else if (myyspeed < -0.5)
                {
                    myyspeed += 0.5;
                }
                else
                {
                    myyspeed = 0;
                }
            }
            scrMoveSolidOn();
            while ((abs(myxspeed) + abs(myyspeed)) > (myspeed + 2))
            {
                myxspeed *= 0.98;
                myyspeed *= 0.98;
            }
            if (abs(myxspeed) == 0 && abs(myyspeed) == 0)
            {
                legindex = 0;
            }
            else
            {
                legindex += ((abs(myxspeed) + abs(myyspeed)) * 0.1 * factor);
                if (room != rmMorgue && room != rmMadnessMorgue)
                {
                    with (objDizzy)
                    {
                        if (dizziness < 1)
                        {
                            dizziness += 0.01;
                        }
                    }
                }
                if (scrIsWalking(sprite_index))
                {
                    image_index += ((abs(myxspeed) + abs(myyspeed)) * 0.05);
                }
                if (sprite_index == sprBikerWalkWounded)
                {
                    image_index += ((abs(myxspeed) + abs(myyspeed)) * 0.01);
                }
            }
            legdir = point_direction(0, 0, myxspeed, myyspeed);
            if (abs(myxspeed) > 0)
            {
                if (place_free(x + myxspeed, y))
                {
                    x += myxspeed;
                }
                else if (myyspeed == 0)
                {
                    if (place_free(x + myxspeed, y - 8))
                    {
                        y -= myspeed;
                    }
                    else if (place_free(x + myxspeed, y + 8))
                    {
                        y += myspeed;
                    }
                    else
                    {
                        move_contact_solid(90 - (sign(myxspeed) * 90), abs(myxspeed));
                        myxspeed = 0;
                    }
                }
            }
            if (abs(myyspeed) > 0)
            {
                if (place_free(x, y + myyspeed))
                {
                    y += myyspeed;
                }
                else if (myxspeed == 0)
                {
                    if (place_free(x - 8, y + myyspeed))
                    {
                        x -= myspeed;
                    }
                    else if (place_free(x + 8, y + myyspeed))
                    {
                        x += myspeed;
                    }
                    else
                    {
                        move_contact_solid(-sign(myyspeed) * 90, abs(myyspeed));
                        myyspeed = 0;
                    }
                }
            }
            if (x < -64)
            {
                x = -64;
            }
            if (x > (room_width + 64))
            {
                x = room_width + 64;
            }
            if (y < -64)
            {
                y = -64;
            }
            if (y > (room_height + 64))
            {
                y = room_height + 64;
            }
            scrMoveSolidOff();
        }
    }
}
