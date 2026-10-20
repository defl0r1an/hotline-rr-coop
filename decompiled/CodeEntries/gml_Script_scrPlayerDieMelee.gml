if (global.god == 0)
{
    global.shake = 10;
    with (objPlayer)
    {
        if (global.my_id.sprite_index == sprEWalkUnarmed || global.my_id.sprite_index == sprHoboWalk || global.my_id.sprite_index == sprPoliceWalkUnarmed)
        {
            exit;
        }
        pdir = point_direction(global.my_id.x, global.my_id.y, x, y);
        if (global.my_id.sprite_index == sprPInspectorAttack)
        {
            nothing = 1;
        }
        else
        {
            repeat (8)
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
                my_id.sprite_index = sprBloodSplatSmall;
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(4);
            }
            repeat (2 + random(3))
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
                my_id.direction = my_id.image_angle;
                my_id.speed = 1 + random(5);
            }
            repeat (4)
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, pdir), (y - 3) + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
                my_id.image_xscale = 1.2 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = (pdir - 20) + random(40);
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(1);
                my_id.friction = 0.15;
            }
        }
        if ((global.maskindex != 21 && objPlayer.object_index != objPlayerBiker) || global.my_id.sprite_index == sprPSprintChainsaw || scrCheckMeleeEnergie() || (global.my_id.sprite_index != sprEAttackClub && global.my_id.sprite_index != sprEAttackBat && global.my_id.sprite_index != sprEAttackPipe && global.my_id.sprite_index != sprEAttackKnife && global.my_id.sprite_index != sprEFatAttack && global.my_id.sprite_index != sprPoliceAttackNightStick && global.my_id.sprite_index != sprEDodgerAttack))
        {
            my_id = instance_create(x, y, objPlayerDead);
            if (global.my_id.sprite_index == sprEAttackClub || global.my_id.sprite_index == sprPAttackClub || global.my_id.sprite_index == sprPWalkClub || global.my_id.sprite_index == sprPoliceAttackNightStick || global.my_id.sprite_index == sprHoboAttack || global.my_id.sprite_index == sprEAttackBat || global.my_id.sprite_index == sprEAttackPipe)
            {
                audio_play_sound(sndHit, 0, false);
                my_id.sprite_index = choose(sprPBackBlunt, sprPBackBlunt, sprPFrontBlunt);
            }
            if (global.my_id.sprite_index == sprEAttackKnife || global.my_id.sprite_index == sprPantherHitback)
            {
                my_id.sprite_index = sprPBackCut;
                audio_play_sound(choose(sndCut1, sndCut2), 0, false);
            }
            if (global.my_id.sprite_index == sprEFatAttack || global.my_id.sprite_index == sprBoss1Attack)
            {
                my_id.sprite_index = choose(sprPBackBlunt, sprPBackBlunt, sprPFrontBlunt);
                audio_play_sound(sndHit, 0, false);
                audio_play_sound(sndPunch, 0, false);
            }
            if (global.my_id.sprite_index == sprPInspectorAttack)
            {
                my_id.sprite_index = sprPBackElectrified;
                my_id.image_speed = 0.25;
            }
            if (global.my_id.sprite_index == sprEAttackClub || global.my_id.sprite_index == sprHoboAttack || global.my_id.sprite_index == sprEAttackBat || global.my_id.sprite_index == sprEAttackPipe || global.my_id.sprite_index == sprEFatAttack || global.my_id.sprite_index == sprBoss1Attack)
            {
                my_id.image_index = 4 + floor(random(11));
            }
            else
            {
                my_id.image_index = 2 + floor(random(3));
            }
            if (global.my_id.sprite_index == sprBodyguardAttack || global.my_id.sprite_index == sprBoss2AttackCleaver || global.my_id.sprite_index == sprCleaver || global.my_id.sprite_index == sprJonesSprintChainsaw || global.my_id.sprite_index == sprEDodgerAttack)
            {
                if (object_index != objPigButcher && object_index != objPlayerBiker && object_index != objMCChopKill && object_index != objMCKnifeKill && object_index != objMCStompKill && object_index != objPlayerBikerHouse && object_index != objBikerKillFat)
                {
                    my_id.image_speed = 0;
                    if (round(random(1)))
                    {
                        my_id.sprite_index = sprPDeadSlash;
                        my_id.image_index = round(random_range(0, 2));
                    }
                    else
                    {
                        my_id.sprite_index = sprPJacketDeadSlashedPieces;
                        my_id.image_index = round(random_range(0, 3));
                    }
                    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
                    audio_play_sound(sndHit, 0, false);
                    global.shake = 5;
                    if (my_id.image_index == 1)
                    {
                        scrGoreCut(x, y, pdir - 180, 1, 0);
                    }
                    else
                    {
                        scrGoreCut(x, y, pdir - 180, 0, 0);
                    }
                    if (my_id.sprite_index == sprPJacketDeadSlashedPieces)
                    {
                        if (my_id.image_index == 0)
                        {
                            part = instance_create(my_id.x + lengthdir_x(22, pdir), my_id.y + lengthdir_y(18, pdir), objSeveredHeadPlayer);
                            part.image_angle = (pdir - 10) + random(20);
                            part.direction = part.image_angle;
                            part.speed = 3.5 + random(0.5);
                        }
                        if (my_id.image_index == 1)
                        {
                            part = instance_create(my_id.x + lengthdir_x(12, pdir), my_id.y + lengthdir_y(8, pdir), objBodyPartPlayer);
                            part.image_angle = (pdir - 10) + random(20);
                            part.sprite_index = sprPJacketDeadPieces;
                            part.direction = part.image_angle;
                            part.speed = 3 + random(1);
                            part.image_index = 1;
                            part.image_yscale = my_id.image_yscale;
                            part.depth = -1;
                        }
                        if (my_id.image_index == 2)
                        {
                            part = instance_create(my_id.x + lengthdir_x(16, pdir), my_id.y + lengthdir_y(12, pdir), objBodyPart);
                            part.image_angle = (pdir - 10) + random(20);
                            part.sprite_index = sprPJacketDeadPieces;
                            part.direction = part.image_angle;
                            part.speed = 3 + random(1);
                            part.image_index = choose(2, 4);
                            part.image_yscale = my_id.image_yscale;
                            part.depth = -1;
                        }
                        if (my_id.image_index == 3)
                        {
                            part = instance_create(my_id.x + lengthdir_x(16, pdir), my_id.y + lengthdir_y(12, pdir), objBodyPartPlayer);
                            part.image_angle = (pdir - 10) + random(20);
                            part.sprite_index = sprPJacketDeadPieces;
                            part.direction = part.image_angle;
                            part.speed = 3 + random(1);
                            part.image_index = 3;
                            part.image_yscale = my_id.image_yscale;
                            part.depth = -1;
                        }
                    }
                }
                else
                {
                    my_id.sprite_index = sprPBackCut;
                    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
                }
            }
            if (global.my_id.sprite_index == sprEAttackShotgun || global.my_id.sprite_index == sprEAttackDoubleBarrel1 || global.my_id.sprite_index == sprEAttackDoubleBarrel2)
            {
                my_id.sprite_index = sprPBackShotgun;
            }
            if (global.my_id.sprite_index == sprEAttackM16 || (global.my_id.sprite_index == sprEWalkSilencer && global.my_id.ammo > 0))
            {
                my_id.sprite_index = sprPBackMachinegun;
            }
            my_id.direction = pdir;
            my_id.speed = 1.5 + random(1);
            my_id.image_angle = my_id.direction;
            if (object_index == objPigButcher || object_index == objPigButcherStomp || object_index == objPigHeadButt || object_index == objPigButcherKill || object_index == objPigButcherWallKill)
            {
                if (my_id.sprite_index == sprPBackBlunt)
                {
                    my_id.sprite_index = sprPigDeadBlunt;
                }
                if (my_id.sprite_index == sprPFrontBlunt)
                {
                    my_id.sprite_index = sprPigDeadBlunt;
                }
                if (my_id.sprite_index == sprPBackCut)
                {
                    my_id.sprite_index = sprPigDeadBlunt;
                }
                if (my_id.sprite_index == sprPFrontMachinegun)
                {
                    my_id.sprite_index = sprPigDeadShot;
                }
                if (my_id.sprite_index == sprPBackMachinegun)
                {
                    my_id.sprite_index = sprPigDeadShot;
                }
                if (my_id.sprite_index == sprPFrontShotgun)
                {
                    my_id.sprite_index = sprPigDeadShot;
                }
                if (my_id.sprite_index == sprPBackShotgun)
                {
                    my_id.sprite_index = sprPigDeadShot;
                }
            }
            else if (object_index == objPlayerBiker || object_index == objMCChopKill || object_index == objMCKnifeKill || object_index == objMCStompKill || object_index == objPlayerBikerHouse || object_index == objBikerKillFat)
            {
                if (my_id.sprite_index == sprPBackBlunt)
                {
                    my_id.sprite_index = sprMCBackBlunt;
                }
                if (my_id.sprite_index == sprPFrontBlunt)
                {
                    my_id.sprite_index = sprMCFrontBlunt;
                }
                if (my_id.sprite_index == sprPBackCut)
                {
                    my_id.sprite_index = sprMCBackCut;
                }
                if (my_id.sprite_index == sprPFrontMachinegun)
                {
                    my_id.sprite_index = sprMCFrontMachinegun;
                }
                if (my_id.sprite_index == sprPBackMachinegun)
                {
                    my_id.sprite_index = sprMCBackMachinegun;
                }
                if (my_id.sprite_index == sprPFrontShotgun)
                {
                    my_id.sprite_index = sprMCFrontShotgun;
                }
                if (my_id.sprite_index == sprPBackShotgun)
                {
                    my_id.sprite_index = sprMCBackShotgun;
                }
                if (my_id.sprite_index == sprPBackCut)
                {
                    my_id.sprite_index = sprMCBackCut;
                }
                my_id = instance_create(x, y, objMCHelmet);
                my_id.direction = random(360);
                my_id.speed = 5 + random(2);
                my_id3 = instance_create(x, y, objCleaverDrop);
                my_id3.direction = (image_angle - 70) + random(40);
                my_id3.speed = 1 + random(0.5);
            }
            else if (object_index == objPlayerGriffin || object_index == objGriffinKnifeKill || object_index == objGriffinHeadKick)
            {
                if (my_id.sprite_index == sprPBackBlunt || my_id.sprite_index == sprMCBackBlunt)
                {
                    my_id.sprite_index = sprGriffinDeadBlunt;
                }
                if (my_id.sprite_index == sprPFrontBlunt || my_id.sprite_index == sprMCFrontBlunt)
                {
                    my_id.sprite_index = sprGriffinDeadBlunt;
                }
                if (my_id.sprite_index == sprPBackCut || my_id.sprite_index == sprMCBackCut)
                {
                    my_id.sprite_index = sprGriffinDeadCut;
                }
                if (my_id.sprite_index == sprPFrontMachinegun || my_id.sprite_index == sprPBackMachinegun || my_id.sprite_index == sprMCBackMachinegun || my_id.sprite_index == sprMCFrontMachinegun)
                {
                    my_id.sprite_index = sprGriffinDeadMachineGun;
                }
                if (my_id.sprite_index == sprPFrontShotgun || my_id.sprite_index == sprPBackShotgun || my_id.sprite_index == sprMCBackShotgun || my_id.sprite_index == sprMCFrontShotgun)
                {
                    my_id.sprite_index = sprGriffinDeadShotgun;
                }
                my_id = instance_create(x + lengthdir_x(24, pdir), y + lengthdir_y(24, pdir), objMaskDrop);
                my_id.image_index = 26;
                my_id.direction = (pdir - 40) + random(80);
                my_id.speed = 1.5 + random(1);
            }
            else
            {
                my_id = instance_create(x + lengthdir_x(24, pdir), y + lengthdir_y(24, pdir), objMaskDrop);
                my_id.direction = (pdir - 40) + random(80);
                my_id.speed = 1.5 + random(1);
            }
            if (object_index == objPlayerShieldMouse)
            {
                my_id = instance_create(x + lengthdir_x(7, dir - 45), y + lengthdir_y(7, dir - 45), objKnockedOut);
                my_id.direction = pdir - 20;
                my_id.speed = 1.5 + random(1);
                my_id.image_angle = my_id.direction;
                if (bottom == "Police")
                {
                    my_id.sprite_index = sprPoliceGetUp;
                }
                my_id.angle = my_id.image_angle;
            }
            if (object_index == objPlayerBiker || object_index == objMCChopKill || object_index == objMCKnifeKill || object_index == objMCStompKill || object_index == objPlayerBikerHouse || object_index == objBikerKillFat || sprite_index == sprPAttackFaceKick || sprite_index == sprPAttackFaceKickBag || sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch || object_index == objPlayerBiker || sprite_index == sprPWalkBag || sprite_index == sprPAttackBag || sprite_index == sprPBagKill || sprite_index == sprPTigerKill || sprite_index == sprPPushing || sprite_index == sprPKillHeadComeOff || sprite_index == sprPJacketAttackKnuckles || sprite_index == sprPJacketKillDog || (object_index == objPlayerMouse && Spark > 0))
            {
                noweapon = 1;
            }
            else
            {
                noweapon = 0;
            }
            if (noweapon == 0)
            {
                my_id = instance_create(x, y, objWeaponThrow);
                my_id.direction = (pdir - 25) + random(50);
                my_id.speed = 2 + random(1);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                if (sprite_index == sprPThrowKnife)
                {
                    my_id.image_index = scrCurrentWeaponExt(prevsprite);
                }
                if (sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Hot")))
                {
                    my_id.hotalpha = HotWeaponAlpha;
                }
                my_id.ammo = ammo;
                if (image_index < 0)
                {
                    with (my_id)
                    {
                        instance_destroy();
                    }
                }
            }
            if (sprite_index == sprPAttackBash || sprite_index == sprPTigerKill)
            {
                if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3 || room == rmPoliceHQFloor3TigerHard)
                {
                    my_id.sprite_index = sprPoliceGetUp;
                    my_id = instance_create(x, y, objKnockedOut);
                    my_id.type = object_index;
                }
                else
                {
                    my_id = instance_create(x, y, objKnockedOut);
                    my_id.angle = image_angle;
                    my_id.type = 275;
                }
            }
            if (object_index == objPlayerMouse && Spark != 0)
            {
                my_id = instance_create(x, y, objLighter);
                my_id.direction = (pdir - 25) + random(50);
                my_id.speed = 2 + random(1);
            }
            instance_destroy();
        }
        else
        {
            global.shake = 8;
            audio_play_sound(sndHit, 0, false);
            if (global.my_id.sprite_index == sprEAttackClub)
            {
                my_id = instance_create(x, y, objBrokenWeapon);
                my_id.speed = 2 + random(2);
                my_id.direction = random(360);
                my_id.sprite_index = sprClubBroken;
                my_id.image_speed = 0;
                my_id.image_index = 1;
                audio_play_sound(Golf_break, 0, false);
            }
            if (global.my_id.sprite_index == sprEAttackBat)
            {
                my_id = instance_create(x, y, objBrokenWeapon);
                my_id.speed = 2 + random(2);
                my_id.direction = random(360);
                my_id.sprite_index = sprBatBroken;
                my_id.image_index = 0;
                my_id = instance_create(x, y, objBrokenWeapon);
                my_id.speed = 2 + random(2);
                my_id.direction = random(360);
                my_id.sprite_index = sprBatBroken;
                my_id.image_index = 1;
                audio_play_sound(Bat_break, 0, false);
            }
            if (global.my_id.sprite_index == sprEAttackPipe)
            {
                my_id = instance_create(x, y, objBrokenWeapon);
                my_id.speed = 2 + random(2);
                my_id.direction = random(360);
                my_id.sprite_index = sprPipeBroken;
                my_id.image_index = irandom(1);
                audio_play_sound(Pipe_break, 0, false);
            }
            if (global.my_id.sprite_index == sprEAttackKnife)
            {
                my_id = instance_create(x, y, objBrokenWeapon);
                my_id.speed = 2 + random(2);
                my_id.direction = random(360);
                my_id.sprite_index = sprKnifeBroken;
                my_id.image_index = 0;
                my_id = instance_create(x, y, objBrokenWeapon);
                my_id.speed = 2 + random(2);
                my_id.direction = random(360);
                my_id.sprite_index = sprKnifeBroken;
                my_id.image_index = 1;
                audio_play_sound(Knife_Break, 0, false);
            }
            if (global.my_id.sprite_index == sprPoliceAttackNightStick)
            {
                my_id = instance_create(x, y, objBrokenWeapon);
                my_id.speed = 2 + random(2);
                my_id.direction = random(360);
                my_id.sprite_index = sprNightStickBroken;
                my_id.image_index = 0;
                my_id = instance_create(x, y, objBrokenWeapon);
                my_id.speed = 2 + random(2);
                my_id.direction = random(360);
                my_id.sprite_index = sprNightStickBroken;
                my_id.image_index = 1;
                audio_play_sound(sndPunch, 0, false);
            }
            with (global.my_id)
            {
                edir = point_direction(objPlayer.x, objPlayer.y, x, y);
                audio_play_sound(sndDoorHit, 1, false);
                if (global.my_id.sprite_index == sprEFatAttack || global.my_id.sprite_index == sprEFatGunAttackMelee || global.my_id.sprite_index == sprPInspectorAttack)
                {
                    my_id = instance_create(x, y, objFatKnockedOut);
                    if (global.my_id.hits > 0)
                    {
                        my_id.hits = global.my_id.hits;
                    }
                    my_id.type = object_index;
                    if (scrIsPolice(object_index))
                    {
                        if (object_index == objInspector)
                        {
                            my_id.sprite_index = sprEInspectorGetUp;
                        }
                        else
                        {
                            my_id.sprite_index = sprPoliceGetUp;
                        }
                    }
                    else if (object_index == objEFatGunner)
                    {
                        my_id.sprite_index = sprEFatGunGetUp;
                        my_id.ammo = ammo;
                    }
                }
                else
                {
                    my_id = instance_create(x, y, objKnockedOut);
                }
                my_id.type = object_index;
                if (scrIsPolice(object_index))
                {
                    my_id.sprite_index = sprPoliceGetUp;
                }
                if (object_index == objEDodger)
                {
                    my_id.sprite_index = sprEMafiaDodgerGetUp;
                }
                my_id.direction = (edir - 10) + random(20);
                my_id.angle = my_id.direction;
                with (my_id)
                {
                    move_outside_solid(angle - 180, 16);
                }
                my_id.speed = 2;
                instance_destroy();
            }
            if (objPlayer.object_index == objPlayerMouse)
            {
                meleeenergie -= 1;
            }
            else
            {
                global.meleeenergie -= 1;
            }
            if (objPlayer.object_index == objPlayerBiker)
            {
                objPlayer.melenergie -= 1;
            }
            objEffector.morj = 1;
        }
    }
}
