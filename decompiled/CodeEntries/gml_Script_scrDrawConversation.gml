d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
if (global.language == 0)
{
    str_skipconv = "HOLD [RMB] TO SKIP";
    str_pickques = "PICK A QUESTION TO ASK";
}
else
{
    str_skipconv = "УДЕРЖИВАЙТЕ [ПКМ], ЧТОБЫ ПРОПУСТИТЬ";
    str_pickques = "ВЫБЕРИТЕ ВОПРОС, КОТОРЫЙ ХОТИТЕ ЗАДАТЬ";
}
if (instance_exists(objFinalDialogue) && objFinalDialogue.question == 1)
{
    skiptext = str_pickques;
}
else
{
    skiptext = str_skipconv;
}
if (global.dialoguestyle == 0)
{
    if (global.maskindex == 26 && global.maskon == 1)
    {
        phonecolor1 = merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.25, global.dir * 2));
        phonecolor2 = 0;
        textprecolor1 = merge_color(c_maroon, c_white, 0.5 + lengthdir_x(0.5, global.dir));
        textprecolor2 = merge_color(c_maroon, c_red, 0.5 - lengthdir_x(0.5, global.dir));
    }
    else
    {
        phonecolor1 = merge_color(c_orange, c_lime, 0.5 + lengthdir_x(0.25, global.dir * 2));
        phonecolor2 = merge_color(c_maroon, c_navy, 0.5 + lengthdir_x(0.25, global.dir * 2));
        textprecolor1 = merge_color(c_maroon, c_teal, 0.5 + lengthdir_x(0.5, global.dir));
        textprecolor2 = merge_color(c_white, c_yellow, 0.25 - lengthdir_x(0.25, global.dir));
    }
}
else if (global.dialoguestyle != 0)
{
    if (global.maskindex == 26 && global.maskon == 1)
    {
        phonecolor1 = merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.25, global.dir * 2));
        phonecolor2 = 0;
        textprecolor1 = merge_color(c_maroon, c_white, 0.5 + lengthdir_x(0.5, global.dir));
        textprecolor2 = merge_color(c_maroon, c_red, 0.5 - lengthdir_x(0.5, global.dir));
    }
    else
    {
        phonecolor1 = merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.25, global.dir * 2));
        phonecolor2 = 0;
        textprecolor1 = merge_color(c_fuchsia, c_teal, 0.5 + lengthdir_x(0.5, global.dir));
        textprecolor2 = merge_color(c_white, c_aqua, 0.25 - lengthdir_x(0.25, global.dir));
    }
}
if (instance_exists(objPhoneConversation))
{
    index = objPhoneConversation.index;
    reload = objPhoneConversation.reload;
    if (instance_exists(objLightingEngine))
    {
        with (objLight)
        {
            if (targetstrength == 1)
            {
                objEffector.phonecolor1 = color;
                objEffector.phonecolor2 = 0;
            }
        }
    }
    textcolor1 = merge_color(textprecolor1, c_black, objPhoneConversation.reload * 0.1);
    textcolor2 = merge_color(textprecolor2, c_black, objPhoneConversation.reload * 0.1);
}
else if (blackx > -5)
{
    if (phonex > -5)
    {
        if (instance_exists(objLightingEngine))
        {
            with (objLight)
            {
                if (targetstrength == 1)
                {
                    objEffector.phonecolor1 = color;
                    objEffector.phonecolor2 = 0;
                }
            }
        }
    }
}
if (instance_exists(objFinalDialogue))
{
    sprite = objFinalDialogue.sprite;
    index = global.dir * 0.15;
    textcolor1 = merge_color(textprecolor1, c_black, objFinalDialogue.reload * 0.1);
    textcolor2 = merge_color(textprecolor2, c_black, objFinalDialogue.reload * 0.1);
    if (objFinalDialogue.change == 0 && objFinalDialogue.question == 1)
    {
        textcolor2 = merge_color(merge_color(c_fuchsia, c_orange, 0.5 - lengthdir_x(0.5, global.dir)), c_black, objFinalDialogue.reload * 0.1);
    }
}
if (instance_exists(objFinalDialogue2))
{
    sprite = objFinalDialogue2.sprite;
    index = global.dir * 0.15;
    textcolor1 = merge_color(textprecolor1, c_black, objFinalDialogue2.reload * 0.1);
    textcolor2 = merge_color(textprecolor2, c_black, objFinalDialogue2.reload * 0.1);
}
if (instance_exists(objPhoneConversation) || (instance_exists(objFinalDialogue) && objFinalDialogue.stop == 0) || (instance_exists(objFinalDialogue2) && objFinalDialogue2.stop == 0))
{
    blackx = lerp(blackx, 42.5, 0.1);
    if (blackx > -5)
    {
        if (!instance_exists(objFinalDialogue) && !instance_exists(objFinalDialogue2))
        {
            phonex = lerp(phonex, 173.4, 0.1);
        }
        else if ((instance_exists(objFinalDialogue) && objFinalDialogue.change == 0) || (instance_exists(objFinalDialogue2) && objFinalDialogue2.change == 0))
        {
            phonex = lerp(phonex, 173.4, 0.1);
        }
    }
    if (instance_exists(objFinalDialogue))
    {
        with (objFinalDialogue)
        {
            if (reload > 0)
            {
                reload -= 1;
            }
            mousex = (display_mouse_get_x() * 452) / display_get_width();
            mousey = (display_mouse_get_y() * 256) / display_get_height();
            if (change == 1)
            {
                if (objEffectorHouse.phonex > -5)
                {
                    objEffectorHouse.phonex -= 10.2;
                }
                else
                {
                    if (question == 1)
                    {
                        sprite = bikerface;
                    }
                    else
                    {
                        sprite = face[current];
                    }
                    change = 0;
                }
            }
            if (stop == 0)
            {
                if (global.xbox == 0)
                {
                    if (question == 1)
                    {
                        select = -1;
                        if (mousey > 197.5 && mousey < 215.5)
                        {
                            select = 0;
                        }
                        if (mousey > 215.5 && mousey < 233.5)
                        {
                            select = 1;
                        }
                    }
                }
            }
        }
    }
    if (instance_exists(objFinalDialogue2))
    {
        with (objFinalDialogue2)
        {
            if (reload > 0)
            {
                reload -= 1;
            }
            if (change == 1)
            {
                if (objEffectorHouse.phonex > -5)
                {
                    objEffectorHouse.phonex -= 10.2;
                }
                else
                {
                    sprite = face[current];
                    change = 0;
                }
            }
        }
    }
    draw_triangle_color(global.viewwview - phonex, 0, global.viewwview, 0, (global.viewwview - phonex) + 210, global.viewhview, phonecolor1, phonecolor1, phonecolor2, 0);
    draw_triangle_color(global.viewwview - phonex, 0, (global.viewwview - phonex) + 70, global.viewhview, (global.viewwview - phonex) + 280, global.viewhview, phonecolor1, phonecolor2, phonecolor2, 0);
    draw_sprite_ext(sprPhoneLine, 0, global.viewwview - phonex, 0, 1, 2, 15, c_white, 1);
    draw_set_color(c_black);
    draw_rectangle(0, 0, global.viewwview, blackx, false);
    draw_rectangle(0, global.viewhview, global.viewwview, (global.viewhview - (blackx * 1.5)) + 1, false);
    if (global.dialoguestyle == 1)
    {
        draw_sprite_ext(sprPhoneLine, 0, 0, blackx + 1, 1, 2, 90, c_white, 1);
        draw_sprite_ext(sprPhoneLine, 0, 0, (global.viewhview - (blackx * 1.5)) + 1, 1, 2, 90, c_white, 1);
    }
    draw_sprite_ext(sprite, index, (global.viewwview - phonex) + 108 + 2, (global.viewhview / 2) + 3, image_xscale, image_yscale, lengthdir_x(4, global.dir * 1.67), c_black, 0.5);
    if (global.maskindex == 26 && global.maskon == 1)
    {
        shader_set(shd_russell_player);
    }
    draw_sprite_ext(sprite, index, (global.viewwview - phonex) + 108, global.viewhview / 2, image_xscale, image_yscale, lengthdir_x(4, global.dir * 1.67), c_white, 1);
    shader_reset();
    draw_set_color(textcolor1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(dialoguefont);
    if (blackx > 38)
    {
        if (!instance_exists(objFinalDialogue) && !instance_exists(objFinalDialogue2))
        {
            draw_text(24, global.viewhview - 54.5, string_upper(objPhoneConversation.line1[objPhoneConversation.current]));
            draw_text(24, global.viewhview - 36.5, string_upper(objPhoneConversation.line2[objPhoneConversation.current]));
            draw_set_color(textcolor2);
            draw_text(22.5 - lengthdir_x(0.5, global.dir * 4), global.viewhview - 56 - lengthdir_x(0.5, global.dir * 4), string_upper(objPhoneConversation.line1[objPhoneConversation.current]));
            draw_text(22.5 - lengthdir_x(0.5, global.dir * 4), global.viewhview - 38 - lengthdir_x(0.5, global.dir * 4), string_upper(objPhoneConversation.line2[objPhoneConversation.current]));
        }
        else
        {
            if (instance_exists(objFinalDialogue))
            {
                with (objFinalDialogue)
                {
                    if (change == 0)
                    {
                        if (question == 0)
                        {
                            draw_text(24, global.viewhview - 54.5, string_upper(line1[current]));
                            draw_text(24, global.viewhview - 36.5, string_upper(line2[current]));
                            draw_set_color(objEffectorHouse.textcolor2);
                            draw_text(22.5 - lengthdir_x(0.5, global.dir * 4), global.viewhview - 56 - lengthdir_x(0.5, global.dir * 4), string_upper(line1[current]));
                            draw_text(22.5 - lengthdir_x(0.5, global.dir * 4), global.viewhview - 38 - lengthdir_x(0.5, global.dir * 4), string_upper(line2[current]));
                        }
                        else
                        {
                            draw_text(24, global.viewhview - 54.5, string_upper(question1[currentquestion]));
                            draw_text(24, global.viewhview - 36.5, string_upper(question2[currentquestion]));
                            draw_set_color(objEffectorHouse.textcolor2);
                            if (select == 0)
                            {
                                draw_set_color(c_white);
                            }
                            draw_text(22.5 - lengthdir_x(0.5, global.dir * 4), global.viewhview - 56 - lengthdir_x(0.5, global.dir * 4), string_upper(question1[currentquestion]));
                            draw_set_color(objEffectorHouse.textcolor2);
                            if (select == 1)
                            {
                                draw_set_color(c_white);
                            }
                            draw_text(22.5 - lengthdir_x(0.5, global.dir * 4), global.viewhview - 38 - lengthdir_x(0.5, global.dir * 4), string_upper(question2[currentquestion]));
                        }
                    }
                }
            }
            if (instance_exists(objFinalDialogue2))
            {
                with (objFinalDialogue2)
                {
                    if (change == 0)
                    {
                        draw_text(24, global.viewhview - 54.5, string_upper(line1[current]));
                        draw_text(24, global.viewhview - 36.5, string_upper(line2[current]));
                        draw_set_color(objEffectorHouse.textcolor2);
                        draw_text(22.5 - lengthdir_x(0.5, global.dir * 4), global.viewhview - 56 - lengthdir_x(0.5, global.dir * 4), string_upper(line1[current]));
                        draw_text(22.5 - lengthdir_x(0.5, global.dir * 4), global.viewhview - 38 - lengthdir_x(0.5, global.dir * 4), string_upper(line2[current]));
                    }
                }
            }
        }
        if (global.dialoguestyle == 0)
        {
            draw_set_font(fntDate);
            draw_text_colour(18, 31.3, skiptext, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
        }
        else
        {
            draw_set_font(fntKeyDescription);
            draw_text_colour(25, 31.3, skiptext, c_gray, c_gray, c_dkgray, c_dkgray, 1);
        }
    }
}
else if (blackx > -15)
{
    phonex = lerp(phonex, -5, 0.1);
    blackx = lerp(blackx, -15, 0.1);
    if (phonex > -5)
    {
        draw_triangle_color(global.viewwview - phonex, 0, global.viewwview, 0, (global.viewwview - phonex) + 210, global.viewhview, phonecolor1, phonecolor1, phonecolor2, 0);
        draw_triangle_color(global.viewwview - phonex, 0, (global.viewwview - phonex) + 70, global.viewhview, (global.viewwview - phonex) + 280, global.viewhview, phonecolor1, phonecolor2, phonecolor2, 0);
        draw_sprite_ext(sprPhoneLine, 0, global.viewwview - phonex, 0, 1, 2, 15, c_white, 1);
    }
    draw_set_color(c_black);
    draw_rectangle(0, 0, global.viewwview, blackx, false);
    draw_rectangle(0, global.viewhview, global.viewwview, global.viewhview - (blackx * 1.5), false);
    if (global.dialoguestyle == 1)
    {
        draw_sprite_ext(sprPhoneLine, 0, 0, blackx + 1, 1, 2, 90, c_white, 1);
        draw_sprite_ext(sprPhoneLine, 0, 0, (global.viewhview - (blackx * 1.5)) + 1, 1, 2, 90, c_white, 1);
    }
    if (phonex > -5)
    {
        draw_sprite_ext(sprite, index, (global.viewwview - phonex) + 108 + 2, (global.viewhview / 2) + 3, image_xscale, image_yscale, lengthdir_x(4, global.dir * 1.67), c_black, 0.5);
        if (global.maskindex == 26 && global.maskon == 1)
        {
            shader_set(shd_russell_player);
        }
        draw_sprite_ext(sprite, index, (global.viewwview - phonex) + 108, global.viewhview / 2, image_xscale, image_yscale, lengthdir_x(4, global.dir * 1.67), c_white, 1);
        shader_reset();
    }
}
with (objFinalDialogue)
{
    if (global.xbox == 0)
    {
        draw_sprite_ext(sprCursor, global.dir * 0.37, mousex + 1, mousey + 1, 1, 1, 0, c_black, 0.5);
        draw_set_blend_mode(bm_add);
        draw_sprite_ext(sprCursor, global.dir * 0.37, mousex, mousey, 1, 1, 0, c_white, 1);
        draw_set_blend_mode(bm_normal);
    }
}
