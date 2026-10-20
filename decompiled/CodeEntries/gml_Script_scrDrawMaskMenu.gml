if (global.selectmask == 0)
{
    with (objMaskMenu)
    {
        dir += 1;
        coloralpha1 = merge_color(c_black, c_dkgray, alpha);
        coloralpha2 = merge_color(c_black, c_white, alpha);
        draw_set_color(c_black);
        draw_set_blend_mode(bm_subtract);
        draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 268, coloralpha1, coloralpha2, 0);
        ShadowColor = merge_color(c_black, c_white, RandomMaskShadow);
        draw_rectangle_color(127, 0, 244, view_hview[0], c_black, ShadowColor, ShadowColor, c_black, 0);
        draw_rectangle_color(245, 0, 450, view_hview[0], ShadowColor, ShadowColor, ShadowColor, ShadowColor, 0);
        draw_rectangle_color(-5, 0, 28, view_hview[0], ShadowColor, c_black, c_black, ShadowColor, 0);
        draw_set_blend_mode(bm_normal);
        if (SkinAvailable == 0)
        {
            draw_set_blend_mode(bm_add);
            draw_set_alpha(abs(SkinEffect));
            draw_roundrect_colour_ext(((-48 + (maskx * 4)) - 32 - 8) + SkinEffect, -2, -48 + (maskx * 4) + 32 + 8 + SkinEffect, view_hview[0] + 2, 100, 100, c_white, c_black, 0);
            draw_set_alpha(1);
            draw_set_blend_mode(bm_max);
            draw_sprite(sprPhoneLine, 0, ((-48 + (maskx * 4)) - 32) + (SkinEffect / 2), 0);
            draw_sprite(sprPhoneLine, 0, -48 + (maskx * 4) + 32 + (SkinEffect / 2), 0);
        }
        draw_set_blend_mode(bm_normal);
        color1 = merge_color(merge_color(merge_color(c_orange, c_yellow, 0.5 + lengthdir_x(0.5, dir * 1.6436)), c_red, 0.25 + lengthdir_y(0.25, dir * 2.3234)), merge_color(merge_color(make_colour_rgb(40, 255, 255), make_colour_rgb(0, 30, 105), 0.5 + lengthdir_x(0.5, dir * 1.6436)), make_colour_rgb(237, 0, 201), 0.25 + lengthdir_y(0.25, dir * 2.3234)), ColorChange);
        color2 = merge_color(merge_color(merge_color(c_fuchsia, c_purple, 0.5 + lengthdir_x(0.5, dir * 2.55)), c_maroon, 0.4 + lengthdir_x(0.4, dir * 1.567)), merge_color(merge_color(make_colour_rgb(145, 243, 0), make_colour_rgb(0, 169, 2), 0.5 + lengthdir_x(0.5, dir * 2.55)), make_colour_rgb(143, 0, 169), 0.4 + lengthdir_x(0.4, dir * 1.567)), ColorChange);
        draw_rectangle_color((-48 + (maskx * 4)) - 32, -2, -48 + (maskx * 4) + 32, view_hview[0] + 2, color1, color2, color2, color1, 0);
        draw_set_blend_mode(bm_add);
        draw_set_alpha(abs(SkinEffect));
        if (SkinAvailable == 0)
        {
            draw_rectangle_color((-48 + (maskx * 4)) - 32, -2, -48 + (maskx * 4) + 32, view_hview[0] + 2, merge_color(c_white, c_black, TipGlow[TipSwitch]), merge_color(c_black, c_white, TipGlow[TipSwitch]), merge_color(c_black, c_white, TipGlow[TipSwitch]), merge_color(c_white, c_black, TipGlow[TipSwitch]), 0);
        }
        draw_set_alpha(1);
        draw_set_blend_mode(bm_normal);
        i = 0;
        repeat (7)
        {
            draw_set_alpha(0.07);
            draw_set_blend_mode(bm_add);
            draw_rectangle_color(((-48 + (maskx * 4)) - 26) + (i * 7.86), -2, ((-48 + (maskx * 4)) - 25) + (i * 7.86) + 1, view_hview[0], c_black, c_white, c_white, c_black, 0);
            draw_rectangle_color(((-48 + (maskx * 4)) - 21) + (i * 7.86), -2, ((-48 + (maskx * 4)) - 20) + (i * 7.86) + 1, view_hview[0], c_white, c_black, c_black, c_white, 0);
            draw_set_blend_mode(bm_normal);
            draw_set_alpha(0.15);
            draw_rectangle_color(((-48 + (maskx * 4)) - 23) + (i * 7.86), -2, ((-48 + (maskx * 4)) - 23) + (i * 7.86) + 1, view_hview[0], c_purple, c_purple, c_purple, c_purple, 0);
            draw_set_alpha(1);
            i += 1;
        }
        draw_sprite(sprPhoneLine, 0, (-48 + (maskx * 4)) - 32, 0);
        draw_sprite(sprPhoneLine, 0, -48 + (maskx * 4) + 32, 0);
        if (on == 1)
        {
            if (maskx < 32)
            {
                maskx += 8;
            }
            else
            {
                targety = (view_hview[0] / 2) - 20 - (select * 80);
                masky += ((targety - masky) * 0.1);
            }
        }
        i = 0;
        starty = 0;
        temprandom = scrGetMaskSkin(RandomMaskCount, global.selectskin[RandomMaskCount], "Big");
        RasmusFrame += 0.15;
        repeat (masks)
        {
            if (name[i] == "Random")
            {
                if (select == i)
                {
                    draw_sprite_ext(temprandom, RandomMaskCount, 81, masky + starty + 22 + RandomMaskEffect, 1.5, 1.5, lengthdir_x(5, (starty * 1.765) + (dir * 2)), c_black, 0.5 - rand);
                    drawy = starty;
                }
                else
                {
                    draw_sprite_ext(temprandom, RandomMaskCount, 81, masky + starty + 2 + RandomMaskEffect, 1, 1, 0, c_black, 0.5 - rand);
                    draw_sprite_ext(temprandom, RandomMaskCount, 80, masky + starty + RandomMaskEffect, 1, 1, 0, merge_color(c_white, c_black, clamp(abs(RandomMaskEffect / 2), 0, 1)), 1 - rand);
                }
            }
            else
            {
                color = 12632256;
                if ((global.masks[i] == 0 && global.hardmode == 0) || (global.hardmodemasks[i] == 0 && global.hardmode == 1))
                {
                    color = 0;
                }
                temp = scrGetMaskSkin(i, global.selectskin[i], "Big");
                if (select == i)
                {
                    draw_sprite_ext(temp, i, 81, masky + starty + 22, 1.5, 1.5, lengthdir_x(5, (starty * 1.765) + (dir * 2)), c_black, 0.5);
                    drawy = starty;
                }
                else if (i == 1 && global.hardmode == 1 && global.selectskin[1] == 1)
                {
                    if (RasmusState != "None")
                    {
                        draw_sprite_ext(asset_get_index("sprMasksOwlBig" + RasmusState + "Hard"), RasmusFrame, 81, masky + starty + 2, 1, 1, 0, c_black, 0.5);
                        draw_sprite_ext(asset_get_index("sprMasksOwlBig" + RasmusState + "Hard"), RasmusFrame, 80, masky + starty, 1, 1, 0, color, 1);
                        if (RasmusState == "Blink" && RasmusFrame >= 9)
                        {
                            RasmusState = "None";
                            RasmusFrame = 0;
                        }
                        if (RasmusState == "Blink2" && RasmusFrame >= 7)
                        {
                            RasmusState = "None";
                            RasmusFrame = 0;
                        }
                    }
                    else
                    {
                        draw_sprite_ext(temp, i, 81, masky + starty + 2, 1, 1, 0, c_black, 0.5);
                        draw_sprite_ext(temp, i, 80, masky + starty, 1, 1, 0, color, 1);
                    }
                }
                else
                {
                    draw_sprite_ext(temp, i, 81, masky + starty + 2, 1, 1, 0, c_black, 0.5);
                    draw_sprite_ext(temp, i, 80, masky + starty, 1, 1, 0, color, 1);
                }
            }
            if (select == i)
            {
                starty += 120;
            }
            else
            {
                starty += 80;
            }
            i += 1;
        }
        if (name[select] != "Random")
        {
            temp = scrGetMaskSkin(select, global.selectskin[select], "Big");
            temp2 = scrGetMaskSkin(select, skinmasklast, "Big");
            if ((global.masks[select] == 0 && global.hardmode == 0) || (global.hardmodemasks[select] == 0 && global.hardmode == 1))
            {
                Shadowlerp = 1;
                Shadow = 1;
            }
            else if (global.BlockSkin == 0)
            {
                Shadowlerp = 0;
                Shadow = 0;
            }
            if (SkinAvailable == 0)
            {
                draw_set_blend_mode(bm_add);
                draw_sprite_ext(temp2, select, 80 + SkinEffect + 1, masky + drawy + 20 + SkinEffect + 1, 1.5, 1.5, lengthdir_x(5, (starty * 1.765) + (dir * 2)) + (SkinEffect / 2), c_white, abs(SkinEffect) - 0.75);
                draw_sprite_ext(temp2, select, 79 - SkinEffect, (masky + drawy + 19) - SkinEffect, 1.5, 1.5, lengthdir_x(5, (starty * 1.765) + (dir * 2)) + (SkinEffect / 2), c_white, abs(SkinEffect) - 0.75);
                draw_set_blend_mode(bm_normal);
            }
            if (select == 1 && global.hardmode == 1 && global.selectskin[1] == 1)
            {
                if (!RasmusActive && alarm[1] == -1)
                {
                    alarm[1] = 240;
                }
            }
            else
            {
                RasmusActive = 0;
                alarm[1] = -1;
            }
            if (RasmusActive == 1 && global.selectskin[1] == 1 && global.hardmode == 1)
            {
                if (RasmusState != "None")
                {
                    draw_sprite_ext(asset_get_index("sprMasksOwlBig" + RasmusState + "Hard"), RasmusFrame, 80 + SkinEffect, masky + drawy + 20 + (abs(SkinEffect) / 2), 1.5, 1.5, lengthdir_x(5, (starty * 1.765) + (dir * 2)) + (SkinEffect / 2), merge_color(c_white, c_black, Shadow + Shadowlerp), 1 - (BlockSkin - 0.75));
                    if (RasmusState == "Blink" && RasmusFrame >= 9)
                    {
                        RasmusState = "None";
                        RasmusFrame = 0;
                    }
                    if (RasmusState == "Blink2" && RasmusFrame >= 7)
                    {
                        RasmusState = "None";
                        RasmusFrame = 0;
                    }
                }
                else
                {
                    draw_sprite_ext(temp, select, 80 + SkinEffect, masky + drawy + 20 + (abs(SkinEffect) / 2), 1.5, 1.5, lengthdir_x(5, (starty * 1.765) + (dir * 2)) + (SkinEffect / 2), merge_color(c_white, c_black, Shadow + Shadowlerp), 1 - (BlockSkin - 0.75));
                }
            }
            else
            {
                draw_sprite_ext(temp, select, 80 + SkinEffect, masky + drawy + 20 + (abs(SkinEffect) / 2), 1.5, 1.5, lengthdir_x(5, (starty * 1.765) + (dir * 2)) + (SkinEffect / 2), merge_color(c_white, c_black, Shadow + Shadowlerp), 1 - (BlockSkin - 0.75));
                RasmusString = "";
                RasmusStringProgress = 0;
            }
            draw_set_blend_mode(bm_add);
            ii = 1;
            if (SkinAvailable == 0)
            {
                repeat (5)
                {
                    ii += 0.1;
                    draw_sprite_ext(temp2, select, 80 + SkinEffect, masky + drawy + 20 + (abs(SkinEffect) / 2), ii + SkinEffectScale, ii + SkinEffectScale, lengthdir_x(5, (starty * 1.765) + (dir * 2)) + (SkinEffect / 2), c_white, abs(SkinEffect));
                }
            }
            draw_set_blend_mode(bm_normal);
            if (global.selectskin[select] < 2)
            {
                temp3 = asset_get_index("sprMasksBig" + string_repeat("Hard", skinmaskBlock));
                draw_sprite_ext(temp3, select, 80 + SkinEffect, masky + drawy + 20 + (abs(SkinEffect) / 2), 1.5, 1.5, lengthdir_x(5, (starty * 1.765) + (dir * 2)) + (SkinEffect / 2), c_black, BlockSkin);
            }
        }
        else if (name[select] == "Random")
        {
            draw_sprite_ext(temprandom, RandomMaskCount, 80, masky + drawy + 20 + (RandomMaskEffect * 2), 1.5, 1.5, lengthdir_x(5, (starty * 1.765) + (dir * 2)) + abs(RandomMaskEffect * 2), merge_color(c_white, c_black, clamp(abs(RandomMaskEffect / 2), 0, 1)), 1 - rand);
        }
        if (on == 0)
        {
            if (masky < (room_height + 40))
            {
                masky += maskspeed;
                maskspeed += 1;
            }
            else if (maskx > -2 || alpha > 0)
            {
                maskx -= 2;
                alpha -= 0.05;
            }
            else
            {
                instance_destroy();
            }
        }
        selectdesc = 0;
        if (global.hardmode == 1)
        {
            if (select == 2 || select == 6)
            {
                selectdesc = 1;
            }
            if (select == 11)
            {
                selectdesc = 11;
            }
            if (select == 17)
            {
                selectdesc = 4;
            }
            if (select == 15)
            {
                selectdesc = 5;
            }
            if (select == 21)
            {
                selectdesc = 2;
            }
        }
        color1 = merge_color(merge_color(c_aqua, c_teal, 0.5 + lengthdir_x(0.5, dir * 2.55)), merge_color(c_fuchsia, c_blue, 0.5 + lengthdir_x(0.5, dir * 2.55)), ColorChange);
        color2 = merge_color(merge_color(c_yellow, c_aqua, 0.5 + lengthdir_x(0.5, dir * 2.55)), merge_color(c_teal, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.55)), ColorChange);
        color1s = merge_color(merge_color(c_purple, c_maroon, 0.5 + lengthdir_x(0.5, dir * 2.55)), merge_color(make_colour_rgb(60, 255, 0), c_green, 0.5 + lengthdir_x(0.5, dir * 2.55)), ColorChange);
        color2s = merge_color(merge_color(c_teal, c_purple, 0.5 + lengthdir_x(0.5, dir * 2.55)), merge_color(c_olive, make_colour_rgb(60, 255, 0), 0.5 + lengthdir_x(0.5, dir * 2.55)), ColorChange);
        color3s = merge_color(merge_color(c_white, c_ltgray, 0.5 + lengthdir_x(0.5, dir * 2.55)), merge_color(c_white, c_ltgray, 0.5 + lengthdir_x(0.5, dir * 2.55)), ColorChange);
        color4s = merge_color(merge_color(c_ltgray, c_white, 0.5 + lengthdir_x(0.5, dir * 2.55)), merge_color(c_ltgray, c_white, 0.5 + lengthdir_x(0.5, dir * 2.55)), ColorChange);
        draw_set_blend_mode(bm_normal);
        draw_set_font(fntMaskMenu);
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        draw_set_color(c_black);
        draw_set_alpha(1 - (RandomMaskShadow * 2));
        TextRandomAlpha = 1 - (RandomMaskShadow * 2);
        if (name[select] == "Random" || (global.hardmode == 1 && global.hardmodemasks[select] == 1) || (global.hardmode == 0 && global.masks[select] == 1))
        {
            if (name[select] == "Random" && rand == 1 && StageRandom != 0)
            {
                exit;
            }
            d3d_set_projection_ortho(0, 0, view_wview[0] - (SkinEffect * 2), view_hview[0], 0);
            draw_text((442 - (maskx * 9)) + 3 + 0, ((view_hview[0] / 2) - 10) + 9 + 1 + 3, name[select]);
            draw_text_color((442 - (maskx * 9)) + 0, ((view_hview[0] / 2) - 10) + 9 + 1 + 0, name[select], color4s, color4s, color3s, color3s, TextRandomAlpha);
            draw_text_color((442 - (maskx * 9)) + 2, ((view_hview[0] / 2) - 10) + 9 + 1 + 2, name[select], color2s, color2s, color1s, color1s, TextRandomAlpha);
            draw_text_color((442 - (maskx * 9)) + 1, ((view_hview[0] / 2) - 10) + 9 + 1 + 1, name[select], color2, color2, color1, color1, TextRandomAlpha);
            draw_set_font(fntMasksDescription);
            draw_set_color(c_black);
            d3d_set_projection_ortho(0, 0, view_wview[0] - (SkinEffect / 2), view_hview[0], 0);
            draw_text_transformed(438 - (maskx * 9) - 1, ((view_hview[0] / 2) - 10) + 33 + 1, string_upper(description[select]), 1, 1, image_angle);
            draw_text_transformed((438 - (maskx * 9)) + 2, ((view_hview[0] / 2) - 10) + 33 + 1, string_upper(description[select]), 1, 1, image_angle);
            draw_text_transformed(438 - (maskx * 9), (((view_hview[0] / 2) - 10) + 33 + 1) - 2, string_upper(description[select]), 1, 1, image_angle);
            draw_text_transformed(438 - (maskx * 9), ((view_hview[0] / 2) - 10) + 33 + 1 + 1, string_upper(description[select]), 1, 1, image_angle);
            draw_set_color(merge_color(merge_color(c_fuchsia, c_teal, 0.5 + lengthdir_x(0.5, dir * 2.55)), merge_color(make_colour_rgb(211, 33, 110), c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.55)), ColorChange));
            draw_text_transformed(((438 - (maskx * 9)) + 1) - 0.21, (((view_hview[0] / 2) - 10) + 33 + 1) - 0.21, string_upper(description[select]), 1, 1, image_angle);
            draw_set_color(merge_color(merge_color(c_white, c_aqua, 0.25 - lengthdir_x(0.25, dir * 2.55)), merge_color(c_white, make_colour_rgb(60, 255, 0), 0.25 - lengthdir_x(0.25, dir * 2.55)), ColorChange));
            draw_text_transformed(438 - (maskx * 9), ((view_hview[0] / 2) - 10) + 33, string_upper(description[select]), 1, 1, image_angle);
            if (SkinAvailable == 0)
            {
                d3d_set_projection_ortho(0, 0, view_wview[0] - SkinEffect, view_hview[0], 0);
                draw_set_font(fntMaskMenu);
                draw_set_blend_mode(bm_add);
                draw_set_alpha(abs(SkinEffect));
                draw_text_color((442 - (maskx * 9)) + 2, ((view_hview[0] / 2) - 10) + 9 + 1 + 2, name[select], c_white, c_white, c_black, c_black, abs(SkinEffect));
                draw_text_color((442 - (maskx * 9)) + 1, ((view_hview[0] / 2) - 10) + 9 + 1 + 1, name[select], c_white, c_white, c_black, c_black, abs(SkinEffect));
                draw_set_color(c_white);
                d3d_set_projection_ortho(0, 0, view_wview[0] - SkinEffect, view_hview[0], 0);
                draw_set_font(fntMasksDescription);
                draw_text_transformed(438 - (maskx * 9), ((view_hview[0] / 2) - 10) + 33, string_upper(description[select]), 1, 1, image_angle);
                draw_text_transformed(((438 - (maskx * 9)) + 1) - 0.21, (((view_hview[0] / 2) - 10) + 33 + 1) - 0.21, string_upper(description[select]), 1, 1, image_angle);
                draw_set_alpha(1);
                draw_set_blend_mode(bm_normal);
            }
            draw_set_alpha(TextRandomAlpha);
            if (!selectdesc == 0)
            {
                draw_set_color(c_black);
                draw_text_transformed(((438 - (maskx * 9)) + string_width(description[select])) - 1, ((view_hview[0] / 2) - 10) + 33 + 1, " " + description2[selectdesc], 1, 1, image_angle);
                draw_text_transformed((438 - (maskx * 9)) + string_width(description[select]) + 2, ((view_hview[0] / 2) - 10) + 33 + 1, " " + description2[selectdesc], 1, 1, image_angle);
                draw_text_transformed((438 - (maskx * 9)) + string_width(description[select]), (((view_hview[0] / 2) - 10) + 33 + 1) - 2, " " + description2[selectdesc], 1, 1, image_angle);
                draw_text_transformed((438 - (maskx * 9)) + string_width(description[select]), ((view_hview[0] / 2) - 10) + 33 + 1 + 1, " " + description2[selectdesc], 1, 1, image_angle);
                draw_set_color(merge_color(c_maroon, c_red, 0.5 + lengthdir_x(0.5, dir * 12)));
                draw_text_transformed((438 - (maskx * 9)) + string_width(description[select]) + 1, (((view_hview[0] / 2) - 10) + 33 + 1) - 0.21, " " + description2[selectdesc], 1, 1, image_angle);
                draw_set_color(merge_color(c_white, c_red, 0.25 - lengthdir_x(0.25, dir * 12)));
                draw_text_transformed((438 - (maskx * 9)) + string_width(description[select]), ((view_hview[0] / 2) - 10) + 33, " " + description2[selectdesc], 1, 1, image_angle);
            }
            d3d_set_projection_ortho(0, 0, view_wview[0] - (SkinEffect / 3), view_hview[0], 0);
            if (select == 6 || select == 22 || (weaponindex != -1 && select == 1))
            {
                draw_set_font(fntDate);
                draw_set_color(c_black);
                draw_text_transformed((439 - (maskx * 9)) + 1, ((view_hview[0] / 2) - 10) + 48 + 2, description3[select], 1, 1, image_angle);
                draw_text_transformed((439 - (maskx * 9)) + 1, ((view_hview[0] / 2) - 10) + 48, description3[select], 1, 1, image_angle);
                draw_text_transformed((439 - (maskx * 9)) + 2, ((view_hview[0] / 2) - 10) + 48 + 1, description3[select], 1, 1, image_angle);
                draw_text_transformed(439 - (maskx * 9), ((view_hview[0] / 2) - 10) + 48 + 1, description3[select], 1, 1, image_angle);
                draw_text_transformed(439 - (maskx * 9), (((view_hview[0] / 2) - 10) + 48) - 1, description3[select], 1, 1, image_angle);
                draw_text_transformed((439 - (maskx * 9)) + 1, ((view_hview[0] / 2) - 10) + 48, description3[select], 1, 1, image_angle);
                draw_text_transformed(439 - (maskx * 9) - 1, ((view_hview[0] / 2) - 10) + 48, description3[select], 1, 1, image_angle);
                draw_set_color(c_dkgray);
                draw_text_transformed((439 - (maskx * 9)) + 1, ((view_hview[0] / 2) - 10) + 48 + 1, description3[select], 1, 1, image_angle);
                draw_set_color(c_white);
                draw_text_transformed(439 - (maskx * 9), ((view_hview[0] / 2) - 10) + 48, description3[select], 1, 1, image_angle);
            }
            draw_set_alpha(1);
            d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
        }
        else if ((global.hardmode == 1 && global.hardmodemasks[select] == 0) || (global.hardmode == 0 && global.masks[select] == 0))
        {
            draw_text((442 - (maskx * 9)) + 3 + 0, ((view_hview[0] / 2) - 10) + 9 + 1 + 3, "???");
            draw_text_color((442 - (maskx * 9)) + 0, ((view_hview[0] / 2) - 10) + 9 + 1 + 0, "???", color4s, color4s, color3s, color3s, TextRandomAlpha);
            draw_text_color((442 - (maskx * 9)) + 2, ((view_hview[0] / 2) - 10) + 9 + 1 + 2, "???", color2s, color2s, color1s, color1s, TextRandomAlpha);
            draw_text_color((442 - (maskx * 9)) + 1, ((view_hview[0] / 2) - 10) + 9 + 1 + 1, "???", color2, color2, color1, color1, TextRandomAlpha);
        }
        d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
        if (showmutilatordesc > 0)
        {
            showmutilatordesc -= 1;
        }
        else
        {
            showmutilatordesc = 956;
        }
        if (showmutilatordesc < 1 && global.hardmode == 1)
        {
            description[3] = "Miami mutilator's victim";
        }
        else
        {
            description[3] = "Gun lover";
        }
        draw_set_font(fntDescription);
        draw_set_alpha(TipAlpha - 0.75);
        draw_set_blend_mode(bm_add);
        draw_rectangle_colour(360, 8 - TipY, view_hview[0] + 1, 22 - TipY, c_black, merge_color(make_colour_rgb(TipColorR, TipColorG, TipColorB), c_black, 0.5), make_colour_rgb(TipColorR, TipColorG, TipColorB), c_black, 0);
        draw_rectangle_colour(451, 8 - TipY, view_hview[0] + 1 + 103, 22 - TipY, merge_color(make_colour_rgb(TipColorR, TipColorG, TipColorB), c_black, 0.5), c_black, c_black, make_colour_rgb(TipColorR, TipColorG, TipColorB), 0);
        draw_set_alpha(TipAlpha - 0.85);
        draw_rectangle_colour(360, 8 - TipY, view_hview[0] + 1, 22 - TipY, c_black, make_colour_rgb(TipColorG, TipColorR, TipColorB), make_colour_rgb(TipColorG, TipColorR, TipColorB), c_black, 0);
        draw_rectangle_colour(451, 8 - TipY, view_hview[0] + 1 + 103, 22 - TipY, make_colour_rgb(TipColorG, TipColorR, TipColorB), c_black, c_black, make_colour_rgb(TipColorG, TipColorR, TipColorB), 0);
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_colour(360, 23 - TipY, view_hview[0] + 1, 24 - TipY, c_black, merge_color(c_black, c_white, TipAlpha), merge_color(c_black, c_dkgray, TipAlpha), c_black, 0);
        draw_rectangle_colour(451, 23 - TipY, view_hview[0] + 1 + 103, 24 - TipY, merge_color(c_black, c_white, TipAlpha), c_black, c_black, merge_color(c_black, c_dkgray, TipAlpha), 0);
        draw_set_blend_mode(bm_normal);
        draw_set_alpha(TipAlpha);
        draw_set_font(fntDate);
        draw_set_color(c_black);
        draw_text_transformed(282 + TipX[0] + 1, ((view_hview[0] / 2) + -135 + 1 + 21 + 2) - TipY, "To change skin press ", 1, 1, image_angle);
        draw_text_transformed(282 + TipX[0] + 1, ((view_hview[0] / 2) + -135 + 1 + 21) - TipY, "To change skin press ", 1, 1, image_angle);
        draw_text_transformed(282 + TipX[0] + 2, ((view_hview[0] / 2) + -135 + 1 + 21 + 1) - TipY, "To change skin press ", 1, 1, image_angle);
        draw_text_transformed(282 + TipX[0], ((view_hview[0] / 2) + -135 + 1 + 21 + 1) - TipY, "To change skin press ", 1, 1, image_angle);
        draw_text_transformed(282 + TipX[0], ((view_hview[0] / 2) + -135 + 1 + 21) - 1 - TipY, "To change skin press ", 1, 1, image_angle);
        draw_text_transformed(282 + TipX[0] + 1, ((view_hview[0] / 2) + -135 + 1 + 21) - TipY, "To change skin press ", 1, 1, image_angle);
        draw_text_transformed((282 + TipX[0]) - 1, ((view_hview[0] / 2) + -135 + 1 + 21) - TipY, "To change skin press ", 1, 1, image_angle);
        draw_set_color(c_dkgray);
        draw_text_transformed(282 + TipX[0] + 1, ((view_hview[0] / 2) + -135 + 1 + 21 + 1) - TipY, "To change skin press ", 1, 1, image_angle);
        draw_set_color(merge_color(c_black, make_colour_rgb(TipColorR, TipColorG, TipColorB), 0.5));
        draw_set_alpha(TipGlow[TipSwitch]);
        if (SkinAvailable != 1)
        {
            draw_text_transformed(282 + TipX[0] + 1, ((view_hview[0] / 2) + -135 + 1 + 21 + 1) - TipY, "To change skin press ", 1, 1, image_angle);
        }
        draw_set_alpha(TipAlpha);
        draw_set_color(c_white);
        draw_text_transformed(282 + TipX[0], ((view_hview[0] / 2) + -135 + 1 + 21) - TipY, "To change skin press ", 1, 1, image_angle);
        i = 1;
        ii = 0;
        letter = "(A)";
        repeat (2)
        {
            draw_set_color(c_black);
            draw_text_transformed(392 + ii + TipX[i] + 1, ((view_hview[0] / 2) + -135 + 1 + 21 + 2) - TipY, letter, 1, 1, 0);
            draw_text_transformed(392 + ii + TipX[i] + 1, ((view_hview[0] / 2) + -135 + 1 + 21) - TipY, letter, 1, 1, 0);
            draw_text_transformed(392 + ii + TipX[i] + 2, ((view_hview[0] / 2) + -135 + 1 + 21 + 1) - TipY, letter, 1, 1, 0);
            draw_text_transformed(392 + ii + TipX[i], ((view_hview[0] / 2) + -135 + 1 + 21 + 1) - TipY, letter, 1, 1, 0);
            draw_text_transformed(392 + ii + TipX[i], ((view_hview[0] / 2) + -135 + 1 + 21) - 1 - TipY, letter, 1, 1, 0);
            draw_text_transformed(392 + ii + TipX[i] + 1, ((view_hview[0] / 2) + -135 + 1 + 21) - TipY, letter, 1, 1, 0);
            draw_text_transformed((392 + ii + TipX[i]) - 1, ((view_hview[0] / 2) + -135 + 1 + 21) - TipY, letter, 1, 1, 0);
            draw_set_color(c_dkgray);
            draw_text_transformed(392 + ii + TipX[i] + 1, ((view_hview[0] / 2) + -135 + 1 + 21 + 1) - TipY, letter, 1, 1, 0);
            draw_set_color(merge_color(c_black, make_colour_rgb(TipColorR, TipColorG, TipColorB), 0.5));
            draw_set_alpha(TipGlow[i]);
            if (SkinAvailable != 1)
            {
                draw_text_transformed(392 + ii + TipX[i] + 1, ((view_hview[0] / 2) + -135 + 1 + 21 + 1) - TipY, letter, 1, 1, 0);
            }
            draw_set_alpha(TipAlpha);
            draw_set_color(c_white);
            draw_text_transformed(392 + ii + TipX[i], ((view_hview[0] / 2) + -135 + 1 + 21) - TipY, letter, 1, 1, 0);
            if (i == 1)
            {
                draw_text_transformed_colour(392 + ii + TipX[i], ((view_hview[0] / 2) + -135 + 1 + 21) - TipY, letter, 1, 1, 0, make_colour_rgb(TipColorR, TipColorG, TipColorB), c_black, c_black, make_colour_rgb(TipColorR, TipColorG, TipColorB), TipGlow[i]);
            }
            else
            {
                draw_text_transformed_colour(392 + ii + TipX[i], ((view_hview[0] / 2) + -135 + 1 + 21) - TipY, letter, 1, 1, 0, c_black, make_colour_rgb(TipColorR, TipColorG, TipColorB), make_colour_rgb(TipColorR, TipColorG, TipColorB), c_black, TipGlow[i]);
            }
            letter = "(D)";
            ii += 17;
            i += 1;
        }
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text_transformed_colour(282 + TipX[0], ((view_hview[0] / 2) + -135 + 1 + 21) - TipY, "To change skin press ", 1, 1, 0, c_white, make_colour_rgb(TipColorR, TipColorG, TipColorB), make_colour_rgb(TipColorR, TipColorG, TipColorB), c_white, TipGlow[TipSwitch]);
        draw_set_font(fntLevelComplete);
        i = 1;
        ii = 0;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_colour(0, view_hview[0] / 2, view_wview[0], view_hview[0], c_black, c_black, merge_color(c_black, c_white, BlockSkin), merge_color(c_black, c_white, BlockSkin), 0);
        draw_set_blend_mode(bm_add);
        if (global.hardmode == 0)
        {
            draw_rectangle_colour(0, (view_hview[0] / 2) + 70, view_wview[0], view_hview[0], c_black, c_black, merge_color(c_black, merge_color(colorUnlock4, c_black, 0.75), BlockSkin), merge_color(c_black, merge_color(colorUnlock4, c_black, 0.75), BlockSkin), 0);
        }
        else
        {
            draw_rectangle_colour(0, (view_hview[0] / 2) + 70, view_wview[0], view_hview[0], c_black, c_black, merge_color(c_black, merge_color(c_purple, c_black, 0.75), BlockSkin), merge_color(c_black, merge_color(c_purple, c_black, 0.75), BlockSkin), 0);
        }
        draw_set_blend_mode(bm_normal);
        if (string_length(TipUnlock) > 21)
        {
            TipUnlocSize = clamp(0.735 - (string_length(TipUnlock) / 228), 0.4, 0.735);
            TipUnlockX = string_length(TipUnlock) - 4;
        }
        else
        {
            TipUnlocSize = 0.735;
            TipUnlockX = 21;
        }
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        repeat (string_length(TipUnlock))
        {
            if (global.BlockSkin == 1)
            {
                TipUnlockY[i] = lerp(TipUnlockY[i], 0, clamp(wave - (i / 2), 0, 0.25));
            }
            else
            {
                TipUnlockY[i] = lerp(TipUnlockY[i], 60, 0.25);
            }
            draw_set_color(c_black);
            draw_text_transformed(2 + TipUnlockX + ii, (view_hview[0] / 2) + 92 + TipUnlockY[i], string_char_at(TipUnlock, i), TipUnlocSize, TipUnlocSize, 0);
            draw_text_transformed(3 + TipUnlockX + ii, (view_hview[0] / 2) + 91 + TipUnlockY[i], string_char_at(TipUnlock, i), TipUnlocSize, TipUnlocSize, 0);
            draw_text_transformed(2 + TipUnlockX + ii, (view_hview[0] / 2) + 90 + TipUnlockY[i], string_char_at(TipUnlock, i), TipUnlocSize, TipUnlocSize, 0);
            draw_text_transformed(1 + TipUnlockX + ii, (view_hview[0] / 2) + 91 + TipUnlockY[i], string_char_at(TipUnlock, i), TipUnlocSize, TipUnlocSize, 0);
            draw_set_color(c_white);
            draw_text_transformed_colour(2 + TipUnlockX + ii, (view_hview[0] / 2) + 91 + TipUnlockY[i], string_char_at(TipUnlock, i), TipUnlocSize, TipUnlocSize, 0, merge_color(colorUnlock1, colorUnlock2, clamp(lengthdir_x(1, (dir * 2) + (i * 12)), 0, 1)), merge_color(colorUnlock1, colorUnlock2, clamp(lengthdir_x(1, (dir * 2) + (i * 12)), 0, 1)), merge_color(colorUnlock1, colorUnlock2, clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1)), merge_color(colorUnlock1, colorUnlock2, clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1)), 1);
            draw_text_transformed_colour(TipUnlockX + ii, (view_hview[0] / 2) + 89 + TipUnlockY[i], string_char_at(TipUnlock, i), TipUnlocSize, TipUnlocSize, 0, merge_color(colorUnlock3, colorUnlock4, clamp(lengthdir_x(1, (dir * 2) + (i * 12)), 0, 1)), merge_color(colorUnlock3, colorUnlock4, clamp(lengthdir_x(1, (dir * 2) + (i * 12)), 0, 1)), merge_color(colorUnlock3, colorUnlock5, clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1)), merge_color(colorUnlock3, colorUnlock5, clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1)), 1);
            draw_text_transformed_colour(1 + TipUnlockX + ii, (view_hview[0] / 2) + 89 + TipUnlockY[i], string_char_at(TipUnlock, i), TipUnlocSize, TipUnlocSize, 0, merge_color(colorUnlock3, colorUnlock4, clamp(lengthdir_x(1, (dir * 2) + (i * 12)), 0, 1)), merge_color(colorUnlock3, colorUnlock4, clamp(lengthdir_x(1, (dir * 2) + (i * 12)), 0, 1)), merge_color(colorUnlock3, colorUnlock5, clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1)), merge_color(colorUnlock3, colorUnlock5, clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1)), 1);
            draw_text_transformed_colour(1 + TipUnlockX + ii, (view_hview[0] / 2) + 90 + TipUnlockY[i], string_char_at(TipUnlock, i), TipUnlocSize, TipUnlocSize, 0, merge_color(colorUnlock3, colorUnlock6, clamp(lengthdir_x(1, (dir * 2) + (i * 12)), 0, 1)), merge_color(colorUnlock3, colorUnlock6, clamp(lengthdir_x(1, (dir * 2) + (i * 12)), 0, 1)), merge_color(colorUnlock3, colorUnlock4, clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1)), merge_color(colorUnlock3, colorUnlock4, clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1)), 1);
            draw_set_blend_mode(bm_add);
            draw_text_transformed_colour((1 + TipUnlockX + ii) - clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1), ((view_hview[0] / 2) + 90 + TipUnlockY[i]) - clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1), string_char_at(TipUnlock, i), TipUnlocSize, TipUnlocSize, 0, merge_color(c_black, c_white, clamp(lengthdir_x(1, (dir * 2) + (i * 12)), 0, 1)), merge_color(c_black, c_white, clamp(lengthdir_x(1, (dir * 2) + (i * 12)), 0, 1)), merge_color(c_black, c_white, clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1)), merge_color(c_black, c_white, clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 1)), clamp(lengthdir_x(1, (dir * 2.5) + (i * 12)), 0, 0.35));
            draw_set_blend_mode(bm_normal);
            i += 1;
            if (string_char_at(TipUnlock, i) == " ")
            {
                ii += 10;
            }
            else if (string_length(TipUnlock) > 21)
            {
                ii += clamp(22 - (string_length(TipUnlock) / 9), 10, 22);
            }
            else
            {
                ii += 22;
            }
        }
    }
}
