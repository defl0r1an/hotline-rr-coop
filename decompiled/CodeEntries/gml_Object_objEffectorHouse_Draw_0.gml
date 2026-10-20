if (instance_exists(objPlayer))
{
    global.PhotoNegativeCircle = lerp(global.PhotoNegativeCircle, global.PhotoNegativeCircleSize, 0.25);
    if (global.maskindex == 27 && sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[27], "Mask")) == "sprMasksHard" && global.maskon == 1)
    {
        draw_set_blend_mode_ext(bm_inv_dest_color, bm_inv_src_color);
        draw_circle_color(objPlayer.x + global.maddx, objPlayer.y + global.maddy, global.PhotoNegativeCircle, c_white, c_black, 0);
        draw_set_blend_mode(bm_normal);
    }
    width = display_get_width();
    height = display_get_height();
    factor = 1;
    if (global.xbox == 1)
    {
        if (checkbutton(0, getid(9)))
        {
            global.mousex = objPlayer.x + (rightthumb_x(0) * 0.009);
            global.mousey = objPlayer.y - (rightthumb_y(0) * 0.006);
        }
        else if (objPlayer.object_index == objPlayerMouse || objPlayer.object_index == objPlayerMouseHouse || objPlayer.object_index == objPlayerBiker || objPlayer.object_index == objPlayerBikerHouse)
        {
            global.mousex = objPlayer.x + lengthdir_x(64, objPlayer.dir);
            global.mousey = objPlayer.y + lengthdir_y(64, objPlayer.dir);
        }
        else
        {
            global.mousex = objPlayer.x;
            global.mousey = objPlayer.y;
        }
    }
    else
    {
        if (keyboard_check_direct(vk_shift) || global.ShiftLook == 1)
        {
            if (objPlayer.sprite_index == sprPWalkHuntingRifle || objPlayer.sprite_index == sprPAttackHuntingRifle)
            {
                factor = 2.8;
            }
            else
            {
                factor = 1.8;
            }
        }
        if (global.hardmode == 0)
        {
            global.mousex = objPlayer.x + ((((display_mouse_get_x() - (width * 0.5)) * view_wview[0]) / width) * factor);
            global.mousey = objPlayer.y + ((((display_mouse_get_y() - (height * 0.5)) * view_hview[0]) / height) * factor);
        }
        else
        {
            global.mousex = objPlayer.x - ((((display_mouse_get_x() - (width * 0.5)) * view_wview[0]) / width) * factor);
            global.mousey = objPlayer.y - ((((display_mouse_get_y() - (height * 0.5)) * view_hview[0]) / height) * factor);
        }
    }
    x = global.mousex;
    y = global.mousey;
    if (instance_exists(global.enemy))
    {
        global.mousex = global.enemy.x;
        global.mousey = global.enemy.y;
    }
    else
    {
        global.enemy = -1234;
    }
}
if (!instance_exists(objMaskMenu) && !instance_exists(objPhoneConversation))
{
    global.time += 1;
}
if (instance_exists(objDizzy))
{
    exit;
}
if (blackx < 0)
{
    blackx += 1;
}
global.dir += 1;
if (global.cursoron == 1)
{
    if (!(playeroncareffector == 1))
    {
        if (action > 0)
        {
            if (global.maskindex == 26 && global.maskon == 1)
            {
                image_blend = merge_color(merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, global.dir * 3.27)), c_white, 0.5 + lengthdir_y(0.5, global.dir * 1.97));
            }
            else
            {
                image_blend = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, global.dir * 3.27)), c_white, 0.5 + lengthdir_y(0.5, global.dir * 1.97));
            }
            test = 1;
            if (!instance_exists(objPlayer))
            {
                test = 0;
            }
            if (instance_exists(objPlayerMouseHouse))
            {
                if (objPlayer.aimon == 0)
                {
                    test = 0;
                }
            }
            if (test == 1)
            {
                draw_sprite_ext(sprCursorAction, action - 1, global.mousex + 1, global.mousey + 1, 1, 1, -view_angle[0], c_black, 0.5);
                draw_sprite_ext(sprCursorAction, action - 1, global.mousex, global.mousey, 1, 1, -view_angle[0], image_blend, 1);
            }
        }
    }
}
test = 1;
if (!instance_exists(objPlayer))
{
    test = 0;
}
if (instance_exists(objPlayerMouseHouse))
{
    if (objPlayer.aimon == 0)
    {
        test = 0;
    }
}
if (instance_exists(objPhoneConversation) || instance_exists(objFinalDialogue) || instance_exists(objFinalDialogue2))
{
    test = 0;
}
if (global.cursoron == 1)
{
    if (!(playeroncareffector == 1))
    {
        if (test == 1)
        {
            if (global.hardmode == 0)
            {
                draw_sprite_ext(sprite_index, image_index, global.mousex + 1, global.mousey + 1, 1, 1, -view_angle[0], c_black, 0.5);
                draw_set_blend_mode(bm_add);
                if (global.maskindex == 26 && global.maskon == 1)
                {
                    draw_sprite_ext(sprite_index, image_index - 1, global.mousex, global.mousey, 1, 1, -view_angle[0], c_red, 0.5);
                }
                draw_sprite_ext(sprite_index, image_index, global.mousex, global.mousey, 1, 1, -view_angle[0], c_white, 1);
                draw_set_blend_mode(bm_normal);
            }
            else
            {
                draw_sprite_ext(sprCursor, image_index, global.mousex + 1, global.mousey + 1, 1, 1, -view_angle[0], c_black, 0.25);
                draw_set_blend_mode(bm_add);
                if (global.maskindex == 26 && global.maskon == 1)
                {
                    draw_sprite_ext(sprCursor, image_index - 1, global.mousex, global.mousey, 1, 1, -view_angle[0], c_red, 0.5);
                }
                draw_sprite_ext(sprCursor, image_index, global.mousex, global.mousey, 1, 1, -view_angle[0], c_white, 1);
                draw_set_blend_mode(bm_normal);
            }
        }
    }
}
with (objAnsweringMachine)
{
    if (active == 1 && sprite_index == sprDrawersH24Phone)
    {
        if (global.maskindex == 26 && global.maskon == 1)
        {
            draw_sprite(sprArrowHLM1, image_index * 2, x, (y - 16) + lengthdir_x(3, global.dir * 6));
        }
        else
        {
            draw_sprite(sprArrow, image_index * 2, x, (y - 16) + lengthdir_x(3, global.dir * 6));
        }
    }
}
with (objPhone)
{
    if (called == 1 && answered == 0)
    {
        if (global.maskindex == 26 && global.maskon == 1)
        {
            draw_sprite_ext(sprArrowHLM1, 0, x, (y - 12) + lengthdir_x(3, dir * 2), 1, 1, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(sprArrow, 0, x, (y - 12) + lengthdir_x(3, dir * 2), 1, 1, 0, c_white, 1);
        }
    }
}
with (objBox)
{
    if (global.phone == 1)
    {
        draw_sprite(sprArrow, global.dir, x, (y - 16) + lengthdir_x(3, global.dir * 6));
    }
}
if (room == rmMansionMainHall)
{
    if (instance_exists(objBoss))
    {
        with (objSpecificWeapon)
        {
            if (image_index == 20 && instance_exists(objBodyguard))
            {
                if (global.maskindex == 26 && global.maskon == 1)
                {
                    draw_sprite(sprArrowHLM1, global.dir, x, (y - 16) + lengthdir_x(3, global.dir * 6));
                }
                else
                {
                    draw_sprite(sprArrow, global.dir, x, (y - 16) + lengthdir_x(3, global.dir * 6));
                }
            }
            if (image_index == 34 && !instance_exists(objBodyguard) && !instance_exists(objPBodyguardBash) && !instance_exists(objBodyguardCrawl) && !instance_exists(objPKillBodyguard))
            {
                if (global.maskindex == 26 && global.maskon == 1)
                {
                    draw_sprite(sprArrowHLM1, global.dir, x, (y - 16) + lengthdir_x(3, global.dir * 6));
                }
                else
                {
                    draw_sprite(sprArrow, global.dir, x, (y - 16) + lengthdir_x(3, global.dir * 6));
                }
            }
        }
    }
}
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
scrDrawPlayer();
shader_reset();
scrDrawFloorCleared();
scrDrawLevelCleared();
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
if (room == rmSequence12b || bottleexplayer == 1)
{
    if (!instance_exists(objPlayer))
    {
        scrVHSError();
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        if (update == 0)
        {
            draw_set_font(restartfont);
        }
        else
        {
            draw_set_font(restartfont);
        }
        if (text_y < 64)
        {
            text_y += 4;
        }
        if (global.language == 1)
        {
            if (global.xbox == 0)
            {
                restartstring = "НАЖМИ " + global.restartkey + " ДЛЯ ПОВТОРА";
            }
            else
            {
                restartstring = "НАЖМИ [START] ДЛЯ ПОВТОРА";
            }
        }
        else if (global.xbox == 0)
        {
            restartstring = "PRESS " + global.restartkey + " TO RESTART";
        }
        else
        {
            restartstring = "PRESS [START] TO RESTART";
        }
        if (global.interfaceon == 1)
        {
            draw_set_color(c_black);
            if (global.hlm2hud == 0)
            {
                color2a = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_white, 0.5 + lengthdir_x(0.5, dir * 3));
                color1a = merge_color(c_maroon, merge_color(c_aqua, c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
            }
            else
            {
                color2a = merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, coldir * 3.21));
                color1a = merge_color(c_orange, c_maroon, 0.5 + lengthdir_x(0.5, coldir * 2.71));
            }
            draw_rectangle(64 + string_width(restartstring) + 8, (view_hview[0] + 32) - text_y - 14, 56, ((view_hview[0] + 32) - text_y) + 14, false);
            draw_set_color(color1a);
            draw_set_font(restartfont);
            draw_text_transformed(64 + (string_width(restartstring) * 0.5), ((view_hview[0] + 31) - text_y) + lengthdir_x(1, coldir * 3), restartstring, 1, 1, lengthdir_x(2, (coldir * 4) - 20));
            draw_set_color(color2a);
            draw_text_transformed(64 + (string_width(restartstring) * 0.5), ((view_hview[0] + 30) - text_y) + lengthdir_x(1, coldir * 3), restartstring, 1, 1, lengthdir_x(2, coldir * 4));
        }
    }
}
if (leveltitle == "")
{
    nothing = 1;
}
else
{
    if (levelshow > 0)
    {
        levelshow -= 1;
    }
    else
    {
        leveltitle = "";
    }
    if (global.interfaceon == 1)
    {
        draw_set_font(fntDateHLM2);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        if (levelshow > 180)
        {
            draw_set_alpha((240 - levelshow) * 0.016666666666666666);
        }
        if (levelshow < 60)
        {
            draw_set_alpha(levelshow * 0.016666666666666666);
        }
        draw_set_color(c_black);
        draw_text((global.wview / 2) + 1, (global.hview + 1) * 0.7, leveltitle);
        draw_text((global.wview / 2) - 1, (global.hview + 1) * 0.7, leveltitle);
        draw_text(global.wview / 2, ((global.hview + 1) * 0.7) - 1, leveltitle);
        draw_text(global.wview / 2, ((global.hview + 1) * 0.7) + 1, leveltitle);
        draw_set_color(c_white);
        draw_text(global.wview / 2, (global.hview + 1) * 0.7, leveltitle);
        draw_set_alpha(1);
    }
}
d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
with (objGoToCar)
{
    if (ammox < 0)
    {
        ammox += 6;
    }
    else
    {
        ammox = 0;
    }
    draw_set_color(c_black);
    if (global.hlm2hud == 0)
    {
        color2a = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_white, 0.5 + lengthdir_x(0.5, dir * 3));
        color1a = merge_color(c_maroon, merge_color(c_aqua, c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
    }
    else
    {
        color2a = merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, coldir * 3.21));
        color1a = merge_color(c_orange, c_maroon, 0.5 + lengthdir_x(0.5, coldir * 2.71));
    }
    if (global.maskindex == 26 && global.maskon == 1)
    {
        color2a = merge_color(c_maroon, c_red, 0.5 + lengthdir_x(0.5, dir * 3.21));
        color1a = merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, dir * 2.71));
    }
    if (global.interfaceon == 1)
    {
        draw_set_font(fntScore);
        ammostring = "GO TO CAR";
        if (instance_exists(objPlayerBiker) || instance_exists(objPlayerBikerHouse) || (instance_exists(objMCBike) && (objMCBike.sprite_index == sprMCGetOnBike || objMCBike.sprite_index == sprBikerGetOnBikeWounded || objMCBike.sprite_index == sprBikerGetOnBikeUnmasked)))
        {
            ammostring = "GO TO BIKE";
        }
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        if (global.hlm2hud == 1)
        {
            draw_rectangle(-1, global.viewhview - 28 - 11, 18 + string_width(ammostring) + 19 + ammox, (global.viewhview - 28) + 11, false);
            draw_rectangle_color(18 + string_width(ammostring) + 19 + ammox, global.viewhview - 28 - 11, 19 + string_width(ammostring) + 19 + ammox, (global.viewhview - 28) + 11, color2a, color2a, color2a, color2a, 0);
        }
        else
        {
            draw_rectangle(-1, global.viewhview - 28 - 11, 18 + string_width(ammostring) + 6 + ammox, (global.viewhview - 28) + 11, false);
            draw_rectangle_color(18 + string_width(ammostring) + 6 + ammox, global.viewhview - 28 - 11, 19 + string_width(ammostring) + 6 + ammox, (global.viewhview - 28) + 11, color2a, color2a, color2a, color2a, 0);
        }
        draw_set_color(color1a);
        if (global.hlm2hud == 1)
        {
            draw_text_transformed(31 + (string_width(ammostring) * 0.5) + lengthdir_x(1, dir - 260) + ammox, (global.viewhview - 28) + lengthdir_y(1, dir - 260), ammostring, 1, 1, lengthdir_x(2, dir * 1.34));
        }
        else
        {
            draw_text_transformed(18 + (string_width(ammostring) * 0.5) + lengthdir_x(1, dir - 260) + ammox, (global.viewhview - 28) + lengthdir_y(1, dir - 260), ammostring, 1, 1, lengthdir_x(2, dir * 1.34));
        }
        draw_set_color(color2a);
        if (global.hlm2hud == 0)
        {
            dir += 8;
            coldir += 8;
        }
        else
        {
            dir += 1;
            coldir += 1;
        }
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
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
scrStoryDrawAmmo();
scrScreenFilterEffector();
if (global.scorestatseffector == 1)
{
    if (showammo == 1 && !instance_exists(objPhoneConversation))
    {
        scrScoreStatsEffector();
    }
}
scrDrawConversation();
if (fade == 0)
{
    if (amount < 180)
    {
        amount += (5 - (start * 4));
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, amount)), 0.5 + lengthdir_x(0.5, amount));
        if (amount > 90)
        {
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, amount))), abs(lengthdir_y(1, amount)));
        }
        else
        {
            color2 = 16777215;
        }
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(-10, -10, global.viewwview + 10, global.viewhview + 10, color1, color2, color2, color1, 0);
        draw_set_blend_mode(bm_normal);
    }
    else
    {
        start = 0;
        show_date = 0;
    }
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
switch (global.PauseRestart)
{
    case 1:
        room_goto(levelres);
        global.PauseRestart = 2;
        break;
    case 2:
        if (room != global.level)
        {
            i = global.cursurf;
            repeat (global.cursurf)
            {
                if (surface_exists(global.surface[i]))
                {
                    surface_free(global.surface[i]);
                }
                if (surface_exists(global.surface2[i]))
                {
                    surface_free(global.surface2[i]);
                }
                if (i != 0)
                {
                    i -= 1;
                }
            }
            room_set_persistent(room, 0);
            room_persistent = false;
            room_restart();
            room_goto(room - rmSplashScreen);
        }
        else
        {
            i = global.cursurf;
            repeat (global.cursurf)
            {
                if (surface_exists(global.surface[i]))
                {
                    surface_free(global.surface[i]);
                }
                if (surface_exists(global.surface2[i]))
                {
                    surface_free(global.surface2[i]);
                }
                if (i != 0)
                {
                    i -= 1;
                }
            }
            if (surface_exists(global.surface[0]))
            {
                surface_free(global.surface[0]);
            }
            if (surface_exists(global.surface2[0]))
            {
                surface_free(global.surface2[0]);
            }
            global.cursurf = 0;
            room_set_persistent(room, 0);
            room_persistent = false;
            room_restart();
            global.cursurf = 0;
            if (surface_exists(global.surface[0]))
            {
                surface_free(global.surface[0]);
            }
            if (surface_exists(global.surface2[0]))
            {
                surface_free(global.surface2[0]);
            }
            global.surface[0] = surface_create(room_width * 3, room_height * 3);
            surface_set_target(global.surface[0]);
            draw_clear_alpha(c_black, 0);
            surface_alpha();
            surface_reset_target();
            global.surface2[0] = surface_create(room_width * 3, room_height * 3);
            surface_set_target(global.surface2[0]);
            draw_clear_alpha(c_black, 0);
            surface_alpha();
            surface_reset_target();
            global.cursurf = 0;
            global.maskonsaved = 0;
            global.combo = 0;
            global.combotime = 0;
            global.drawscore = 0;
            global.myscore = 0;
            global.flexibilityscor = 0;
            global.mobilityscore = 0;
            global.specialscore = 0;
            global.myscore = 0;
            global.killscore = 0;
            global.boldscore = 0;
            global.comboscore = 0;
            global.PauseRestart = 0;
            global.combosave = 0;
            global.combotimesave = 0;
            global.drawscoresave = 0;
            global.myscoresave = 0;
            global.flexibilityscoresave = 0;
            global.mobilityscoresave = 0;
            global.specialscoresave = 0;
            global.myscoresave = 0;
            global.killscoresave = 0;
            global.boldscoresave = 0;
            global.comboscoresave = 0;
            global.knives = 3;
            global.knivessave = 3;
            global.meleeenergiesave = 2;
            global.meleeenergie = 2;
            ds_list_clear(global.bonuslist);
        }
        break;
}
if (fade == 1)
{
    if (amount > 0)
    {
        d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
        amount -= 10;
        if (restart == 1 || newsong == 1)
        {
            sxeasy_setVolume(amount * 0.005555555555555556);
        }
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, amount)), 0.5 + lengthdir_x(0.5, amount));
        if (amount > 90)
        {
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, amount))), abs(lengthdir_y(1, amount)));
        }
        else
        {
            color2 = 16777215;
        }
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(-10, -10, global.viewwview, global.viewhview, color2, color1, color1, color2, 0);
        draw_set_blend_mode(bm_normal);
        d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
    }
    else
    {
        fade = 0;
        if (restart == 1)
        {
            sxeasy_stop(1);
            sxeasy_setVolume(0);
            game_restart();
        }
        else if (next == 1)
        {
            if (newsong == 1)
            {
                if (song != 0)
                {
                    sxeasy_stop(1);
                }
                if (room == rmDream1)
                {
                    sxeasy_setVolume(0);
                }
                if (song != 0)
                {
                    sxeasy_play(song);
                }
            }
            if (room == rmTutorial)
            {
                sxeasy_stop(1);
            }
            if (carred == 0)
            {
                if (nextroom == 16 || nextroom == 4 || nextroom == 42 || nextroom == 8 || nextroom == 7 || nextroom == 12 || nextroom == 13 || nextroom == 44 || nextroom == 52 || nextroom == 73 || nextroom == 83 || nextroom == 81 || nextroom == 84 || nextroom == 14 || nextroom == 88 || nextroom == 35)
                {
                    global.cursurf = 0;
                }
                else
                {
                    global.cursurf += (nextroom - room);
                }
                room = nextroom;
                if (!surface_exists(global.surface[global.cursurf]))
                {
                    global.surface[global.cursurf] = surface_create(room_width * 3, room_height * 3);
                    surface_set_target(global.surface[global.cursurf]);
                    draw_clear_alpha(c_black, 0);
                    surface_alpha();
                    surface_reset_target();
                }
                if (!surface_exists(global.surface2[global.cursurf]))
                {
                    global.surface2[global.cursurf] = surface_create(room_width * 3, room_height * 3);
                    surface_set_target(global.surface2[global.cursurf]);
                    draw_clear_alpha(c_black, 0);
                    surface_alpha();
                    surface_reset_target();
                }
            }
            else
            {
                room = nextroom;
            }
        }
        else if (room == rmHouse1Downstairs)
        {
            scrLoadBonusList();
            my_id = instance_create(global.checkpointx, global.checkpointy + 10, objPlayerMouse);
            my_id.decadenced = 1;
            my_id.sprite_index = global.weaponsprite;
            my_id.ammo = global.ammoweapon;
            my_id.throwindex = global.throwindex;
            global.knives = global.knivessave;
            global.meleeenergie = global.meleeenergiesave;
            my_id.image_index = 0;
            my_id.image_speed = 50;
            scrCleanItems();
            global.done = 1;
            with (objBoss1Down)
            {
                instance_destroy();
            }
            with (objBoss1)
            {
                instance_destroy();
            }
            my_id = instance_create(336, 96, objBoss1);
            my_id.state = 1;
            if (global.hardmode == 1)
            {
                my_id.weaponget = 0;
            }
            with (objStoika)
            {
                if (savingPassing == 1)
                {
                    image_index = 0;
                }
            }
            with (objGlassPanelHBroken)
            {
                if (savingPassing == 1)
                {
                    my_id = instance_create(x, y, objGlassPanelH);
                    instance_destroy();
                }
            }
            with (objGlassPanelVBroken)
            {
                if (savingPassing == 1)
                {
                    my_id = instance_create(x, y, objGlassPanelV);
                    instance_destroy();
                }
            }
            room_goto(room);
        }
        else if (room == rmSecretSewer)
        {
            scrResetSurfaces();
            room_set_persistent(room, 0);
            room_persistent = false;
            scrLoadBonusList();
            room_restart();
        }
        else if (room == rmPhoneHomUpstairs)
        {
            scrResetSurfaces();
            room_set_persistent(room, 0);
            room_persistent = false;
            scrLoadBonusList();
            room_restart();
        }
        else if (room == rmAlley)
        {
            scrResetSurfaces();
            room_set_persistent(room, 0);
            room_persistent = false;
            scrLoadBonusList();
            room_restart();
        }
        else if (room == rmMansionMainHall)
        {
            scrResetSurfaces();
            room_set_persistent(room, 0);
            room_persistent = false;
            scrLoadBonusList();
            room_restart();
        }
        else if (room == rmOfficeEntrance)
        {
            scrLoadBonusList();
            my_id = instance_create(global.checkpointx, global.checkpointy + 10, objPlayerMouse);
            my_id.decadenced = 1;
            my_id.sprite_index = global.weaponsprite;
            my_id.ammo = global.ammoweapon;
            scrCleanItems();
            with (objWeapon)
            {
                instance_destroy();
            }
            i = 0;
            repeat (global.weaponsaveground)
            {
                if (instance_number(objWeapon) < global.weaponsaveground)
                {
                    if (!place_meeting(global.weaponsavegroundx[i], global.weaponsavegroundy[i], objWeapon))
                    {
                        my_id = instance_create(global.weaponsavegroundx[i], global.weaponsavegroundy[i], objWeapon);
                        my_id.decadenced = 1;
                        with (objWeapon)
                        {
                            if (decadenced == 0)
                            {
                                instance_destroy();
                            }
                        }
                    }
                }
                i++;
            }
            global.done = 1;
            instance_create(x, y, objBoss3Spawn);
            room_goto(room);
        }
        with (objWeapon)
        {
            if (object_index == objSpecificWeapon)
            {
                nothing = 1;
            }
            else if (object_index == objWeaponThrow)
            {
                if (decadenced == 1)
                {
                    nothing = 1;
                }
                else
                {
                    my_id = instance_create(x, y, objWeapon);
                    my_id.decadenced = 1;
                }
                instance_destroy();
            }
            else if (object_index == objWeapon)
            {
                if (decadenced == 0)
                {
                    nothing = 1;
                }
                else
                {
                    my_id = instance_create(x, y, objWeapon);
                    my_id.decadenced = 1;
                }
                instance_destroy();
            }
        }
        with (objBrains2)
        {
            if (surface == 0)
            {
                instance_destroy();
            }
        }
        with (objDeadBody)
        {
            if ((instance_exists(objBoss1) || instance_exists(objBoss1Down)) && room == rmHouse1Downstairs)
            {
                exit;
            }
            if (deadlined == 0)
            {
                instance_destroy();
            }
        }
    }
}
dir += 1;
coldir += 1;
if (show_date == 1)
{
    if (room == rmSequence1)
    {
        text = "APR 3RD, 1989#MIAMI, FLORIDA";
    }
    if (room == rmSequence2)
    {
        text = "APR 8TH, 1989#MIAMI, FLORIDA";
    }
    if (room == rmSequence3)
    {
        text = "APR 16TH, 1989#MIAMI, FLORIDA";
    }
    if (room == rmSequence4)
    {
        text = "APR 25TH, 1989#MIAMI, FLORIDA";
    }
    if (room == rmSequence5)
    {
        text = "MAY 5TH, 1989#MIAMI, FLORIDA";
    }
    if (room == rmSequence6)
    {
        text = "MAY 11TH, 1989#MIAMI, FLORIDA";
    }
    if (room == rmSequence7)
    {
        text = "MAY 13TH, 1989#MIAMI, FLORIDA";
    }
    if (room == rmSequence8)
    {
        text = "MAY 23RD, 1989#MIAMI, FLORIDA";
    }
    i = 0;
    draw_set_alpha(0.5 + lengthdir_x(0.5, amount));
    draw_set_color(c_gray);
    draw_set_font(fntDateHLM2);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text((view_wview[0] / 2) + 1, (view_hview[0] / 2) + 1, text);
    draw_set_color(c_white);
    draw_text(view_wview[0] / 2, view_hview[0] / 2, text);
    draw_set_alpha(1);
}
if (brus > 0)
{
    brus -= 1;
    if (lastbrus == 0)
    {
        audio_play_sound(sndNoise, 0, false);
    }
    lastbrus = brus;
    if (brus == 0)
    {
        audio_stop_sound(sndNoise);
        if (global.willemget == 1)
        {
            global.hardmode = 1;
            sxeasy_play(global.Static);
            audio_play_sound(sndToken, 0, false);
            my_id = instance_create(x, y, objLetterFound);
            my_id.text = '"' + scrMaskGetName(35) + '"';
            scrAchievementSet("Monkey Madness");
            global.willemget = 0;
            global.selectskin[11] = 1;
            with (objWillemSwitch)
            {
                active = 1;
            }
        }
        if (global.willemget == 2)
        {
            global.hardmode = 0;
            ini_open("options.ini");
            global.selectskin[11] = ini_read_string("Skin", "Willem", "");
            ini_close();
            global.willemget = 0;
        }
    }
    draw_sprite_tiled_ext(sprNoise, global.dir * 0.5, 0, 0, 2, 2, c_white, 1);
}
if (instance_exists(objPicture))
{
    if (letterbox < 60)
    {
        letterbox += 0.15;
    }
    draw_set_color(c_black);
    draw_rectangle(0, 0, view_wview[0] + 132, letterbox, false);
    draw_rectangle(0, view_hview[0], view_wview[0] + 132, view_hview[0] - letterbox, false);
}
draw_set_blend_mode(bm_subtract);
draw_sprite_tiled(sprScanlines, 0, my_y, my_y);
my_y = random(32) - 32;
draw_set_blend_mode(bm_subtract);
draw_set_blend_mode(bm_normal);
