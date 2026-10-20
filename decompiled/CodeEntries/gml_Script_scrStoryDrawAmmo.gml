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
                if (global.combo >= 4)
                {
                    scrAchievementSet("Combo Beginner");
                }
                if (global.combo >= 6)
                {
                    scrAchievementSet("Combo Intermediate");
                }
                if (global.combo >= 8)
                {
                    scrAchievementSet("Combo Pro");
                }
                if (global.combo >= 10)
                {
                    scrAchievementSet("Combo Master");
                }
                if (global.combo >= 12)
                {
                    scrAchievementSet("Combo King");
                }
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
colorblack = 0;
if (global.hlm2hud == 0)
{
    color2 = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_white, 0.5 + lengthdir_x(0.5, dir * 3));
    color1 = merge_color(c_maroon, merge_color(c_aqua, c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
}
else
{
    color2 = merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3.21));
    color1 = merge_color(c_orange, c_maroon, 0.5 + lengthdir_x(0.5, dir * 2.71));
}
color2finish = merge_color(c_white, c_fuchsia, 0.5 - lengthdir_x(0.5, coldir * 3.21));
color1finish = merge_color(c_purple, c_teal, 0.5 - lengthdir_x(0.5, coldir * 2.71));
if (global.maskindex == 26 && global.maskon == 1)
{
    color2 = merge_color(c_maroon, c_red, 0.5 + lengthdir_x(0.5, dir * 3.21));
    color1 = merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, dir * 2.71));
    color2finish = merge_color(c_white, c_red, 0.5 - lengthdir_x(0.5, coldir * 3.21));
    color1finish = merge_color(c_red, c_maroon, 0.5 - lengthdir_x(0.5, coldir * 2.71));
}
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
showammo = 0;
skippy = 0;
if (instance_exists(objPlayer))
{
    if (objPlayer.object_index == objPlayerShieldMouse)
    {
        showammo = 1;
    }
    if (objPlayer.object_index == objPlayerShieldMouse)
    {
        showammo = 1;
    }
    if (global.hlm2hud == 1)
    {
        if (objPlayer.sprite_index == sprPHumanShieldUziShoot || objPlayer.sprite_index == sprPHumanShieldScorpionShoot || objPlayer.sprite_index == sprPHumanShieldMagnumShoot || objPlayer.sprite_index == sprPHumanShieldDoubleBarrelShoot1 || objPlayer.sprite_index == sprPHumanShieldDoubleBarrelShoot2 || objPlayer.sprite_index == sprPHumanShieldSilencerShoot || objPlayer.sprite_index == sprPHumanShieldMP5Shoot || objPlayer.sprite_index == sprPAttackHumanShieldSilencedUzi || objPlayer.sprite_index == sprPAttackHumanShieldAks || objPlayer.sprite_index == sprPHumanShield9mmShoot || objPlayer.sprite_index == sprPAttackHumanShieldNailgun)
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
    if (objPlayer.sprite_index == sprJacketWalkShorty || objPlayer.sprite_index == sprJacketAttackShorty1 || objPlayer.sprite_index == sprJacketAttackShorty2 || objPlayer.sprite_index == sprAubreyReloadShorty1ShellRight || objPlayer.sprite_index == sprAubreyReloadShorty1ShellLeft || objPlayer.sprite_index == sprAubreyReloadShorty2Shells)
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
        if (room == rmSecretSewer)
        {
            showammo = 0;
        }
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
    if (objPlayer.sprite_index == sprPAttackSkippyBig || objPlayer.sprite_index == sprPAttackSkippyLow || objPlayer.sprite_index == sprPAttackSkippyMedium || objPlayer.sprite_index == sprPEndSkippyAim || objPlayer.sprite_index == sprPStartSkippy || objPlayer.sprite_index == sprPStartSkippyAim || objPlayer.sprite_index == sprPWalkSkippy || objPlayer.sprite_index == sprPWalkSkippyAim || objPlayer.sprite_index == sprPKillSkippyEnd || objPlayer.sprite_index == sprPIdleSkippy2 || objPlayer.sprite_index == sprPIdleSkippy2End || objPlayer.sprite_index == sprPKillSkippyEndTransitionUNUSED)
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
        if (objPlayer.sprite_index == sprPAttackM16 || objPlayer.sprite_index == sprPAttackKalashnikov || objPlayer.sprite_index == sprPAttackHuntingRifle || objPlayer.sprite_index == sprPAttackUzi || objPlayer.sprite_index == sprPAttackScorpion || objPlayer.sprite_index == sprPAttackMagnum || objPlayer.sprite_index == sprPAttackSilencedUzi || objPlayer.sprite_index == sprPAttackShotgun || objPlayer.sprite_index == sprPAttackDoubleBarrel1 || objPlayer.sprite_index == sprPAttackDoubleBarrel2 || objPlayer.sprite_index == sprPAttackSilencer || objPlayer.sprite_index == sprPAttack9mm || objPlayer.sprite_index == sprPAttackMP5 || objPlayer.sprite_index == sprGriffinAttack9mm || objPlayer.sprite_index == sprBikerAttackKnife || objPlayer.sprite_index == sprBoss2ThrowKnife || objPlayer.sprite_index == sprPAttackM60 || objPlayer.sprite_index == sprPigButcherAttackDoubleBarrel1 || objPlayer.sprite_index == sprPigButcherAttackDoubleBarrel2 || objPlayer.sprite_index == sprPAttackShotgunTurn || objPlayer.sprite_index == sprJacketAttackShorty1 || objPlayer.sprite_index == sprJacketAttackShorty2 || objPlayer.sprite_index == sprPAttackNailgun || objPlayer.sprite_index == sprPAttackAks)
        {
            shake += 15;
        }
    }
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
            if (objPlayer.ammo < 1)
            {
                ammostring = "EMPTY";
            }
        }
        else
        {
            ammostring = string(objPlayer.ammo) + "/" + string(maxammo) + "RNDS";
            if (objPlayer.ammo < 1)
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
        ammostring = "NO GUN";
        showammo = 0;
    }
    if (instance_exists(objPlayerBiker) || instance_exists(objPlayerBikerHouse))
    {
        if ((showammo == 1 && !room == 144) || !room == 143)
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
            else
            {
                ammostring = string(objPlayer.ammo) + " KNIVES";
            }
            if (objPlayer.ammo < 1)
            {
                if (global.hlm2hud == 1)
                {
                    ammostring = "EMPTY";
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
        else
        {
            ammostring = "NO GUN";
            showammo = 0;
        }
    }
}
else if (instance_exists(objPlayerDead))
{
    if (room == rmSequence12b || room == rmSequence12c)
    {
        showammo = 0;
    }
    else
    {
        scrDrawRestartHLM2();
    }
}
finish = 0;
scorestring = global.drawscore;
if (room == rmAlley && !instance_exists(objPhoneConversation))
{
    if (instance_exists(objPlayer))
    {
        finish = 1;
        if (objPlayer.sprite_index == sprPWalkBag || objPlayer.sprite_index == sprPWalkBagChips || objPlayer.sprite_index == sprPAttackBag)
        {
            finishstring = "LEAVE A BRIEFCASE";
        }
        if (instance_exists(objHobo) || instance_exists(objHoboKnockedOut))
        {
            finishstring = "KILL HIM";
        }
    }
    if (!instance_exists(objPlayer) || global.done == 1)
    {
        finish = 0;
    }
}
if (global.interfaceon == 1)
{
    if (showammo == 1 && !instance_exists(objPhoneConversation))
    {
        if (update == 0)
        {
            draw_set_font(fntScore);
        }
        else
        {
            draw_set_font(fntScore);
        }
        draw_set_color(colorblack);
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
            if (instance_exists(objPlayerMouse) || instance_exists(objPlayerMouseHouse) || instance_exists(objPlayerShieldMouse) || instance_exists(objPlayerBiker))
            {
                if ((objPlayer.ammo > 0 && showammo == 1 && !instance_exists(objPhoneConversation) && ammostring == string(objPlayer.ammo)) || ammostring == ("0" + string(objPlayer.ammo)))
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
        draw_set_font(fntScore);
        draw_set_color(color1);
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
    }
    if (finish == 1)
    {
        draw_set_color(colorblack);
        draw_rectangle((global.viewwview / 2) - (string_width(finishstring) * 0.513) - 3, global.viewhview - 24.5, (global.viewwview / 2) + (string_width(finishstring) * 0.513) + 3, global.viewhview - 11.5, false);
        draw_set_font(fntScore);
        draw_set_color(color1finish);
        draw_text((global.viewwview / 2) + 1.5, (global.viewhview - 18.5) + 1.5, finishstring);
        draw_set_color(color2finish);
        draw_text((global.viewwview / 2) + lengthdir_x(0.5, dir - 180), (global.viewhview - 18.5) + lengthdir_x(0.5, dir - 180), finishstring);
    }
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
