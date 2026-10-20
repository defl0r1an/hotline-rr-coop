d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
if (global.combo > 0)
{
    if (global.combotime > 156)
    {
        global.combotime = 156;
    }
    if (global.combotime > 0)
    {
        if (global.maskindex == 13 && global.hardmode == 1)
        {
            global.combotime -= clamp(2.25 - (global.combo / 43), 0.65, 2.25);
            if (instance_exists(objLevelComplete))
            {
                global.combotime = 0;
            }
        }
        else
        {
            global.combotime -= 1;
            if (global.maskindex == 13)
            {
                global.combotime += 0.25;
            }
        }
    }
    else if (global.combotime < 0)
    {
        global.combotime = 0;
    }
    else
    {
        global.combotime = 0;
        if (global.combo > 1)
        {
            if (global.maskindex == 13 && global.hardmode == 1 && !instance_exists(objLevelComplete))
            {
                global.comboscore += (((300 + (global.combo * 25)) * global.combo) / 5);
            }
            else
            {
                global.comboscore += ((300 + (global.combo * 125)) * global.combo);
            }
            if (instance_exists(objPlayer))
            {
                my_id = instance_create(objPlayer.x, objPlayer.y - 12, objScore);
                my_id.text = string(global.combo) + "xCOMBO";
                dialogue = choose("And you call it combo?", "Just stop it", "Well...");
                if (global.combo >= 4)
                {
                    scrAchievementSet("Combo Beginner");
                    dialogue = choose("At least they are dead", "Better then nothing", "Count isnt matter i think");
                }
                if (global.combo >= 6)
                {
                    scrAchievementSet("Combo Intermediate");
                    dialogue = choose("You can be better", "Try harder", "Is it hard for you?");
                }
                if (global.combo >= 8)
                {
                    scrAchievementSet("Combo Pro");
                    dialogue = choose("Pretty good", "You are getting stronger", "Will never get tired of this");
                }
                if (global.combo >= 10)
                {
                    scrAchievementSet("Combo Master");
                    dialogue = choose("Now we are talking", "Still not enough...");
                }
                if (global.combo >= 12)
                {
                    scrAchievementSet("Combo King");
                    dialogue = choose("Kill. Them. All.", "Dont stop", "This is your nature");
                    if (global.language == 1)
                    {
                        scrSetRasmusEvent("Кровавое искусство", 3, 1);
                    }
                }
                scrSetRasmusEvent(dialogue, 3, 45);
                global.comboflash = 1;
                ds_list_add(global.bonuslist, string(global.combo) + "xCOMBO");
                if (global.bonustime < (10 + (global.combo * 5)))
                {
                    global.bonustime = 10 + (global.combo * 5);
                }
            }
        }
        if (global.maskindex == 13 && global.hardmode == 1 && !instance_exists(objLevelComplete))
        {
            global.combo -= 1;
            global.combotime = 156;
        }
        else
        {
            global.combo = 0;
        }
    }
}
else
{
    global.combotime = 0;
}
if (global.drawscore < global.myscore)
{
    update = 1;
}
else
{
    update = 0;
}
if (global.drawscore < (global.myscore - 1000))
{
    global.drawscore += 500;
}
else if (global.drawscore < (global.myscore - 200))
{
    global.drawscore += 100;
}
else if (global.drawscore < (global.myscore - 20))
{
    global.drawscore += 20;
}
else if (global.drawscore < global.myscore)
{
    global.drawscore += 1;
}
if (global.done == 1)
{
    update = 1;
}
if (!instance_exists(objPlayer))
{
    update = 1;
}
scorestring = string(global.drawscore) + "PTS";
colorblack = 0;
if (global.hlm2hud == 0)
{
    colorcombo2 = merge_color(merge_color(c_fuchsia, c_red, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_white, 0.5 + lengthdir_x(0.5, dir * 3));
    colorcombo1 = merge_color(c_maroon, merge_color(c_fuchsia, c_red, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
    color2 = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_white, 0.5 + lengthdir_x(0.5, dir * 3));
    color1 = merge_color(c_maroon, merge_color(c_aqua, c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
    dir += (1 + (update * 7));
}
else
{
    colorcombo2 = merge_color(c_fuchsia, c_red, 0.5 + lengthdir_x(0.5, dir * 3.21));
    colorcombo1 = merge_color(c_maroon, c_purple, 0.5 + lengthdir_x(0.5, dir * 2.71));
    color2 = merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3.21));
    color1 = merge_color(c_orange, c_maroon, 0.5 + lengthdir_x(0.5, dir * 2.71));
    dir += 1;
}
colormag2 = merge_color(c_white, c_lime, 0.5 - lengthdir_x(0.5, dir * 3.21));
colormag1 = merge_color(c_yellow, c_green, 0.5 - lengthdir_x(0.5, dir * 2.71));
color2finish = merge_color(c_white, c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 3.21));
color1finish = merge_color(c_purple, c_teal, 0.5 - lengthdir_x(0.5, dir * 2.71));
if (global.maskindex == 26 && global.maskon == 1)
{
    colorcombo2 = merge_color(c_maroon, c_red, 0.5 + lengthdir_x(0.5, dir * 3.21));
    colorcombo1 = merge_color(c_maroon, c_red, 0.5 + lengthdir_x(0.5, dir * 2.71));
    color2 = merge_color(c_maroon, c_red, 0.5 + lengthdir_x(0.5, dir * 3.21));
    color1 = merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, dir * 2.71));
    colormag2 = merge_color(c_white, c_red, 0.5 - lengthdir_x(0.5, dir * 3.21));
    colormag1 = merge_color(c_red, c_maroon, 0.5 - lengthdir_x(0.5, dir * 2.71));
    color2finish = merge_color(c_white, c_red, 0.5 - lengthdir_x(0.5, dir * 3.21));
    color1finish = merge_color(c_red, c_maroon, 0.5 - lengthdir_x(0.5, dir * 2.71));
    dir += 1;
}
global.dir += 1;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
showammo = 0;
skippy = 0;
if (instance_exists(objPlayer))
{
    draw_set_blend_mode(bm_subtract);
    draw_circle_color(global.wview / 2, global.hview / 2, 380, c_black, merge_color(c_black, c_white, global.chargeSkippy), 0);
    draw_set_blend_mode(bm_add);
    draw_circle_color(global.wview / 2, global.hview / 2, 380, c_black, merge_color(c_black, merge_color(c_maroon, merge_color(c_maroon, c_red, 0.5), 0.5 - lengthdir_x(0.5, global.deadScreenIgelSpeed)), global.deadScreenIgel), 0);
    draw_set_blend_mode(bm_normal);
    if (objPlayer.object_index == objPlayerShieldMouse)
    {
        showammo = 1;
    }
    if (global.hlm2hud == 1)
    {
        if (objPlayer.sprite_index == sprPHumanShieldUziShoot || objPlayer.sprite_index == sprPHumanShieldScorpionShoot || objPlayer.sprite_index == sprPHumanShieldMagnumShoot || objPlayer.sprite_index == sprPHumanShieldDoubleBarrelShoot1 || objPlayer.sprite_index == sprPHumanShieldDoubleBarrelShoot2 || objPlayer.sprite_index == sprPHumanShieldSilencerShoot || objPlayer.sprite_index == sprPHumanShieldMP5Shoot || objPlayer.sprite_index == sprPAttackHumanShieldSilencedUzi)
        {
            shake += 15;
        }
    }
    if (objPlayer.sprite_index == sprPWalkM16 || objPlayer.sprite_index == sprPAttackM16 || objPlayer.sprite_index == sprPigButcherWalkM16 || objPlayer.sprite_index == sprPigButcherAttackM16)
    {
        showammo = 1;
        maxammo = 20;
        global.ammotype = 0;
    }
    if (objPlayer.sprite_index == sprPWalkM60 || objPlayer.sprite_index == sprPAttackM60)
    {
        showammo = 1;
        maxammo = 50;
        global.ammotype = 1;
    }
    if (objPlayer.sprite_index == sprPWalkKalashnikov || objPlayer.sprite_index == sprPAttackKalashnikov || objPlayer.sprite_index == sprPigButcherWalkAK || objPlayer.sprite_index == sprPigButcherAttackAK)
    {
        showammo = 1;
        maxammo = 24;
        global.ammotype = 0;
    }
    if (objPlayer.sprite_index == sprPWalkHuntingRifle || objPlayer.sprite_index == sprPAttackHuntingRifle)
    {
        showammo = 1;
        maxammo = 8;
        global.ammotype = 1;
    }
    if (objPlayer.sprite_index == sprPWalkUzi || objPlayer.sprite_index == sprPAttackUzi || objPlayer.sprite_index == sprPHumanShieldUzi || objPlayer.sprite_index == sprPHumanShieldUziShoot || objPlayer.sprite_index == sprShieldSnapUzi)
    {
        showammo = 1;
        maxammo = 30;
        global.ammotype = 0;
    }
    if (objPlayer.sprite_index == sprPWalkScorpion || objPlayer.sprite_index == sprPAttackScorpion || objPlayer.sprite_index == sprPHumanShieldScorpion || objPlayer.sprite_index == sprPHumanShieldScorpionShoot || objPlayer.sprite_index == sprShieldSnapScorpion)
    {
        showammo = 1;
        maxammo = 20;
        global.ammotype = 0;
    }
    if (objPlayer.sprite_index == sprPWalkMagnum || objPlayer.sprite_index == sprPAttackMagnum || objPlayer.sprite_index == sprPHumanShieldMagnum || objPlayer.sprite_index == sprPHumanShieldMagnumShoot || objPlayer.sprite_index == sprShieldSnapMagnum)
    {
        showammo = 1;
        maxammo = 6;
        global.ammotype = 0;
    }
    if (objPlayer.sprite_index == sprPWalkSilencedUzi || objPlayer.sprite_index == sprPAttackSilencedUzi || objPlayer.sprite_index == sprPWalkHumanShieldSilencedUzi || objPlayer.sprite_index == sprPAttackHumanShieldSilencedUzi || objPlayer.sprite_index == sprPSnapHumanShieldSilencedUzi)
    {
        showammo = 1;
        maxammo = 30;
        global.ammotype = 0;
    }
    if (objPlayer.sprite_index == sprPWalkShotgun || objPlayer.sprite_index == sprPAttackShotgun || objPlayer.sprite_index == sprPigButcherWalkShotgun || objPlayer.sprite_index == sprPigButcherAttackShotgun || objPlayer.sprite_index == sprAubreyShotgunTurn || objPlayer.sprite_index == sprPAttackShotgunTurn)
    {
        showammo = 1;
        maxammo = 6;
        global.ammotype = 2;
    }
    if (objPlayer.sprite_index == sprPWalkDoubleBarrel || objPlayer.sprite_index == sprPAttackDoubleBarrel1 || objPlayer.sprite_index == sprPAttackDoubleBarrel2 || objPlayer.sprite_index == sprPigButcherWalkDoubleBarrel || objPlayer.sprite_index == sprPigButcherAttackDoubleBarrel1 || objPlayer.sprite_index == sprPigButcherAttackDoubleBarrel2 || objPlayer.sprite_index == sprPHumanShieldDoubleBarrel || objPlayer.sprite_index == sprPHumanShieldDoubleBarrelShoot1 || objPlayer.sprite_index == sprPHumanShieldDoubleBarrelShoot2)
    {
        showammo = 1;
        maxammo = 2;
        global.ammotype = 2;
    }
    if (objPlayer.sprite_index == sprJacketWalkShorty || objPlayer.sprite_index == sprJacketAttackShorty1 || objPlayer.sprite_index == sprJacketAttackShorty2)
    {
        showammo = 1;
        maxammo = 2;
        global.ammotype = 2;
    }
    if (objPlayer.sprite_index == sprPWalkSilencer || objPlayer.sprite_index == sprPAttackSilencer || objPlayer.sprite_index == sprPigButcherWalkSilencer || objPlayer.sprite_index == sprPigButcherAttackSilencer || objPlayer.sprite_index == sprPHumanShieldSilencer || objPlayer.sprite_index == sprPHumanShieldSilencerShoot || objPlayer.sprite_index == sprShieldSnapSilencer)
    {
        showammo = 1;
        maxammo = 13;
        global.ammotype = 0;
    }
    if (objPlayer.sprite_index == sprPWalk9mm || objPlayer.sprite_index == sprPAttack9mm || objPlayer.sprite_index == sprPigButcherWalk9mm || objPlayer.sprite_index == sprPigButcherAttack9mm || objPlayer.sprite_index == sprPHumanShield9mm || objPlayer.sprite_index == sprPHumanShieldSnap9mm || objPlayer.sprite_index == sprPHumanShield9mmShoot)
    {
        showammo = 1;
        maxammo = 13;
        global.ammotype = 0;
    }
    if (objPlayer.sprite_index == sprPWalkMP5 || objPlayer.sprite_index == sprPAttackMP5 || objPlayer.sprite_index == sprPigButcherShoot || objPlayer.sprite_index == sprPigButcherWalkMP5 || objPlayer.sprite_index == sprPHumanShieldMP5 || objPlayer.sprite_index == sprPHumanShieldMP5Shoot || objPlayer.sprite_index == sprShieldSnapMP5)
    {
        showammo = 1;
        maxammo = 32;
        global.ammotype = 0;
    }
    if (objPlayer.sprite_index == sprPWalkToyMP5 || objPlayer.sprite_index == sprPAttackToyMP5)
    {
        showammo = 1;
        maxammo = 100;
        global.ammotype = 18;
    }
    if (objPlayer.sprite_index == sprPWalkAks || objPlayer.sprite_index == sprPAttackAks || objPlayer.sprite_index == sprPWalkHumanShieldAks || objPlayer.sprite_index == sprPAttackHumanShieldAks || objPlayer.sprite_index == sprPShieldSnapAks)
    {
        showammo = 1;
        maxammo = 32;
        global.ammotype = 0;
    }
    if (global.maskindex == 10)
    {
        maxammo = ceil(maxammo * 1.33);
    }
    if (objPlayer.object_index == objPlayerBiker)
    {
        showammo = 1;
        global.ammotype = clamp(string(objPlayer.ammo + 5), 6, 8);
    }
    if (objPlayer.sprite_index == sprPWalkChainsaw || objPlayer.sprite_index == sprPAttackChainsaw || objPlayer.sprite_index == sprPSprintChainsaw || objPlayer.sprite_index == sprPStartChainsaw || objPlayer.sprite_index == sprPOverheatingChainsaw || objPlayer.sprite_index == sprPCoolingChainsaw)
    {
        showammo = 1;
        maxammo = 100;
        global.ammotype = 9;
    }
    if (objPlayer.sprite_index == sprPWalkFlameThrower || objPlayer.sprite_index == sprPAttackFlameThrower || objPlayer.sprite_index == sprPIdleFlameThrower)
    {
        showammo = 1;
        maxammo = 100;
        global.ammotype = 10;
    }
    if (objPlayer.sprite_index == sprPWalkNailgun || objPlayer.sprite_index == sprPAttackNailgun || objPlayer.sprite_index == sprPWalkHumanShieldNailgun || objPlayer.sprite_index == sprPAttackHumanShieldNailgun || objPlayer.sprite_index == sprPShieldSnapNailgun)
    {
        showammo = 1;
        maxammo = 20;
        global.ammotype = 3;
    }
    if (objPlayer.sprite_index == sprPAttackSkippyBig || objPlayer.sprite_index == sprPAttackSkippyLow || objPlayer.sprite_index == sprPAttackSkippyMedium || objPlayer.sprite_index == sprPEndSkippyAim || objPlayer.sprite_index == sprPStartSkippy || objPlayer.sprite_index == sprPStartSkippyAim || objPlayer.sprite_index == sprPWalkSkippy || objPlayer.sprite_index == sprPWalkSkippyAim || objPlayer.sprite_index == sprPKillSkippyEnd || objPlayer.sprite_index == sprPIdleSkippy2 || objPlayer.sprite_index == sprPIdleSkippy2End || objPlayer.sprite_index == sprPSkippyPunch || objPlayer.sprite_index == sprPSkippyPunchWalk || objPlayer.sprite_index == sprPSkippyPunchStart)
    {
        showammo = 1;
        maxammo = 10;
        skippy = 1;
        if (objPlayer.ammo <= 0)
        {
            skippy = 0;
        }
        global.ammotype = 14;
    }
    if (global.hlm2hud == 1)
    {
        if (objPlayer.sprite_index == sprPAttackM16 || objPlayer.sprite_index == sprPAttackKalashnikov || objPlayer.sprite_index == sprPAttackHuntingRifle || objPlayer.sprite_index == sprPAttackUzi || objPlayer.sprite_index == sprPAttackScorpion || objPlayer.sprite_index == sprPAttackMagnum || objPlayer.sprite_index == sprPAttackSilencedUzi || objPlayer.sprite_index == sprPAttackShotgun || objPlayer.sprite_index == sprPAttackDoubleBarrel1 || objPlayer.sprite_index == sprPAttackDoubleBarrel2 || objPlayer.sprite_index == sprPAttackSilencer || objPlayer.sprite_index == sprPAttack9mm || objPlayer.sprite_index == sprPAttackMP5 || objPlayer.sprite_index == sprGriffinAttack9mm || objPlayer.sprite_index == sprBikerAttackKnife || objPlayer.sprite_index == sprBoss2ThrowKnife || objPlayer.sprite_index == sprPAttackM60 || objPlayer.sprite_index == sprPigButcherAttackDoubleBarrel1 || objPlayer.sprite_index == sprPigButcherAttackDoubleBarrel2 || objPlayer.sprite_index == sprPAttackShotgunTurn || objPlayer.sprite_index == sprJacketAttackShorty1 || objPlayer.sprite_index == sprJacketAttackShorty2 || objPlayer.sprite_index == sprPAttackNailgun || objPlayer.sprite_index == sprPAttackAks || objPlayer.sprite_index == sprPAttackFlameThrower || objPlayer.sprite_index == sprPAttackToyMP5)
        {
            shake += 15;
        }
    }
    if (showammo == 1)
    {
        if (global.hlm2hud == 1)
        {
            if (objPlayer.ammo < 10 && global.maskindex != 27)
            {
                ammostring = "0" + string(objPlayer.ammo);
            }
            else
            {
                ammostring = string(objPlayer.ammo);
            }
            if (objPlayer.ammo == 0)
            {
                if (global.language == 1)
                {
                    ammostring = "ПУСТО";
                }
                else
                {
                    ammostring = "EMPTY";
                }
            }
        }
        else if (global.language == 1)
        {
            if (objPlayer.sprite_index == sprPWalkFlameThrower || objPlayer.sprite_index == sprPAttackFlameThrower || objPlayer.sprite_index == sprPIdleFlameThrower || objPlayer.sprite_index == sprPWalkChainsaw || objPlayer.sprite_index == sprPAttackChainsaw || objPlayer.sprite_index == sprPSprintChainsaw || objPlayer.sprite_index == sprPStartChainsaw || objPlayer.sprite_index == sprPOverheatingChainsaw || objPlayer.sprite_index == sprPCoolingChainsaw)
            {
                ammostring = string(objPlayer.ammo) + "/" + string(maxammo) + "ТОПЛ";
                if (objPlayer.ammo == 0)
                {
                    ammostring = "НЕТ ТОПЛ";
                }
            }
            else if (objPlayer.sprite_index == sprPAttackToyMP5 || objPlayer.sprite_index == sprPWalkToyMP5)
            {
                ammostring = string(objPlayer.ammo) + "/" + string(maxammo) + "ВОДА";
                if (objPlayer.ammo == 0)
                {
                    ammostring = "НЕТ ВОДЫ";
                }
            }
            else
            {
                ammostring = string(objPlayer.ammo) + "/" + string(maxammo) + "ПУЛЬ";
                if (objPlayer.ammo == 0)
                {
                    ammostring = "НЕТ ПУЛЬ";
                }
            }
        }
        else if (objPlayer.sprite_index == sprPWalkFlameThrower || objPlayer.sprite_index == sprPAttackFlameThrower || objPlayer.sprite_index == sprPIdleFlameThrower || objPlayer.sprite_index == sprPWalkChainsaw || objPlayer.sprite_index == sprPAttackChainsaw || objPlayer.sprite_index == sprPSprintChainsaw || objPlayer.sprite_index == sprPStartChainsaw || objPlayer.sprite_index == sprPOverheatingChainsaw || objPlayer.sprite_index == sprPCoolingChainsaw)
        {
            ammostring = string(objPlayer.ammo) + "/" + string(maxammo) + "FUEL";
            if (objPlayer.ammo == 0)
            {
                ammostring = "NO FUEL";
            }
        }
        else if (objPlayer.sprite_index == sprPAttackToyMP5 || objPlayer.sprite_index == sprPWalkToyMP5)
        {
            ammostring = string(objPlayer.ammo) + "/" + string(maxammo) + "WATER";
            if (objPlayer.ammo == 0)
            {
                ammostring = "NO WATER";
            }
        }
        else
        {
            ammostring = string(objPlayer.ammo) + "/" + string(maxammo) + "RNDS";
            if (objPlayer.ammo == 0)
            {
                ammostring = "NO RNDS";
            }
        }
        if (ammox < 0)
        {
            ammox += 6;
        }
        else
        {
            ammox = 0;
        }
    }
    else
    {
        if (global.maskindex == 3 && (objPlayer.sprite_index == sprAubreyReloadShorty1ShellRight || objPlayer.sprite_index == sprAubreyReloadShorty1ShellLeft || objPlayer.sprite_index == sprAubreyReloadShorty2Shells))
        {
            if (global.language == 1)
            {
                ammostring = "ПЕРЕЗАРЯДКА";
            }
            else
            {
                ammostring = "RELOAD";
            }
        }
        else if (global.language == 1)
        {
            ammostring = "НЕТ ПУШЕК";
        }
        else
        {
            ammostring = "NO GUN";
        }
        if (global.done == 0)
        {
            if (ammox > -96)
            {
                ammox -= 6;
            }
        }
    }
    if (global.done)
    {
        if (global.holiday == 2 && global.strah == 0)
        {
            listplayer();
            sxeasy_play(global.panic);
            if (!instance_exists(object1488) && instance_exists(objPlayer))
            {
                instance_create(objPlayer.x, objPlayer.y, object1488);
            }
            global.strah = 1;
        }
        if (global.hlm2hud == 0)
        {
            if (showfinished > 0)
            {
                showfinished -= 1;
            }
            else
            {
                showfinished = 240;
            }
            if (showfinished < 121)
            {
                scorestring = "YOU GOT " + string(global.drawscore) + "PTS";
            }
            else if (instance_exists(objEffectorInstant))
            {
                scorestring = "LEVEL COMPLETE";
            }
            else
            {
                scorestring = "CHAPTER DONE";
            }
        }
        if (!instance_exists(objEffectorInstant))
        {
            if (global.language == 1)
            {
                ammostring = "ИДИ К МАШИНЕ";
            }
            else
            {
                ammostring = "GO TO CAR";
            }
        }
        if (instance_exists(objSwatSpawn) || instance_exists(objSwat) || instance_exists(objSwatKnockedOut))
        {
            if (global.language == 1)
            {
                ammostring = "УБЕГАЙ";
            }
            else
            {
                ammostring = "ESCAPE";
            }
        }
        if (ammox < 0)
        {
            ammox += 6;
        }
        else
        {
            ammox = 0;
        }
    }
}
if (instance_exists(objPlayerBiker) || instance_exists(objPlayerBikerHouse))
{
    if (showammo == 1)
    {
        if (global.hlm2hud == 1)
        {
            if (objPlayer.ammo < 10)
            {
                ammostring = "0" + string(objPlayer.ammo);
            }
            else
            {
                ammostring = string(objPlayer.ammo);
            }
        }
        else if (global.language == 1)
        {
            ammostring = string(objPlayer.ammo) + russianpronouns;
        }
        else
        {
            ammostring = string(objPlayer.ammo) + " KNIVES";
        }
        if (objPlayer.ammo == 0)
        {
            if (global.hlm2hud == 1)
            {
                if (global.language == 1)
                {
                    ammostring = "ПУСТО";
                }
                else
                {
                    ammostring = "EMPTY";
                }
            }
            else if (global.language == 1)
            {
                ammostring = "НЕТ НОЖЕЙ";
            }
            else
            {
                ammostring = "NO KNIVES";
            }
        }
        if (ammox < 0)
        {
            ammox += 6;
        }
        else
        {
            ammox = 0;
        }
    }
    else if (global.done == 0)
    {
        if (ammox > -96)
        {
            ammox -= 6;
        }
    }
    if (global.done)
    {
        if (global.hlm2hud == 0)
        {
            if (showfinished > 0)
            {
                showfinished -= 1;
            }
            else
            {
                showfinished = 240;
            }
            if (showfinished < 121)
            {
                scorestring = "YOU GOT " + string(global.drawscore) + "PTS";
            }
            else
            {
                scorestring = "CHAPTER DONE";
            }
        }
        if (global.language == 1)
        {
            ammostring = "ИДИ К БАЙКУ";
        }
        else
        {
            ammostring = "GO TO BIKE";
        }
        if (ammox < 0)
        {
            ammox += 6;
        }
        else
        {
            ammox = 0;
        }
    }
}
else if (instance_exists(objPlayerDead))
{
    if (global.hlm2hud == 0)
    {
        scorestring = "YOU'RE DEAD";
    }
    if (global.language == 1)
    {
        ammostring = "НЕТ ПУШЕК";
    }
    else
    {
        ammostring = "NO GUN";
    }
    if (ammox > -96)
    {
        ammox -= 6;
    }
}
if (instance_exists(objPlayerBiker) && global.hlm2hud == 0 && global.language == 1)
{
    if (objPlayer.ammo == 5 || objPlayer.ammo > 5)
    {
        russianpronouns = " НОЖЕЙ";
    }
    if (objPlayer.ammo == 2 || objPlayer.ammo > 2 || objPlayer.ammo < 4 || objPlayer.ammo == 4)
    {
        russianpronouns = " НОЖА";
    }
    if (objPlayer.ammo == 1 || objPlayer.ammo < 2)
    {
        russianpronouns = " НОЖ";
    }
}
finish = 0;
if (room == rmTrainstationEntrance || room == rmTrainstationDownstairs)
{
    if (instance_exists(objPlayer))
    {
        finish = 1;
        if (global.xbox == 1)
        {
            finishstring = "WALK WITH [LEFT STICK]";
        }
        else
        {
            finishstring = "WALK WITH [WASD]";
        }
        if (keyboard_check_direct(vk_shift))
        {
            if (global.xbox == 1)
            {
                finishstring = "HOLD [LEFT BUTTON] TO LOOK AROUND";
            }
            else
            {
                finishstring = "HOLD [SHIFT] TO LOOK AROUND";
            }
        }
        if (instance_exists(objWeapon))
        {
            if (global.xbox == 1)
            {
                finishstring = "TAKE WEAPON WITH [LEFT TRIGGER]";
            }
            else
            {
                finishstring = "TAKE WEAPON WITH [RMB]";
            }
        }
        if (objPlayer.sprite_index == sprPWalkUnarmed || objPlayer.sprite_index == sprPAttackPunch || objPlayer.sprite_index == sprPJacketAttackKnuckles)
        {
            nothing = 1;
        }
        else if (room == rmTrainstationDownstairs)
        {
            if (global.xbox == 1)
            {
                finishstring = "THROW WEAPON WITH [LEFT TRIGGER]";
            }
            else
            {
                finishstring = "THROW WEAPON WITH [RMB]";
            }
        }
        else if (global.xbox == 1)
        {
            finishstring = "WALK WITH [LEFT STICK]";
        }
        else
        {
            finishstring = "WALK WITH [WASD]";
        }
        if (instance_exists(objKnockedOut) || instance_exists(objHoboKnockedOut))
        {
            if (global.xbox == 1)
            {
                finishstring = "PRESS [A] TO EXECUTE KNOCKED OUT ENEMIES";
            }
            else
            {
                finishstring = "PRESS [SPACE] TO EXECUTE KNOCKED OUT ENEMIES";
            }
        }
        if ((room == rmTrainstationEntrance && objPlayer.sprite_index == sprPWalkBag) || objPlayer.sprite_index == sprPWalkBagChips || objPlayer.sprite_index == sprPAttackBag || objPlayer.sprite_index == sprPBagKill)
        {
            finishstring = "KILL ALL ENEMIES";
        }
    }
    if (!instance_exists(objPlayer) || global.done == 1 || objPlayer.sprite_index == sprPAttackFaceKick)
    {
        finish = 0;
    }
}
if (((global.shells > 0 && global.maskindex == 3 && instance_exists(objPlayerMouse) && (objPlayer.sprite_index == sprJacketWalkShorty || objPlayer.sprite_index == sprJacketAttackShorty1 || objPlayer.sprite_index == sprJacketAttackShorty2 || objPlayer.sprite_index == sprAubreyReloadShorty1ShellRight || objPlayer.sprite_index == sprAubreyReloadShorty1ShellLeft || objPlayer.sprite_index == sprAubreyReloadShorty2Shells)) || (global.knives > 0 && global.maskindex == 6 && instance_exists(objPlayerMouse))) && global.done == 0 && !instance_exists(objPlayerDead))
{
    showextraammo = 1;
}
else
{
    showextraammo = 0;
}
if (showextraammo == 1)
{
    if (global.maskindex == 3)
    {
        if (global.hlm2hud == 0)
        {
            shellsstring = "+" + string(global.shells - 4);
        }
        else if (global.shells < 10)
        {
            shellsstring = "0" + string(global.shells);
        }
        else
        {
            shellsstring = string(global.shells);
        }
    }
    if (global.maskindex == 6)
    {
        if (global.hlm2hud == 0)
        {
            shellsstring = "+" + string(global.knives);
        }
        else if (global.knives < 10)
        {
            shellsstring = "0" + string(global.knives);
        }
        else
        {
            shellsstring = string(global.knives);
        }
    }
    if (global.hlm2hud == 0)
    {
        if (shellsline < 39)
        {
            shellsline += 3;
        }
        else
        {
            shellsline = 39;
        }
    }
    else if (shellsline < 55)
    {
        shellsline += 5;
    }
    else
    {
        shellsline = 55;
    }
}
else if (shellsline > -6.5)
{
    shellsline -= 6.5;
}
if (instance_exists(objPlayerMouse))
{
    if ((global.combo % 5) == 0 && global.combo >= 5 && global.combo <= 50 && global.combogift == 0 && !instance_exists(objPlayerDead) && global.maskindex == 6 && global.done == 0)
    {
        if (ammoaddstep < 21)
        {
            ammoaddstep += 0.5;
            if (ammoaddx < 0)
            {
                ammoaddx += 8;
            }
        }
        if (ammoaddstep == 21)
        {
            if (ammoaddx > -32)
            {
                ammoaddx -= 8;
            }
        }
    }
    else
    {
        ammoaddstep = 0;
        if (ammoaddx > -32)
        {
            ammoaddx -= 8;
        }
    }
    if (objPlayer.sprite_index == sprPSkippyPunch || objPlayer.sprite_index == sprPSkippyPunchWalk || objPlayer.sprite_index == sprPSkippyPunchStart)
    {
        ammox = lerp(ammox, -96, 0.25);
    }
}
else if (ammoaddx > -32)
{
    ammoaddx -= 8;
}
if (global.interfaceon == 1)
{
    if (ammoaddx > -32)
    {
        draw_set_font(fntScore);
        draw_set_color(c_black);
        draw_rectangle(-1, global.viewhview - 80 - 7, 30 + ammoaddx, (global.viewhview - 80) + 7, false);
        draw_rectangle_color(30 + ammoaddx, global.viewhview - 80 - 7, 31 + ammoaddx, (global.viewhview - 80) + 7, colormag2, colormag2, colormag2, colormag2, 0);
        draw_set_color(colormag1);
        draw_text_transformed(23 + ammoaddx, (global.viewhview - 80) + 1, "+", 0.9, 0.9, 0);
        draw_set_color(colormag2);
        draw_text_transformed(24 + ammoaddx, global.viewhview - 80, "+", 0.9, 0.9, 0);
    }
    if (global.hlm2hud == 0)
    {
        if (update == 0)
        {
            draw_set_font(fntScore);
        }
        else
        {
            draw_set_font(fntScoreUpdate);
        }
    }
    else if (update == 0)
    {
        draw_set_font(fntScore);
    }
    else
    {
        draw_set_font(fntScore);
    }
    draw_set_color(c_black);
    if (shellsline > -6.5)
    {
        draw_rectangle(-10, 189, shellsline, 209, false);
        draw_rectangle_color(shellsline, 189, shellsline + 1, 209, color2, color2, color2, color2, 0);
    }
    draw_set_color(c_black);
    draw_rectangle(global.viewwview - 18 - string_width(scorestring) - 6, 14, global.viewwview, 38, false);
    draw_rectangle_color(global.viewwview - 19 - string_width(scorestring) - 6, 14, global.viewwview - 18 - string_width(scorestring) - 6, 38, color2, color2, color2, color2, 0);
    draw_rectangle(0, global.viewhview - ammoy - 11, 18 + string_width(ammostring) + 6, (global.viewhview - ammoy) + 11, false);
    draw_set_font(scorefont);
    if (ammox > -96)
    {
        if (global.hlm2hud == 1)
        {
            draw_rectangle(-1, global.viewhview - 28 - 11, 18 + string_width(ammostring) + 19 + ammox, (global.viewhview - 28) + 11, false);
            draw_rectangle_color(18 + string_width(ammostring) + 19 + ammox, global.viewhview - 28 - 11, 19 + string_width(ammostring) + 19 + ammox, (global.viewhview - 28) + 11, color2, color2, color2, color2, 0);
        }
        else
        {
            draw_rectangle(-1, global.viewhview - 28 - 11, 18 + string_width(ammostring) + 6 + ammox, (global.viewhview - 28) + 11, false);
            draw_rectangle_color(18 + string_width(ammostring) + 6 + ammox, global.viewhview - 28 - 11, 19 + string_width(ammostring) + 6 + ammox, (global.viewhview - 28) + 11, color2, color2, color2, color2, 0);
        }
        if (global.hlm2hud == 1)
        {
            if (instance_exists(objPlayerShieldMouse) || instance_exists(objPlayerMouse) || instance_exists(objPlayerMouseHouse) || instance_exists(objPlayerBiker) || instance_exists(objPigButcher))
            {
                if ((objPlayer.ammo > 0 && showammo == 1 && ammostring == string(objPlayer.ammo)) || ammostring == ("0" + string(objPlayer.ammo)))
                {
                    if (global.ammotype == 14)
                    {
                        d3d_set_fog(true, color1, 0, 0);
                        draw_sprite_ext(sprAmmoSymbols, global.ammotype, 19 + ammox, global.viewhview - 28 - 1, 1, 1, image_angle + lengthdir_x(6, ((dir * 1.94) + shake) - 240), c_white, 1);
                        d3d_set_fog(false, c_black, 0, 0);
                        draw_sprite_ext(sprAmmoSymbols, global.ammotype, 19 + ammox, global.viewhview - 28 - 1, 1, 1, image_angle + lengthdir_x(6, ((dir * 1.94) + shake) - 180), c_white, 1);
                        draw_sprite_ext(sprAmmoSymbols, 15, 19 + ammox, global.viewhview - 28 - 1, 1, 1, image_angle + lengthdir_x(6, ((dir * 1.94) + shake) - 180), c_white, 1);
                        draw_set_blend_mode(bm_add);
                        draw_sprite_ext(sprAmmoSymbols, 17, 19 + ammox, global.viewhview - 28 - 1, 1, 1, image_angle + lengthdir_x(6, ((dir * 1.94) + shake) - 180), merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 1 - global.GlowCharge);
                        draw_set_blend_mode(bm_normal);
                        draw_sprite_ext(sprAmmoSymbols, 16, 19 + ammox, global.viewhview - 28 - 1, 1, 1, image_angle + lengthdir_x(6, ((dir * 1.94) + shake) - 180), merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 1 - global.GlowCharge);
                        draw_sprite_ext(sprAmmoSymbols, 16, 19 + ammox, global.viewhview - 28 - 1, 1, 1, image_angle + lengthdir_x(6, ((dir * 1.94) + shake) - 180), merge_color(c_purple, c_fuchsia, clamp(global.GlowDebuff, 0, 1)), global.GlowDebuff);
                        draw_set_blend_mode(bm_normal);
                        draw_set_alpha(global.GlowCharge / 2);
                        draw_rectangle(-1, global.viewhview - 28 - 11, 18 + string_width(ammostring) + 19 + ammox, (global.viewhview - 28) + 11, false);
                        draw_set_alpha(1);
                        draw_set_blend_mode(bm_add);
                        draw_sprite_ext(sprAmmoSymbols, 17, 19 + ammox, global.viewhview - 28 - 1, 1, 1, image_angle + lengthdir_x(6, ((dir * 1.94) + shake) - 180), c_white, global.GlowCharge);
                        draw_set_blend_mode(bm_normal);
                        draw_sprite_ext(sprAmmoSymbols, 16, 19 + ammox, global.viewhview - 28 - 1, 1, 1, image_angle + lengthdir_x(6, ((dir * 1.94) + shake) - 180), c_white, global.GlowCharge);
                    }
                    else
                    {
                        d3d_set_fog(true, color1, 0, 0);
                        draw_sprite_ext(sprAmmoSymbols, global.ammotype, 19 + ammox, global.viewhview - 28 - 1, 1, 1, image_angle + lengthdir_x(6, ((dir * 1.94) + shake) - 240), c_white, 1);
                        d3d_set_fog(false, c_black, 0, 0);
                        draw_sprite_ext(sprAmmoSymbols, global.ammotype, 19 + ammox, global.viewhview - 28 - 1, 1, 1, image_angle + lengthdir_x(6, ((dir * 1.94) + shake) - 180), c_white, 1);
                    }
                    if (global.maskindex == 26 && global.maskon == 1)
                    {
                        draw_sprite_ext(sprAmmoSymbols, global.ammotype, 19 + ammox, global.viewhview - 28 - 1, 1, 1, image_angle + lengthdir_x(6, ((dir * 1.94) + shake) - 180), c_red, 1);
                    }
                }
            }
        }
    }
    if (shellsline > -6.5)
    {
        if (global.hlm2hud == 1)
        {
            if (global.shells > 0 && global.maskindex == 3)
            {
                d3d_set_fog(true, color1, 0, 0);
                draw_sprite_ext(sprAmmoSymbols, 5, shellsline - 12 - 25, global.viewhview - 28 - 29, 1, 1, image_angle + lengthdir_x(6, (dir * 1.94) - 240), c_white, 1);
                d3d_set_fog(false, c_black, 0, 0);
                draw_sprite_ext(sprAmmoSymbols, 5, shellsline - 12 - 25, global.viewhview - 28 - 29, 1, 1, image_angle + lengthdir_x(6, (dir * 1.94) - 180), c_white, 1);
            }
            if (global.knives > 0 && global.maskindex == 6)
            {
                d3d_set_fog(true, color1, 0, 0);
                draw_sprite_ext(sprAmmoSymbols, clamp(string(global.knives + 10), 11, 13), shellsline - 12 - 25, global.viewhview - 28 - 29, 1, 1, image_angle + lengthdir_x(6, (dir * 1.94) - 240), c_white, 1);
                d3d_set_fog(false, c_black, 0, 0);
                draw_sprite_ext(sprAmmoSymbols, clamp(string(global.knives + 10), 11, 13), shellsline - 12 - 25, global.viewhview - 28 - 29, 1, 1, image_angle + lengthdir_x(6, (dir * 1.94) - 180), c_white, 1);
            }
        }
    }
    if (finish == 1)
    {
        draw_rectangle((global.viewwview / 2) - (string_width(finishstring) * 0.513) - 3, global.viewhview - 24.5, (global.viewwview / 2) + (string_width(finishstring) * 0.513) + 3, global.viewhview - 11.5, false);
        draw_set_font(fntScore);
        draw_set_color(color1finish);
        draw_text((global.viewwview / 2) + 1.5, (global.viewhview - 18.5) + 1.5, finishstring);
        draw_set_color(color2finish);
        draw_text((global.viewwview / 2) + lengthdir_x(0.5, (dir * 1.34) - 180), (global.viewhview - 18.5) + lengthdir_x(0.5, (dir * 1.34) - 180), finishstring);
    }
    if (global.hlm2hud == 0)
    {
        if (update == 0)
        {
            draw_set_font(fntScore);
        }
        else
        {
            draw_set_font(fntScoreUpdate);
        }
    }
    else if (update == 0)
    {
        draw_set_font(fntScore);
    }
    else
    {
        draw_set_font(fntScore);
    }
    draw_set_color(color1);
    draw_text_transformed((global.viewwview - 18 - (string_width(scorestring) * 0.5)) + lengthdir_x(1, dir - 260), 26 + lengthdir_y(1, dir - 260), scorestring, 1, 1, lengthdir_x(2, dir * 1.34));
    draw_set_font(scorefont);
    if (ammox > -96)
    {
        if (global.hlm2hud == 1)
        {
            draw_text_transformed(31 + (string_width(ammostring) * 0.5) + lengthdir_x(1, dir - 260) + ammox, (global.viewhview - 28) + lengthdir_y(1, dir - 260), ammostring, 1, 1, lengthdir_x(2, dir * 1.34));
        }
        else
        {
            draw_text_transformed(18 + (string_width(ammostring) * 0.5) + lengthdir_x(1, dir - 260) + ammox, (global.viewhview - 28) + lengthdir_y(1, dir - 260), ammostring, 1, 1, lengthdir_x(2, dir * 1.34));
        }
    }
    draw_set_color(color2);
    if (ammox > -96)
    {
        if (global.hlm2hud == 1)
        {
            draw_text_transformed(31 + (string_width(ammostring) * 0.5) + lengthdir_x(1, dir - 180) + ammox, (global.viewhview - 28) + lengthdir_y(1, dir - 180), ammostring, 1, 1, lengthdir_x(2, (dir * 1.34) - 2));
        }
        else
        {
            draw_text_transformed(18 + (string_width(ammostring) * 0.5) + lengthdir_x(1, dir - 180) + ammox, (global.viewhview - 28) + lengthdir_y(1, dir - 180), ammostring, 1, 1, lengthdir_x(2, (dir * 1.34) - 2));
        }
    }
    if (global.hlm2hud == 0)
    {
        if (update == 0)
        {
            draw_set_font(fntScore);
        }
        else
        {
            draw_set_color(c_white);
            draw_set_font(fntScoreUpdate);
        }
    }
    else
    {
        draw_set_font(fntScore);
    }
    draw_text_transformed((global.viewwview - 18 - (string_width(scorestring) * 0.5)) + lengthdir_x(1, dir - 180), 26 + lengthdir_y(1, dir - 180), scorestring, 1, 1, lengthdir_x(2, (dir * 1.34) - 2));
    if (shellsline > -6.5)
    {
        if (global.hlm2hud == 1)
        {
            draw_set_color(color1);
            draw_text_transformed((shellsline - 12) + lengthdir_x(1, dir - 260), 199 + lengthdir_y(1, dir - 260), shellsstring, 1, 1, lengthdir_x(2, dir * 1.34));
            draw_set_color(color2);
            draw_text_transformed((shellsline - 12) + lengthdir_x(1, dir - 180), 199 + lengthdir_y(1, dir - 180), shellsstring, 1, 1, lengthdir_x(2, (dir * 1.34) - 2));
        }
        else
        {
            if (global.maskindex == 3)
            {
                if (global.shells <= 4)
                {
                    draw_sprite_ext(ShellsHud, global.shells - 1, (shellsline - 50) + lengthdir_x(0.5, dir) + 14, (200 + lengthdir_y(1, dir)) - 10, 1, 1, lengthdir_x(2, dir * 1.34), color1, 1);
                    draw_sprite_ext(ShellsHud, global.shells - 1, (shellsline - 50) + lengthdir_x(1, dir - 180) + 14, (200 + lengthdir_y(1, dir - 180)) - 10, 1, 1, lengthdir_x(2, dir * 1.34), color2, 1);
                }
                else
                {
                    draw_sprite_ext(ShellsHud, 3, (shellsline - 50) + lengthdir_x(0.5, dir), (199 + lengthdir_y(1, dir - 260)) - 10, 1, 1, lengthdir_x(2, dir * 1.34), color1, 1);
                    draw_sprite_ext(ShellsHud, 3, (shellsline - 50) + lengthdir_x(1, dir - 180), (199 + lengthdir_y(1, dir - 180)) - 10, 1, 1, lengthdir_x(2, dir * 1.34), color2, 1);
                    draw_set_color(color1);
                    draw_text_transformed((shellsline - 12) + lengthdir_x(1, dir - 260), 199 + lengthdir_y(1, dir - 260), shellsstring, 1, 1, lengthdir_x(2, dir * 1.34));
                    draw_set_color(color2);
                    draw_text_transformed((shellsline - 12) + lengthdir_x(1, dir - 180), 199 + lengthdir_y(1, dir - 180), shellsstring, 1, 1, lengthdir_x(2, (dir * 1.34) - 2));
                }
            }
            if (global.maskindex == 6)
            {
                draw_sprite_ext(sprWThrowingKnifeIcon, 0, (shellsline - 26) + lengthdir_x(0.5, dir), 199 + lengthdir_y(1, dir - 260), 1, 1, -15, color1, 1);
                draw_set_color(color1);
                draw_text_transformed((shellsline - 12) + lengthdir_x(1, dir - 260), 199 + lengthdir_y(1, dir - 260), shellsstring, 1, 1, lengthdir_x(2, dir * 1.34));
                draw_sprite_ext(sprWThrowingKnifeIcon, 0, (shellsline - 25) + lengthdir_x(1, dir - 180), 199 + lengthdir_y(1, dir - 180), 1, 1, -15, color2, 1);
                draw_set_color(color2);
                draw_text_transformed((shellsline - 12) + lengthdir_x(1, dir - 180), 199 + lengthdir_y(1, dir - 180), shellsstring, 1, 1, lengthdir_x(2, (dir * 1.34) - 2));
            }
        }
    }
}
