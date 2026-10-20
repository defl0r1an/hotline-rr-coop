if (gridon == 1)
{
    draw_set_alpha(0.25);
    mp_grid_draw(global.grid);
    draw_set_alpha(1);
}
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
        if (keyboard_check_direct(vk_shift) || global.ShiftLook == 1)
        {
            factor = 1.8;
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
    if (global.hardmode == 0 && global.maskindex != 27)
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
if (global.cursoron == 1)
{
    if (!(playeroncareffector == 1))
    {
        if (global.hardmode == 0)
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
                draw_sprite_ext(sprCursorAction, action - 1, global.mousex + 1, global.mousey + 1, 1, 1, -view_angle[0], c_black, 0.5);
                draw_sprite_ext(sprCursorAction, action - 1, global.mousex, global.mousey, 1, 1, -view_angle[0], image_blend, 1);
            }
        }
    }
}
if (room == rmHotelSuite || room == rmHotel3)
{
    if (room == rmHotel3)
    {
        i = -1.2;
    }
    else
    {
        i = 1;
    }
    with (objWindowV)
    {
        if (sprite_index == sprWindowSill)
        {
            nothing = 1;
        }
        else if ((x == 480 && y == 256) || (x == 120 && y == 160))
        {
            if (global.maskindex != 27)
            {
                if (global.maskindex == 26 && global.maskon == 1)
                {
                    draw_sprite_ext(sprArrowHLM1, 0, (x - 12) + lengthdir_x(3, arrowdir * 32), y + (16 * objEffector.i), 1, 1, 90, c_white, 1);
                }
                else
                {
                    draw_sprite_ext(sprArrow, 0, (x - 12) + lengthdir_x(3, arrowdir * 32), y + (16 * objEffector.i), 1, 1, 90, c_white, 1);
                }
            }
            arrowdir += 0.2;
        }
    }
}
if (global.cursoron == 1)
{
    if (!(playeroncareffector == 1))
    {
        if (global.hardmode == 0)
        {
            draw_sprite_ext(sprite_index, image_index, global.mousex + 1, global.mousey + 1, 1, 1, -view_angle[0], c_black, 0.5);
            if (global.maskindex == 26 && global.maskon == 1)
            {
                draw_sprite_ext(sprite_index, image_index - 1, global.mousex, global.mousey, 1, 1, -view_angle[0], c_red, 0.75);
            }
            draw_set_blend_mode(bm_add);
            draw_sprite_ext(sprite_index, image_index, global.mousex, global.mousey, 1, 1, -view_angle[0], c_white, 1);
            draw_set_blend_mode(bm_normal);
        }
        else
        {
            draw_sprite_ext(sprite_index, image_index, global.mousex + 1, global.mousey + 1, 1, 1, -view_angle[0], c_black, 0.25);
            if (global.maskindex == 26 && global.maskon == 1)
            {
                draw_sprite_ext(sprite_index, image_index - 1, global.mousex, global.mousey, 1, 1, -view_angle[0], c_red, 0.75);
            }
            draw_set_blend_mode(bm_add);
            draw_sprite_ext(sprite_index, image_index, global.mousex, global.mousey, 1, 1, -view_angle[0], c_white, 1);
            draw_set_blend_mode(bm_normal);
        }
    }
}
draw_set_blend_mode(bm_normal);
with (objDiscoLights)
{
    d3d_set_projection_ortho(0, 0, global.wview, global.hview, 0);
    draw_set_blend_mode(bm_subtract);
    if (surface_exists(surf))
    {
        draw_surface(surf, 0, 0);
    }
    d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
}
draw_set_blend_mode(bm_normal);
if (!instance_exists(objMaskMenu) && !instance_exists(objPhoneConversation))
{
    global.time += 1;
}
scrDrawHUD();
scrDrawRestartHLM2();
scrComboLine();
if (global.scorestatseffector == 1)
{
    scrScoreStatsEffector();
}
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
if (fade == 0)
{
    if (amount < 180)
    {
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
}
if (fade == 1)
{
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
}
coldir += 1;
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
scrDrawPlayer();
shader_reset();
draw_set_blend_mode(bm_subtract);
draw_sprite_tiled(sprScanlines, 0, my_y, my_y);
my_y = random(32) - 32;
if (global.maskindex == 14 && global.maskon == 1)
{
    draw_set_blend_mode(bm_subtract);
    if (global.hardmode == 0)
    {
        draw_circle_color(global.viewwview / 2, global.viewhview / 2, 480 + random(24), merge_color(c_black, merge_color(c_white, c_aqua, 0.6 + lengthdir_x(0.4, global.dir * 4)), bamount), merge_color(c_black, c_white, bamount), 0);
    }
    else
    {
        draw_circle_color(global.viewwview / 2, global.viewhview / 2, 480 + random(24), merge_color(c_black, merge_color(c_black, c_blue, 0.6 + lengthdir_x(0.4, global.dir * 4)), bamount), merge_color(c_black, c_black, bamount), 0);
    }
    draw_set_blend_mode(bm_normal);
    if (bamount < 1)
    {
        bamount += 0.05;
    }
}
draw_set_blend_mode(bm_subtract);
draw_set_blend_mode(bm_normal);
scrScreenFilterEffector();
d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
if ((instance_exists(objSwatOpenDoor) && objSwatOpenDoor.siren == 1) || (global.done == 1 && room == rmSwatUpstairs) || (instance_exists(objPoliceCarSiren) && objPoliceCarSiren.visible == true) || (instance_exists(objSwatVan) && objSwatVan.visible == true))
{
    if (cdirpol < 1)
    {
        cdirpol += 0.002;
    }
    if (global.done == 1 && room == rmSwatDownstairs)
    {
        cdirpol = 1;
    }
    if (global.maskindex == 26 && global.maskon == 1)
    {
        colorpol = merge_color(c_black, merge_color(merge_color(c_aqua, c_black, 0.75), merge_color(c_ltgray, c_black, 0.75), 0.5 + lengthdir_x(0.5, cdir * 8.15)), cdirpol);
    }
    else
    {
        colorpol = merge_color(c_black, merge_color(merge_color(c_aqua, c_black, 0.75), merge_color(make_colour_rgb(191, 191, 0), c_black, 0.75), 0.5 + lengthdir_x(0.5, cdir * 8.15)), cdirpol);
    }
    draw_set_blend_mode(bm_subtract);
    draw_set_alpha(0.15);
    draw_rectangle_color(0, 0, global.viewwview, global.viewhview, colorpol, colorpol, colorpol, colorpol, 0);
    draw_rectangle_color(0, global.viewhview, global.viewwview, global.viewhview, colorpol, colorpol, colorpol, colorpol, 0);
    draw_set_alpha(1);
    draw_set_blend_mode(bm_normal);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
if (instance_exists(objPlayerMouse))
{
    view_xview[0] = vlastx;
    view_yview[0] = vlasty;
}
if (morj == 0)
{
    morjalpha = 0;
    morjstep = 0;
    morj = 1;
}
if (morj == 1)
{
    if (morjstep == 0)
    {
        if (morjalpha < 1)
        {
            morjalpha += 0.2;
        }
        else
        {
            morjalpha = 1;
            morjstep = 1;
        }
    }
    if (morjstep == 1)
    {
        if (morjalpha > 0)
        {
            morjalpha -= 0.1;
        }
        else
        {
            morjalpha = 0;
            morjstep = 0;
            morj = 2;
        }
    }
    draw_set_blend_mode_ext(bm_inv_dest_color, bm_zero);
    draw_set_color(merge_color(c_white, c_black, morjalpha));
    draw_rectangle(-500, -500, room_width + 500, room_height + 500, false);
    draw_set_blend_mode(bm_normal);
    redmorj -= 0.05;
    draw_set_blend_mode(bm_subtract);
    draw_set_color(merge_color(c_black, make_color_rgb(4, 198, 159), redmorj * 0.8));
    draw_rectangle(-500, -500, room_width + 500, room_height + 500, false);
    draw_set_blend_mode(bm_normal);
}
if (blackx > 0)
{
    draw_set_color(c_black);
    draw_rectangle(0, 0, global.viewwview + 100, blackx, false);
    draw_rectangle(0, global.viewhview, global.viewwview + 100, global.viewhview - (blackx * 1.5), false);
    blackx -= 3;
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
    }
    draw_sprite_tiled(sprNoise, global.dir * 0.5, 0, 0);
    draw_set_color(c_black);
    draw_rectangle(0, 0, global.viewwview, blackx, false);
    draw_rectangle(0, global.viewhview, global.viewwview + 100, global.viewhview - (blackx * 1.5), false);
}
draw_set_font(fntScore);
shader_reset();
