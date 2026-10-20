if (global.xbox == 1)
{
    if (checkbutton(0, getid(5)) || checkbutton(0, getid(6)))
    {
        if (presstart == 0)
        {
            presstart = 1;
            scrXboxBandCreditsStart();
        }
    }
    else
    {
        presstart = 0;
    }
}
if (!surface_exists(global.surf1))
{
    global.surf1 = surface_create(room_width, room_height);
    surface_set_target(global.surf1);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
if (alarm[0] <= 0)
{
    for (j = 0; j < 7; j++)
    {
        yyyy[j] -= (6 * yyyy[j]) / 75;
    }
}
if (fade == 1)
{
    for (j = 0; j < 7; j++)
    {
        yyyy[j] += (6 * (yyyy[j] + 1)) / 25;
    }
}
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
i = 0;
ii = 0;
if (level == "DELETE")
{
    if (gamepgquery == 1)
    {
        if (gamepgalpha < 1)
        {
            gamepgalpha += 0.05;
        }
        draw_set_color(c_black);
        draw_set_blend_mode(bm_subtract);
        color1 = merge_color(c_black, c_gray, gamepgalpha);
        color2 = merge_color(c_black, c_white, gamepgalpha);
        draw_rectangle_color(-16, -16, room_width + 16, room_width / 2, color1, color1, color2, color2, 0);
        draw_rectangle_color(-16, room_width / 2, room_width + 16, room_width + 16, color2, color2, color1, color1, 0);
        draw_set_blend_mode(bm_normal);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(fntFeats);
        draw_text_color(room_width / 2, room_height / 4, "DELETE PROGRESS?", c_white, c_white, c_yellow, c_yellow, 1);
        draw_set_font(fntLevelComplete);
        if (gamepg == 0)
        {
            color1 = 255;
            color2 = 128;
        }
        else
        {
            color1 = 128;
            color2 = 0;
        }
        draw_text_color((room_width / 2) - 64, room_height / 2, "YES", color1, color1, color2, color2, 1);
        if (gamepg == 1)
        {
            color1 = 255;
            color2 = 128;
        }
        else
        {
            color1 = 128;
            color2 = 0;
        }
        draw_text_color((room_width / 2) + 64, room_height / 2, "NO", color1, color1, color2, color2, 1);
    }
}
else
{
    repeat (max_alt + 1)
    {
        draw_set_font(fntFeats);
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        if (alt[i] == "CONTROLLER")
        {
            colornorm1 = merge_color(merge_color(c_gray, c_dkgray, 0.5), c_dkgray, 0.5 + lengthdir_x(0.5, textdir * 1));
            colornorm2 = merge_color(merge_color(c_gray, c_dkgray, 0.5), c_dkgray, 0.5 - lengthdir_x(0.5, textdir * 1));
            amount = 0.5 + lengthdir_x(0.5, textdir * 1);
            colorhover1 = merge_color(c_dkgray, c_black, amount);
            amount = 0.5 - lengthdir_x(0.5, textdir * 1);
            colorhover2 = merge_color(c_gray, c_dkgray, amount);
            color1 = 12632256;
            colorrepeats = draw_set_color(c_dkgray);
            descrcolor = merge_color(c_white, c_red, 0.5 + lengthdir_x(0.5, textdir * 3));
        }
        else
        {
            colornorm1 = merge_color(merge_color(c_orange, c_red, 0.5), c_red, 0.5 + lengthdir_x(0.5, textdir * 1));
            colornorm2 = merge_color(merge_color(c_orange, c_red, 0.5), c_red, 0.5 - lengthdir_x(0.5, textdir * 1));
            amount = 0.5 + lengthdir_x(0.5, textdir * 1);
            colorhover1 = merge_color(c_red, c_maroon, amount);
            amount = 0.5 - lengthdir_x(0.5, textdir * 1);
            colorhover2 = merge_color(c_yellow, c_orange, amount);
            color1 = 4235519;
            colorrepeats = 128;
            if (alt[i] == "DELETE PROGRESS")
            {
                descrcolor = merge_color(c_white, c_red, 0.5 + lengthdir_x(0.5, textdir * 3));
            }
            else
            {
                descrcolor = merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, textdir * 1));
            }
        }
        if (select == i)
        {
            repeats = round(3 + lengthdir_x(2, textdir * 1));
            repeat (repeats)
            {
                draw_set_color(colorrepeats);
                draw_text((((room_width / 5) - 56 - ii) + 1) - yyyy[i], ((((room_height / 2) + (i * 20)) - ii) + 1) - 20, alt[i]);
                draw_text_color((room_width / 5) - 56 - ii - yyyy[i], ((room_height / 2) + (i * 20)) - ii - 20, alt[i], c_white, c_white, colornorm1, colornorm1, 1);
                draw_text_color((room_width / 5) - 56 - ii - 1 - yyyy[i], ((room_height / 2) + (i * 20)) - ii - 1 - 20, alt[i], c_white, c_white, colornorm2, colornorm2, 1);
                ii += 1;
            }
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_font(fntDate);
            draw_set_color(descrcolor);
            draw_text(room_width / 2, ((room_height / 3) + 1) - 30, altdesc[i]);
        }
        else
        {
            draw_text_color((((room_width / 5) - 56) + 1) - yyyy[i], ((room_height / 2) + (i * 20) + 1) - 20, alt[i], color1, color1, colorhover1, colorhover1, 1);
            draw_text_color((room_width / 5) - 56 - yyyy[i], ((room_height / 2) + (i * 20)) - 20, alt[i], c_white, c_white, colorhover2, colorhover2, 1);
        }
        state = "";
        if (level == "AUDIO")
        {
            switch (i)
            {
                case 0:
                    state = string(round(global.smvol * 100)) + "%";
                    break;
                case 1:
                    state = string(round(global.svol * 100)) + "%";
                    break;
                case 2:
                    state = string(round(global.mvol * 100)) + "%";
                    break;
                case 3:
                    if (global.crypt_voice == 1)
                    {
                        state = "ORIGINAL";
                    }
                    else if (global.crypt_voice == 2)
                    {
                        state = "CUSTOM";
                    }
                    else if (global.crypt_voice == 0)
                    {
                        state = "CRYPT VOICE";
                    }
                    break;
            }
        }
        if (level == "GRAPHICS")
        {
            if (alt[i] == "HUD STYLE")
            {
                if (global.hlm2hud == 1)
                {
                    state = "HLM 2";
                }
                else
                {
                    state = "HLM 1";
                }
            }
            if (alt[i] == "DIALOGUE STYLE")
            {
                if (global.dialoguestyle == 1)
                {
                    state = "HLM 2";
                }
                else
                {
                    state = "HLM 1";
                }
            }
            if (alt[i] == "BULLET STYLE")
            {
                if (global.sprite_bullet == 775)
                {
                    state = "HLM2";
                }
                else
                {
                    state = "HLM1";
                }
            }
            if (alt[i] == "ZOOM")
            {
                if (global.zoomdeaths == 1)
                {
                    state = "ON";
                }
                else
                {
                    state = "OFF";
                }
            }
            if (alt[i] == "OPTIMIZE GRAPHICS")
            {
                if (global.optimize == 1)
                {
                    state = "ON";
                }
                else
                {
                    state = "OFF";
                }
            }
        }
        if (level == "GAME")
        {
            if (alt[i] == "GRADE IN GAME")
            {
                if (global.scorestatseffector == 1)
                {
                    state = "ON";
                }
                else
                {
                    state = "OFF";
                }
            }
            if (alt[i] == "CONSOLE")
            {
                if (global.console == 1)
                {
                    state = "ON";
                }
                else
                {
                    state = "OFF";
                }
            }
            if (alt[i] == "LANGUAGE")
            {
                if (global.language == 1)
                {
                    state = "RUSSIAN";
                }
                else
                {
                    state = "ENGLISH";
                }
            }
            if (alt[i] == "SHIFT LOCK")
            {
                if (global.ShiftLook == 1)
                {
                    state = "ON";
                }
                else
                {
                    state = "OFF";
                }
            }
        }
        if (level == "EXTRA")
        {
            if (alt[i] == "WEAPON IMPACT")
            {
                if (global.impact == 1)
                {
                    state = "ON";
                }
                else
                {
                    state = "OFF";
                }
            }
            if (alt[i] == "SCREEN SHAKE")
            {
                if (global.shakeoption == 1)
                {
                    state = "NEW";
                }
                else
                {
                    state = "ORIG";
                }
            }
            if (alt[i] == "ACHIEVEMENTS VERSION")
            {
                if (global.achievementversion == 2025)
                {
                    state = "NEW";
                }
                else
                {
                    state = "BETA";
                }
            }
            if (alt[i] == "MAIN MENU VERSION")
            {
                if (global.main_menu_new == 1)
                {
                    state = "NEW";
                }
                else
                {
                    state = "OLD";
                }
            }
            if (alt[i] == "LEVEL SELECT VERSION")
            {
                if (global.level_select_new == 1)
                {
                    state = "NEW";
                }
                else
                {
                    state = "OLD";
                }
            }
        }
        ii = 0;
        draw_set_halign(fa_right);
        draw_set_valign(fa_middle);
        draw_set_font(fntFeats);
        if (select == i)
        {
            repeats = round(3 + lengthdir_x(2, textdir * 1));
            repeat (repeats)
            {
                draw_set_color(colorrepeats);
                draw_text(((room_width - 10 - ii) + 1) - yyyy[i], ((((room_height / 2) + (i * 20)) - ii) + 1) - 20, state);
                draw_text_color(room_width - 10 - ii - yyyy[i], ((room_height / 2) + (i * 20)) - ii - 20, state, c_white, c_white, colornorm1, colornorm1, 1);
                draw_text_color(room_width - 10 - ii - 1 - yyyy[i], ((room_height / 2) + (i * 20)) - ii - 1 - 20, state, c_white, c_white, colornorm2, colornorm2, 1);
                ii += 1;
            }
        }
        else
        {
            draw_text_color(((room_width - 10) + 1) - yyyy[i], ((room_height / 2) + (i * 20) + 1) - 20, state, color1, color1, colorhover1, colorhover1, 1);
            draw_text_color(room_width - 10 - yyyy[i], ((room_height / 2) + (i * 20)) - 20, state, c_white, c_white, colorhover2, colorhover2, 1);
        }
        i += 1;
    }
}
if (nerkusha_disc_ < 360)
{
    nerkusha_disc_ += 0.1;
}
else
{
    nerkusha_disc_ = 0;
}
nerkusha_disc = floor(nerkusha_disc_);
textdir -= 4;
dir += 4;
surface_reset_target();
