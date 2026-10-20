d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
if (global.combo > 0)
{
    if (global.combotime > 120)
    {
        global.combotime = 120;
    }
    if (global.combotime > 0)
    {
        global.combotime -= 1;
        if (global.maskindex == 13)
        {
            global.combotime += 0.25;
        }
    }
    else
    {
        if (global.combo > 1)
        {
            global.myscore += ((300 + (global.combo * 125)) * global.combo);
            global.comboscore += ((300 + (global.combo * 125)) * global.combo);
            if (instance_exists(objPlayer))
            {
                my_id = instance_create(objPlayer.x, objPlayer.y - 32, objScore);
                my_id.text = string(global.combo) + "x combo#+" + string((100 + (global.combo * 125)) * global.combo);
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
                ds_list_add(global.bonuslist, string(global.combo) + "x combo");
                if (global.bonustime < (10 + (global.combo * 5)))
                {
                    global.bonustime = 10 + (global.combo * 5);
                }
            }
        }
        global.combo = 0;
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
if ((instance_number(objEnemy) + instance_number(objEnemyBash)) == 0)
{
    update = 1;
}
if (!instance_exists(objPlayer))
{
    update = 1;
}
scorestring = string(global.drawscore) + "pts";
coloraqua = merge_color(merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_aqua, 0.5 + lengthdir_x(0.5, dir * 3));
colorbackshadow = merge_color(merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_purple, 0.5 + lengthdir_x(0.5, dir * 3));
color2 = merge_color(c_blue, merge_color(c_aqua, c_aqua, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
colorred = merge_color(c_red, merge_color(c_navy, c_navy, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
colorblack = merge_color(c_black, merge_color(c_black, c_black, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
colorcombo1 = merge_color(merge_color(c_fuchsia, c_red, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3));
colorcombo2 = merge_color(merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_red, 0.5 + lengthdir_x(0.5, dir * 3));
dir += (1 + (update * 7));
global.dir += 1;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
showammo = 0;
if (instance_exists(objPlayer))
{
    if (objPlayer.sprite_index == sprPWalkM16 || objPlayer.sprite_index == sprPAttackM16 || sprite_index == sprPigButcherWalkM16 || sprite_index == sprPigButcherAttackM16)
    {
        showammo = 1;
        maxammo = 20;
    }
    if (objPlayer.sprite_index == sprPWalkKalashnikov || objPlayer.sprite_index == sprPAttackKalashnikov || sprite_index == sprPigButcherWalkAK || sprite_index == sprPigButcherAttackAK)
    {
        showammo = 1;
        maxammo = 24;
    }
    if (objPlayer.sprite_index == sprPWalkHuntingRifle || objPlayer.sprite_index == sprPAttackHuntingRifle)
    {
        showammo = 1;
        maxammo = 8;
    }
    if (objPlayer.sprite_index == sprPWalkUzi || objPlayer.sprite_index == sprPAttackUzi)
    {
        showammo = 1;
        maxammo = 30;
    }
    if (objPlayer.sprite_index == sprPWalkScorpion || objPlayer.sprite_index == sprPAttackScorpion)
    {
        showammo = 1;
        maxammo = 20;
    }
    if (objPlayer.sprite_index == sprPWalkMagnum || objPlayer.sprite_index == sprPAttackMagnum)
    {
        showammo = 1;
        maxammo = 6;
    }
    if (objPlayer.sprite_index == sprPWalkSilencedUzi || objPlayer.sprite_index == sprPAttackSilencedUzi)
    {
        showammo = 1;
        maxammo = 30;
    }
    if (objPlayer.sprite_index == sprPWalkShotgun || objPlayer.sprite_index == sprPAttackShotgun || sprite_index == sprPigButcherWalkShotgun || sprite_index == sprPigButcherAttackShotgun)
    {
        showammo = 1;
        maxammo = 6;
    }
    if (objPlayer.sprite_index == sprPWalkDoubleBarrel || objPlayer.sprite_index == sprPAttackDoubleBarrel1 || objPlayer.sprite_index == sprPAttackDoubleBarrel2 || sprite_index == sprPigButcherWalkDoubleBarrel || sprite_index == sprPigButcherAttackDoubleBarrel1 || sprite_index == sprPigButcherAttackDoubleBarrel2)
    {
        showammo = 1;
        maxammo = 2;
    }
    if (objPlayer.sprite_index == sprPWalkSilencer || objPlayer.sprite_index == sprPAttackSilencer || sprite_index == sprPigButcherWalkSilencer || sprite_index == sprPigButcherAttackSilencer)
    {
        showammo = 1;
        maxammo = 13;
    }
    if (objPlayer.sprite_index == sprPWalk9mm || objPlayer.sprite_index == sprPAttack9mm || sprite_index == sprPigButcherWalk9mm || sprite_index == sprPigButcherAttack9mm)
    {
        showammo = 1;
        maxammo = 17;
    }
    if (objPlayer.sprite_index == sprPWalkMP5 || objPlayer.sprite_index == sprPAttackMP5 || sprite_index == sprPigButcherShoot || sprite_index == sprPigButcherWalkMP5)
    {
        showammo = 1;
        maxammo = 32;
    }
    if (objPlayer.sprite_index == sprGriffinWalk || objPlayer.sprite_index == sprGriffinAttackKnife || objPlayer.sprite_index == sprGriffinAttack9mm)
    {
        showammo = 1;
        maxammo = 17;
    }
    if (showammo == 1)
    {
        ammostring = string(objPlayer.ammo);
        if (ammoy < 16)
        {
            ammoy += 4;
        }
        else
        {
            ammoy = 20;
        }
    }
    else
    {
        ammostring = "No gun";
        if ((instance_number(objEnemy) + instance_number(objKnockedOut)) > 0)
        {
            if (ammoy > -32)
            {
                ammoy -= 1;
            }
        }
    }
    if (global.combo < 2)
    {
        combostring = "";
    }
    else
    {
        combostring = string(global.combo) + "x";
    }
    if (instance_exists(objPlayerBiker) || instance_exists(objPlayerBikerHouse))
    {
        if (objPlayer.ammo > 0)
        {
            showammo = 1;
            ammostring = string(objPlayer.ammo) + "";
            if (ammoy < 16)
            {
                ammoy += 4;
            }
            else
            {
                ammoy = 20;
            }
            if (objPlayer.ammo >= 3)
            {
                global.ammotype = 8;
            }
            else if (objPlayer.ammo == 2)
            {
                global.ammotype = 9;
            }
            else if (objPlayer.ammo == 1)
            {
                global.ammotype = 10;
            }
        }
        else
        {
            ammostring = "NO KNIVES";
            if ((instance_number(objEnemy) + instance_number(objKnockedOut)) > 0)
            {
                if (ammoy > -32)
                {
                    ammoy -= 1;
                }
            }
        }
    }
    if (instance_exists(objPlayerMouse))
    {
        if (objPlayer.ammo == 0)
        {
            ammostring = "Empty";
        }
    }
    if (objPlayer.sprite_index == sprGriffinReload9mm)
    {
        showammo = 1;
        ammostring = "Reloading...";
    }
    if (global.done)
    {
        ammostring = "GO TO CAR";
        if (instance_exists(objPlayerBiker) || instance_exists(objPlayerBikerHouse))
        {
            ammostring = "GO TO BIKE";
        }
        if (ammoy < 20)
        {
            ammoy += 1;
        }
        else
        {
            ammoy = 20;
        }
    }
}
else if (instance_exists(objPlayerDead))
{
    if (global.xbox == 0)
    {
        ammostring = "";
    }
    else
    {
        ammostring = "";
    }
    if (ammoy < 20)
    {
        ammoy += 1;
    }
    else
    {
        ammoy = 20;
    }
}
finish = 0;
if (room == rmTrainstationEntrance || room == rmTrainstationDownstairs || room == rmAlley)
{
    if (instance_exists(objPlayer))
    {
        finish = 1;
        if (global.xbox == 1)
        {
            finishstring = "[LEFT BUTTON] TO AIM";
        }
        else
        {
            finishstring = "[SHIFT] TO AIM";
        }
        if (instance_exists(objWeapon))
        {
            if (global.xbox == 1)
            {
                finishstring = "[LEFT TRIGGER] TO TAKE WEAPON";
            }
            else
            {
                finishstring = "[RIGHT MOUSE] TO TAKE WEAPON";
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
                finishstring = "[LEFT TRIGGER] TO THROW WEAPON";
            }
            else
            {
                finishstring = "[RIGHT MOUSE] TO THROW WEAPON";
            }
        }
        else if (global.xbox == 1)
        {
            finishstring = "[LEFT BUTTON] TO AIM";
        }
        else
        {
            finishstring = "[SHIFT] TO AIM";
        }
        if (instance_exists(objKnockedOut) || instance_exists(objHoboKnockedOut))
        {
            if (global.xbox == 1)
            {
                finishstring = "[A] FOR GROUND KILLS";
            }
            else
            {
                finishstring = "[SPACE] FOR GROUND KILLS";
            }
        }
    }
    if (!instance_exists(objPlayer) || global.done == 1)
    {
        finish = 0;
    }
}
if (update == 0)
{
    draw_set_font(fntScoreHLM2);
}
else
{
    draw_set_font(fntScoreUpdateHLM2);
}
draw_set_color(c_black);
draw_set_font(fntScore);
draw_set_color(coloraqua);
if (update == 0)
{
    draw_set_font(fntScoreHLM2);
}
else
{
    draw_set_font(fntScoreUpdateHLM2);
}
draw_set_color(colorred);
draw_text_color(view_wview[0] - 18 - (string_width(scorestring) * 0.5) - 1 - lengthdir_x(0.5, global.dir * 4), 19 - lengthdir_x(0.5, global.dir * 4), string(scorestring), c_black, c_black, c_black, c_black, 1);
draw_text_color((view_wview[0] - 18 - (string_width(scorestring) * 0.5)) + 2, 22, string(scorestring), c_black, c_black, c_black, c_black, 1);
draw_text_color((view_wview[0] - 18 - (string_width(scorestring) * 0.5)) + 1, 21, string(scorestring), colorbackshadow, colorbackshadow, c_maroon, c_maroon, 1);
draw_text_color(view_wview[0] - 18 - (string_width(scorestring) * 0.5) - lengthdir_x(0.5, global.dir * 4), 20 - lengthdir_x(0.5, global.dir * 4), string(scorestring), coloraqua, coloraqua, c_teal, c_teal, 1);
draw_set_font(fntScore);
if (finish == 1)
{
    draw_text_color((view_wview[0] / 2) - 1, view_hview[0] - 11 - 1, string(finishstring), c_black, c_black, c_black, c_black, 1);
    draw_text_color((view_wview[0] / 2) + 2, (view_hview[0] - 11) + 2, string(finishstring), c_black, c_black, c_black, c_black, 1);
    draw_text_color((view_wview[0] / 2) + 1, (view_hview[0] - 11) + 1, string(finishstring), c_blue, c_blue, c_navy, c_navy, 1);
    draw_text_color(view_wview[0] / 2, view_hview[0] - 11, string(finishstring), c_ltgray, c_ltgray, c_dkgray, c_dkgray, 1);
}
draw_set_color(color2);
draw_set_font(fntScoreHLM2);
if (instance_exists(objPlayer))
{
    if (objPlayer.ammo > 0 && showammo == 1 && ammostring == (string(objPlayer.ammo) + ""))
    {
        draw_sprite_ext(sprAmmoSymbols, global.ammotype, 15, view_hview[0] - ammoy, 1, 1, 0, c_white, 1);
    }
}
draw_text_color((23 + (string_width(ammostring) * 0.5)) - 1 - lengthdir_x(0.5, global.dir * 4), view_hview[0] - ammoy - 1 - lengthdir_x(0.5, global.dir * 4), string(ammostring), c_black, c_black, c_black, c_black, 1);
draw_text_color(23 + (string_width(ammostring) * 0.5) + 2, (view_hview[0] - ammoy) + 2, string(ammostring), c_black, c_black, c_black, c_black, 1);
draw_text_color(23 + (string_width(ammostring) * 0.5) + 1, (view_hview[0] - ammoy) + 1, string(ammostring), colorbackshadow, colorbackshadow, c_maroon, c_maroon, 1);
draw_text_color((23 + (string_width(ammostring) * 0.5)) - lengthdir_x(0.5, global.dir * 4), view_hview[0] - ammoy - lengthdir_x(0.5, global.dir * 4), string(ammostring), coloraqua, coloraqua, c_teal, c_teal, 1);
draw_set_font(fntComboHLM2);
draw_text_color((18 + (string_width(combostring) * 0.5) + lengthdir_x(1, dir)) - 1, 19 + lengthdir_y(1, dir), string(combostring), c_black, c_black, c_black, c_black, 1);
draw_text_color(18 + (string_width(combostring) * 0.5) + lengthdir_x(1, dir) + 2, 22 + lengthdir_y(1, dir), string(combostring), c_black, c_black, c_black, c_black, 1);
draw_text_color(18 + (string_width(combostring) * 0.5) + lengthdir_x(1, dir) + 1, 21 + lengthdir_y(1, dir), string(combostring), colorcombo2, colorcombo2, colorcombo1, colorcombo1, 1);
draw_text_color(18 + (string_width(combostring) * 0.5) + lengthdir_x(1, dir), 20 + lengthdir_y(1, dir), string(combostring), colorcombo1, c_red, c_maroon, c_maroon, 1);
