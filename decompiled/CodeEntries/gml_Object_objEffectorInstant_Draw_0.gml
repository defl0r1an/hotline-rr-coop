if (gridon == 1)
{
    draw_set_alpha(0.25);
    mp_grid_draw(global.grid);
    draw_set_alpha(1);
}
if (instance_exists(objPlayer))
{
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
        else if (instance_exists(objPlayerShieldMouse))
        {
            mousedir = objPlayer.dir;
            if (point_distance(0, 0, rightthumb_x(0), -rightthumb_y(0)) > 12000)
            {
                mousedir = point_direction(0, 0, rightthumb_x(0), -rightthumb_y(0));
            }
            else if ((abs(objPlayer.myxspeed) + abs(objPlayer.myyspeed)) > 0.2)
            {
                mousedir = point_direction(0, 0, objPlayer.myxspeed, objPlayer.myyspeed);
            }
            if (global.hardmode == 0)
            {
                global.mousex = objPlayer.x + lengthdir_x(64, mousedir);
                global.mousey = objPlayer.y + lengthdir_y(64, mousedir);
            }
            else
            {
                global.mousex = objPlayer.x - lengthdir_x(64, mousedir);
                global.mousey = objPlayer.y - lengthdir_y(64, mousedir);
            }
        }
        else if (objPlayer.object_index == objPlayerMouse || objPlayer.object_index == objPlayerMouseHouse || objPlayer.object_index == objPlayerBiker || objPlayer.object_index == objPlayerBikerHouse)
        {
            if (global.hardmode == 0)
            {
                global.mousex = objPlayer.x + lengthdir_x(64, objPlayer.dir);
                global.mousey = objPlayer.y + lengthdir_y(64, objPlayer.dir);
            }
            else
            {
                global.mousex = objPlayer.x - lengthdir_x(64, objPlayer.dir);
                global.mousey = objPlayer.y - lengthdir_y(64, objPlayer.dir);
            }
        }
        else
        {
            global.mousex = objPlayer.x;
            global.mousey = objPlayer.y;
        }
    }
    else
    {
        if (keyboard_check_direct(vk_shift))
        {
            factor = 1.8;
        }
        if (global.hardmode == 0)
        {
            global.mousex = objPlayer.x + ((display_mouse_get_x() - (width * 0.5)) * (view_wview[0] / width) * factor);
            global.mousey = objPlayer.y + ((display_mouse_get_y() - (height * 0.5)) * (view_hview[0] / height) * factor);
        }
        else
        {
            global.mousex = objPlayer.x - ((display_mouse_get_x() - (width * 0.5)) * (view_wview[0] / width) * factor);
            global.mousey = objPlayer.y - ((display_mouse_get_y() - (height * 0.5)) * (view_hview[0] / height) * factor);
        }
    }
    x = global.mousex;
    y = global.mousey;
    if (global.hardmode == 0)
    {
        if (instance_exists(global.enemy))
        {
            global.mousex = global.enemy.x;
            global.mousey = global.enemy.y;
            sprite_index = sprCursorRed;
        }
        else
        {
            global.enemy = -1234;
            sprite_index = sprCursor;
        }
    }
}
if (global.hardmode == 0)
{
    if (action > 0)
    {
        image_blend = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, global.dir * 3.27)), c_white, 0.5 + lengthdir_y(0.5, global.dir * 1.97));
        draw_sprite_ext(sprCursorAction, action - 1, global.mousex + 1, global.mousey + 1, 1, 1, -view_angle[0], c_black, 0.5);
        draw_sprite_ext(sprCursorAction, action - 1, global.mousex, global.mousey, 1, 1, -view_angle[0], image_blend, 1);
    }
}
if (global.hardmode == 0)
{
    draw_sprite_ext(sprite_index, image_index, global.mousex + 1, global.mousey + 1, 1, 1, -view_angle[0], c_black, 0.5);
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprite_index, image_index, global.mousex, global.mousey, 1, 1, -view_angle[0], c_white, 1);
    draw_set_blend_mode(bm_normal);
}
else
{
    draw_sprite_ext(sprCursor, image_index, global.mousex + 1, global.mousey + 1, 1, 1, -view_angle[0], c_black, 0.25);
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprCursor, image_index, global.mousex, global.mousey, 1, 1, -view_angle[0], c_white, 1);
    draw_set_blend_mode(bm_normal);
}
draw_set_blend_mode(bm_normal);
with (objDiscoLights)
{
    d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
    draw_set_blend_mode(bm_subtract);
    draw_surface(surf, 0, 0);
}
draw_set_blend_mode(bm_normal);
if (!instance_exists(objMaskMenu) && !instance_exists(objPhoneConversation))
{
    global.time += 1;
}
if (global.hlm2hud == 1 && global.hardmode == 0)
{
    scrDrawHUDHLM2();
    scrDrawRestartHLM2();
}
else
{
    scrDrawHUD();
}
if (global.combo == 0 || global.combo == 1)
{
    combostring = "";
}
else
{
    combostring = string(global.combo) + "x";
}
if (global.hardmode == 0)
{
    color2 = merge_color(merge_color(c_purple, c_aqua, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3));
    color1 = merge_color(c_orange, merge_color(c_red, c_orange, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
}
else
{
    color2 = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_white, 0.5 + lengthdir_x(0.5, dir * 3));
    color1 = merge_color(c_blue, merge_color(c_purple, c_blue, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3));
}
scrScoreDraw();
if (instance_exists(objMaskMenu))
{
    scrDrawMaskMenu();
}
else if (leveltitle == "")
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
    draw_set_font(fntDate);
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
    draw_text((view_wview[0] / 2) + 1, (view_hview[0] * 0.7) + 1, leveltitle);
    draw_set_color(c_white);
    draw_text(view_wview[0] / 2, view_hview[0] * 0.7, leveltitle);
    draw_set_alpha(1);
}
if (fade == 0)
{
    if (amount < 180)
    {
        amount += 5;
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
        draw_rectangle_color(-10, -10, view_wview[0] + 10, view_hview[0] + 10, color1, color2, color2, color1, 0);
        draw_set_blend_mode(bm_normal);
    }
}
if (fade == 1)
{
    if (amount > 0)
    {
        amount -= 10;
        if (restart == 1)
        {
            sxeasy_setVolume(amount * 0.005555555555555556 * 0);
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
        draw_rectangle_color(-10, -10, view_wview[0] + 10, view_hview[0] + 10, color2, color1, color1, color2, 0);
        draw_set_blend_mode(bm_normal);
    }
    else
    {
        fade = 0;
        if (restart == 1)
        {
            sxeasy_stop(1);
            sxeasy_setVolume(0);
            sxeasy_play(working_directory + "\HorseSteppin.mp3");
            room = rmMenu;
        }
        else if (next == 1)
        {
            room = nextroom;
        }
        else
        {
            room_set_persistent(room, 0);
            room_persistent = false;
            room_restart();
            scrLoadBonusList();
            room_restart();
            global.combo = global.combosave;
            global.combotime = global.combotimesave;
            global.drawscore = global.drawscoresave;
            global.myscore = global.myscoresave;
            global.flexibilityscore = global.flexibilityscoresave;
            global.mobilityscore = global.mobilityscoresave;
            global.specialscore = global.specialscoresave;
            global.myscore = global.myscoresave;
            global.killscore = global.killscoresave;
            global.boldscore = global.boldscoresave;
            global.comboscore = global.comboscoresave;
        }
    }
}
coldir += 1;
draw_set_blend_mode(bm_subtract);
draw_sprite_tiled(sprScanlines, 0, 0, my_y);
my_y = random(32);
draw_set_blend_mode(bm_subtract);
draw_set_blend_mode(bm_subtract);
if (global.hardmode == 0)
{
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 480 + random(24), c_black, merge_color(c_navy, c_aqua, 0.25 + random(0.25)), 0);
}
else
{
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 480 + random(24), c_black, merge_color(c_red, c_maroon, 0.25 + random(0.25)), 0);
}
draw_set_blend_mode(bm_normal);
