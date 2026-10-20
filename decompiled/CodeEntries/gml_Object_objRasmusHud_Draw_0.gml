d3d_set_projection_ortho(0, 0, global.wview, global.hview, 0);
if (global.eventactive == 1)
{
    if (count <= string_length(global.eventmessage))
    {
        if (reload <= 0)
        {
            if (string_char_at(messagecur, count) != "." && string_char_at(messagecur, count) != "," && string_char_at(messagecur, count) != "#")
            {
                audio_stop_sound(asset_get_index("sndVoiceRasmus_" + string(randomVoice)));
                if (talkstyle == "mystical")
                {
                    audio_sound_pitch(audio_play_sound(asset_get_index("sndVoiceRasmus_" + string(randomVoice)), 0, false), 0.7 + random(0.3));
                }
                else
                {
                    audio_sound_pitch(audio_play_sound(asset_get_index("sndVoiceRasmus_" + string(randomVoice)), 0, false), 0.85 + random(0.3));
                }
            }
            randomVoice = round(random_range(0, 7));
            count++;
            messagecur = string_copy(message, 1, count);
            reload = 3 + round(random(-2));
            if (string_char_at(messagecur, count) == ".")
            {
                reload = 18;
            }
            if (string_char_at(messagecur, count) == "," || string_char_at(messagecur, count) == "?")
            {
                reload = 6 + round(random(-1));
            }
        }
        else
        {
            reload--;
        }
    }
    else if (alarm_get(0) == -1)
    {
        alarm[0] = 320;
        global.rasmustalk = 0;
        if (instance_exists(objMaskMenu))
        {
            objMaskMenu.RasmusState = "None";
        }
    }
    if (talkstyle == "mystical")
    {
        vignette = lerp(vignette, 1, 0.015);
    }
    mountalpha = lerp(mountalpha, 1, 0.05);
}
else if (global.eventactive == -1)
{
    global.rasmustalk = 0;
    if (count > 0)
    {
        count--;
    }
    else
    {
        messagecur = "";
        global.eventactive = 0;
    }
}
else if (global.eventcancel)
{
    alarm[0] = -1;
    global.eventupdate = 1;
    global.eventcancel = 0;
    global.eventactive = 1;
    global.rasmustalk = 1;
}
if (global.eventactive == 0 || global.eventactive == -1)
{
    if (talkstyle == "mystical")
    {
        vignette = lerp(vignette, 0, 0.15);
    }
    mountalpha = lerp(mountalpha, 0, 0.15);
}
mountsizelerp = lerp(mountsizelerp, mountsize, 0.125);
if (global.maskindex != 1 && !instance_exists(objMaskMenu))
{
    exit;
}
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fntRussianDialogue);
draw_set_color(c_black);
draw_set_blend_mode(bm_subtract);
draw_roundrect_colour_ext((((global.wview / 2) + (mountsize * 10)) - (string_length(messagecur) * 5)) + 1, global.hview - 16, (((global.wview / 2) - (mountsize * 10)) + (string_length(messagecur) * 5)) - 1, (global.hview - 14) + 11, 12, 12, merge_color(c_black, merge_color(c_white, c_lime, 0.5), mountalpha), c_black, 0);
draw_set_blend_mode(bm_normal);
if (talkstyle == "typical")
{
    colorchange += 1;
}
if (talkstyle == "mystical")
{
    colorchange += vignette;
}
draw_set_blend_mode(bm_subtract);
draw_sprite_tiled_ext(sprNoise, current_time / 6, 0, 0, 1, 1, merge_color(c_black, c_purple, vignette / 2), 1);
draw_circle_color(global.wview / 2, global.hview / 2, 380, c_black, merge_color(c_black, c_lime, vignette), 0);
draw_circle_color(global.wview / 2, global.hview / 2, 560, c_black, merge_color(c_black, c_purple, vignette), 0);
draw_set_blend_mode(bm_normal);
i = 1;
ii = 0;
if (talkstyle == "typical")
{
    repeat (string_length(messagecur))
    {
        if (string_char_at(messagecur, i) != " " && string_char_at(messagecur, i) != "#")
        {
            if (global.eventactive == 1)
            {
                messagealpha[i] = lerp(messagealpha[i], 1, 0.25);
            }
            else if (global.eventactive == -1)
            {
                messagealpha[i] = lerp(messagealpha[i], 0, 0.25);
            }
            messagey[i] = lerp(messagey[i], 0, 0.25);
            text_color = merge_color(c_fuchsia, merge_color(c_white, c_purple, 0.05), messagealpha[i]);
            draw_set_blend_mode(bm_add);
            if (global.eventactive == 1 && messagealpha[i] <= 0.9)
            {
                itext = 0;
                repeat (4 - (global.optimize * 2))
                {
                    draw_text_transformed_colour((((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9)) + random_range(1 - messagealpha[i], -1 + messagealpha[i]), 245 + (messagey[i] / 2) + random_range((1 - messagealpha[i]) + itext, -1 + messagealpha[i]), string_upper(string_char_at(messagecur, i)), 1, 1, 0, c_blue, c_blue, c_aqua, c_aqua, 1 - messagealpha[i] - (itext / 8));
                    itext += 0.5;
                }
            }
            else if (global.eventactive == -1)
            {
                itext = 0;
                repeat (4 - (global.optimize * 2))
                {
                    draw_text_transformed_colour((((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9)) + random_range(1 - messagealpha[i], -1 + messagealpha[i]), 245 + (messagey[i] / 2) + random_range((1 - messagealpha[i]) + itext, -1 + messagealpha[i]), string_upper(string_char_at(messagecur, i)), 1, 1, 0, c_blue, c_blue, c_aqua, c_aqua, messagealpha[i] - (itext / 8));
                    itext += 0.5;
                }
            }
            itext = 0;
            iitext = 1;
            repeat (6 - (global.optimize * 3))
            {
                itext += 0.5;
                iitext += 0.3;
                draw_text_transformed_colour(((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9), 245 + messagey[i] + 1.75 + itext, string_upper(string_char_at(messagecur, i)), 1, 1, 0, c_purple, c_purple, c_black, c_black, messagealpha[i] - 0.075 - (itext / 6));
            }
            draw_set_blend_mode(bm_normal);
            draw_set_alpha(messagealpha[i]);
            draw_set_color(merge_color(c_purple, merge_color(c_fuchsia, c_black, 0.15), messagealpha[i]));
            draw_text_transformed(((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9), 245 + messagey[i] + 1.75, string_upper(string_char_at(messagecur, i)), 1, 1, 0);
            draw_set_color(merge_color(c_purple, merge_color(c_aqua, c_black, 0.125), messagealpha[i]));
            draw_text_transformed(((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9), 245 + messagey[i] + 1, string_upper(string_char_at(messagecur, i)), 1, 1, 0);
            if (global.optimize == 0)
            {
                draw_set_color(merge_color(c_purple, c_teal, messagealpha[i]));
                draw_set_alpha(messagealpha[i] - 0.5);
                draw_text_transformed((((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9)) + 0.5, 245 + messagey[i], string_upper(string_char_at(messagecur, i)), 1, 1, 0);
                draw_text_transformed(((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9) - 0.5, 245 + messagey[i], string_upper(string_char_at(messagecur, i)), 1, 1, 0);
                draw_text_transformed(((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9), (245 + messagey[i]) - 0.5, string_upper(string_char_at(messagecur, i)), 1, 1, 0);
                draw_set_alpha(1);
            }
            draw_text_transformed_colour(((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9), 245 + messagey[i], string_upper(string_char_at(messagecur, i)), 1, 1, 0, text_color, text_color, text_color, text_color, messagealpha[i]);
        }
        if (string_char_at(messagecur, i) == " " && string_char_at(messagecur, i) != "#")
        {
            ii += 0.5;
        }
        else if (string_char_at(messagecur, i) != "#")
        {
            ii += 1;
        }
        mountsize = ii;
        i += 1;
    }
}
if (talkstyle == "mystical")
{
    repeat (string_length(messagecur))
    {
        if (string_char_at(messagecur, i) != " " && string_char_at(messagecur, i) != "#")
        {
            if (global.eventactive == 1)
            {
                messagealpha[i] = lerp(messagealpha[i], 1, 0.125);
            }
            else if (global.eventactive == -1)
            {
                messagealpha[i] = lerp(messagealpha[i], 0, 0.25);
            }
            messagey[i] = lerp(messagey[i], 0, 0.15);
            if (messagealpha[i] <= 0.9)
            {
                text = choose("!", "$", "%", "&", "/", "▯");
            }
            else
            {
                text = string_upper(string_char_at(messagecur, i));
            }
            text_color = merge_color(c_maroon, merge_color(c_white, merge_color(c_aqua, c_ltgray, 0.5), clamp(lengthdir_x(1, colorchange + (i * 5)), 0, 1)), messagealpha[i]);
            draw_set_blend_mode(bm_add);
            if (global.eventactive == 1 && messagealpha[i] <= 0.9)
            {
                itext = 0;
                repeat (4 - (global.optimize * 2))
                {
                    draw_text_transformed_colour((((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9)) + random_range(1 - messagealpha[i], -1 + messagealpha[i]), 245 + (messagey[i] / 2) + random_range((1 - messagealpha[i]) + itext, -1 + messagealpha[i]), text, 1, 1, 0, c_red, c_maroon, c_red, c_maroon, 1 - messagealpha[i] - (itext / 8));
                    itext += 0.5;
                }
            }
            else if (global.eventactive == -1)
            {
                itext = 0;
                repeat (4 - (global.optimize * 2))
                {
                    draw_text_transformed_colour((((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9)) + random_range(1 - messagealpha[i], -1 + messagealpha[i]), 245 + (messagey[i] / 2) + random_range((1 - messagealpha[i]) + itext, -1 + messagealpha[i]), text, 1, 1, 0, c_red, c_maroon, c_red, c_maroon, messagealpha[i] - (itext / 8));
                    itext += 0.5;
                }
            }
            itext = 0;
            repeat (6 - (global.optimize * 3))
            {
                itext += 0.5;
                draw_text_transformed_colour((((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9)) + itext, 245 + messagey[i] + lengthdir_x(1, colorchange + (ii * 30) + (itext * 4)), text, 1, 1, 0, c_purple, c_purple, c_black, c_black, messagealpha[i] - 0.075 - (itext / 6));
            }
            draw_set_alpha(messagealpha[i]);
            draw_set_color(merge_color(c_red, c_blue, messagealpha[i]));
            draw_text_transformed((((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9) - 0.5) + messagey[i], 245 + lengthdir_x(1, colorchange + (ii * 30)), text, 1, 1, 0);
            draw_text_transformed((((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9)) + messagey[i], (245 + lengthdir_x(1, colorchange + (ii * 30))) - 0.5, text, 1, 1, 0);
            draw_text_transformed((((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9)) + messagey[i], 245 + lengthdir_x(1, colorchange + (ii * 30)) + 0.5, text, 1, 1, 0);
            draw_set_blend_mode(bm_normal);
            draw_set_alpha(1);
            draw_text_transformed_colour((((global.wview / 2) + (ii * 8.7)) - (string_length(messagecur) * 3.9)) + messagey[i], 245 + lengthdir_x(1, colorchange + (ii * 30)), text, 1, 1, 0, text_color, text_color, text_color, text_color, messagealpha[i] - 0.5);
        }
        if (string_char_at(messagecur, i) == " " && string_char_at(messagecur, i) != "#")
        {
            ii += 0.5;
        }
        else if (string_char_at(messagecur, i) != "#")
        {
            ii += 1;
        }
        mountsize = ii;
        i += 1;
    }
}
if (shadow1 > 0.05)
{
    dir += 14;
    draw_set_blend_mode(bm_subtract);
    i = 0;
    draw_set_circle_precision(14);
    repeat (28 - (global.optimize * 6))
    {
        draw_circle_color(myx[i], myy[i], (size[i] * 3) + random(0.25), merge_color(c_black, c_green, clamp(shadow0, 0, 1)), c_black, 0);
        draw_set_circle_precision(6);
        draw_circle_color(myx[i], myy[i], size[i] + random(0.75), merge_color(c_black, c_dkgray, clamp(shadow0, 0, 1)), c_black, 0);
        draw_set_circle_precision(14);
        draw_circle_color(myx[i], myy[i], size[i] + random(0.5), merge_color(c_black, c_lime, clamp(shadow0, 0, 1)), c_black, 0);
        myx[i] += lengthdir_x(myspeed[i], mydir[i]);
        myy[i] += lengthdir_y(myspeed[i], mydir[i]);
        mydir[i] += diradd[i];
        if (round(random(30)) == 2)
        {
            diradd[i] = random_range(-4, 4);
        }
        if (myx[i] < -32)
        {
            myx[i] = global.wview;
        }
        if (myy[i] < -32)
        {
            myy[i] = global.hview;
        }
        if (myx[i] > (global.wview + 16))
        {
            myx[i] = -16;
        }
        if (myy[i] > (global.hview + 16))
        {
            myy[i] = -16;
        }
        i += 1;
    }
    draw_set_circle_precision(24);
    draw_set_blend_mode(bm_add);
    draw_set_alpha(shadow0 - 0.25);
    draw_rectangle_colour(0, 0, global.wview, global.hview, merge_color(c_purple, c_black, 0.5 + lengthdir_x(0.5, dir)), merge_color(c_purple, c_black, 0.5 + lengthdir_x(0.5, dir)), merge_color(c_black, c_purple, 0.5 + lengthdir_x(0.5, dir)), merge_color(c_black, c_purple, 0.5 + lengthdir_x(0.5, dir)), 0);
    draw_set_alpha(1);
    draw_set_blend_mode(bm_subtract);
    draw_ellipse_colour(-80, -80, global.wview + 80, global.hview + 80, merge_color(c_black, c_lime, shadow0), merge_color(c_black, c_purple, shadow1), 0);
    draw_ellipse_colour(-80, -80, global.wview + 80, global.hview + 80, merge_color(c_black, c_white, shadow0), merge_color(c_black, c_white, shadow1), 0);
    draw_rectangle_colour(0, 0, global.wview / 2, global.hview, merge_color(c_black, c_lime, shadow0), c_black, c_black, merge_color(c_black, c_lime, shadow0), 0);
    draw_rectangle_colour(global.wview / 2, 0, global.wview, global.hview, c_black, merge_color(c_black, c_lime, shadow0), merge_color(c_black, c_lime, shadow0), c_black, 0);
    draw_set_blend_mode(bm_normal);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
