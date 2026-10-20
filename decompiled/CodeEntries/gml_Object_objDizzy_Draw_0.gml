d3d_set_projection_ortho(0, 0, view_wport, view_hport, 0);
if (global.hardmode == 1)
{
    d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 180);
}
dir += (1 + (dizziness * 2));
h1 += ((-10 + random(20)) * dizziness);
h2 += ((-10 + random(20)) * dizziness);
myx1 += ((dizziness - random(dizziness * 2)) * 2);
myx2 += ((dizziness - random(dizziness * 2)) * 2);
myy1 += ((dizziness - random(dizziness * 2)) * 2);
myy2 += ((dizziness - random(dizziness * 2)) * 2);
if (dizziness > 0.1)
{
    dizziness -= 0.005;
}
if (h1 > 255)
{
    h1 -= 255;
}
if (h2 > 255)
{
    h2 -= 255;
}
if (h1 < 0)
{
    h1 += 255;
}
if (h2 < 0)
{
    h2 += 255;
}
scrScreenFilterEffector();
draw_set_blend_mode(bm_add);
draw_circle_color(view_wport / 2, view_hport / 2, view_wport * 2.5, c_black, make_color_hsv(0, 0, 255 * dizziness * 0.5), 0);
noiseindex += 0.25;
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
alpha += (0.05 - random(0.1));
if (alpha > 1)
{
    alpha = 1;
}
if (alpha < 0)
{
    alpha = 0;
}
draw_set_blend_mode(bm_subtract);
draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 480 + random(24), merge_color(c_black, merge_color(c_aqua, make_color_rgb(random(255), random(255), random(255)), random(0.5)), dizziness * 0.5), merge_color(merge_color(c_aqua, c_teal, random(0.5)), c_white, dizziness * 0.5), 0);
if (global.hardmode == 0)
{
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 480 + random(24), c_black, merge_color(c_black, c_white, dizziness * 0.5), 0);
}
else
{
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 480 + random(24), merge_color(c_black, c_gray, dizziness * 0.5), merge_color(merge_color(c_white, c_gray, 0.3), c_white, dizziness * 0.5), 0);
}
d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
draw_set_blend_mode(bm_subtract);
if (instance_exists(objLightingEngineMorgue))
{
    draw_circle_color(global.wview / 2, global.hview / 2, 350, c_black, make_colour_rgb(250, 220, 10), 0);
    draw_set_blend_mode(bm_subtract);
    aimfar = keyboard_check_direct(vk_shift);
    fade = merge_color(c_black, c_white, clamp(point_distance(objEffectorHospital.x, objEffectorHospital.y, objPlayer.x, objPlayer.y) / 380 / 2, 0, 1));
    fade1 = merge_color(c_black, c_white, clamp(point_distance(objEffectorHospital.x, objEffectorHospital.y, objPlayer.x, objPlayer.y) / 380, 0, 1));
    my_x = random_range(-16, 16);
    my_y = random_range(-16, 16);
    draw_sprite_tiled_ext(sprNoise, noiseindex, -my_x, -my_y, 0.5 + random(0.5), 1 + random(0.5), merge_color(c_black, c_purple, objPlayer.alphaundead), 1);
    global.shake = objPlayer.alphaundead;
    draw_circle_color(global.wview / 2, global.hview / 2, 260, merge_color(c_black, make_colour_rgb(0, 129, 120), objPlayer.alphaundead), merge_color(c_black, make_colour_rgb(0, 129, 120), objPlayer.alphaundead), 0);
    if (aimfar)
    {
        draw_circle_color(global.wview / 2, global.hview / 2, 350, fade1, fade, 0);
    }
    draw_set_blend_mode(bm_normal);
}
d3d_set_projection_ortho(view_xview[0], view_yview[0], view_wview[0], view_hview[0], 0);
draw_set_blend_mode(bm_subtract);
my_x = random(32);
my_y = random(32);
i = 0;
repeat (6)
{
    draw_sprite_tiled_ext(sprHLM2Noise, noiseindex, -my_x, -my_y, 0.25, 0.25, merge_color(c_dkgray, c_white, dizziness * 0.5), 0);
    i += 1;
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_blend_mode(bm_normal);
with (objEffectorHospital)
{
    global.dir += 1;
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
            draw_rectangle_color(-10, -10, view_wview[0] + 10, view_hview[0] + 10, color1, color2, color2, color1, 0);
            draw_set_blend_mode(bm_normal);
            if (instance_exists(objPlayer))
            {
                view_xview[0] = objPlayer.x + 100;
                view_yview[0] = objPlayer.y + 100;
            }
        }
        else
        {
            start = 0;
            show_date = 0;
        }
    }
    if (fade == 1)
    {
        if (amount > 0)
        {
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
                game_restart();
            }
            else if (next == 1)
            {
                if (newsong == 1)
                {
                    sxeasy_stop(1);
                    if (room == rmDream1)
                    {
                        sxeasy_setVolume(0);
                    }
                    sxeasy_play(song);
                }
                if (nextroom == 161)
                {
                    sxeasy_play(global.SilentNeighbors);
                }
                if (nextroom == 126 && global.hospitalelevator == 0)
                {
                    sxeasy_play(global.Flatline);
                    audio_sound_gain(global.currentsong, clamp(global.mvol, 0, 1), 0);
                }
                if (global.hospitalelevator == 0 && instance_exists(objPlayer))
                {
                    if (room == rmHospitalEntrance)
                    {
                        objPlayer.x = 128;
                        objPlayer.y = 116;
                        objPlayer.changeroom = 1;
                    }
                    else
                    {
                        objPlayer.x = 752;
                        objPlayer.y = 502;
                        objPlayer.changeroom = 1;
                    }
                }
                next = 0;
                room_goto(nextroom);
            }
            else
            {
                global.skipdata = 2;
                room_set_persistent(room, 0);
                room_persistent = false;
                room_goto(room);
            }
        }
    }
    coldir += 1;
    if (show_date == 1)
    {
        text = "JUL 21ST, 1989#MIAMI, FLORIDA";
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
    draw_set_blend_mode(bm_subtract);
    draw_sprite_tiled(sprScanlines, 0, my_y, my_y);
    my_y = random(32);
    draw_set_blend_mode(bm_subtract);
    draw_set_blend_mode(bm_normal);
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
        draw_sprite_tiled_ext(sprNoise, global.dir * 0.5, 0, 0, 2, 2, c_white, 1);
    }
    if (blackout > 0)
    {
        if (!audio_is_playing(sndMadnessNoise) && !audio_is_playing(sndPhoneReverb))
        {
            audio_play_sound(sndMadnessNoise, 0, false);
        }
        blackout -= 1;
        draw_circle_color(global.wview / 2, global.hview / 2, 350, c_black, c_black, 0);
    }
    else
    {
        audio_stop_sound(sndMadnessNoise);
    }
}
screen_refresh();
if (round(random(100)) == 2)
{
    myx1 = (-dizziness * 20) + random(dizziness * 40);
}
if (round(random(100)) == 2)
{
    myx2 = (-dizziness * 20) + random(dizziness * 40);
}
if (round(random(100)) == 2)
{
    myy1 = (-dizziness * 20) + random(dizziness * 40);
}
if (round(random(100)) == 2)
{
    myy2 = (-dizziness * 20) + random(dizziness * 40);
}
