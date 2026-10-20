d3d_set_projection_ortho(0, 0, view_wview[0] * 2, view_hview[0] * 2, 0);
if (coldir < 180)
{
    coldir += 2;
}
if (coldir < 90)
{
    coldir += 3;
}
if (coldir <= 90)
{
    color = merge_color(c_black, merge_color(c_white, c_fuchsia, abs(lengthdir_y(1, coldir))), abs(lengthdir_y(1, coldir)));
}
if (coldir > 90)
{
    color = merge_color(c_fuchsia, c_aqua, abs(lengthdir_x(1, coldir)));
}
dir += 0.25;
color2 = 0;
color1 = merge_color(c_black, merge_color(merge_color(c_fuchsia, c_aqua, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_red, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.75 + lengthdir_y(0.25, dir * 1.73));
global.color3 = merge_color(merge_color(merge_color(c_blue, c_red, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_yellow, 0.125 + lengthdir_y(0.125, dir * 1.73)), merge_color(c_white, c_fuchsia, 0.5 + lengthdir_x(0.3, dir)), 0.5 + lengthdir_x(0.5, dir * 2.33));
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_rectangle_color(-20, -20, view_wview[0] + 20, view_hview[0] + 20, color1, color1, color2, color2, 0);
view_angle[0] = lengthdir_y(3, dir * 3.33);
draw_set_blend_mode(bm_subtract);
draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), c_black, c_aqua, 0);
draw_set_blend_mode(bm_normal);
draw_set_color(c_black);
draw_rectangle(-1, -1, view_wview[0] + 1, 12, false);
draw_rectangle(-1, view_hview[0] + 1, view_wview[0] + 1, view_hview[0] - 14, false);
if (state == 0)
{
    if (startx > 16)
    {
        startx -= 16;
        draw_sprite_ext(splDennatonPieces, 0, (view_wview[0] / 2) + startx, view_hview[0] / 2, 1, 1, 0, image_blend, alpha);
        draw_sprite_ext(splDennatonPieces, 1, (view_wview[0] / 2) - startx, view_hview[0] / 2, 1, 1, 0, image_blend, alpha);
    }
    else
    {
        audio_play_sound(sndSplashFace, 0, false);
        state = 1;
    }
}
index2 += 0.2;
if (state > 0)
{
    i = 0;
    repeat (4)
    {
        draw_sprite_ext(splBullet, index2 + (i * 3), (view_wview[0] / 2) - (3 * i * factor1), (view_hview[0] / 2) + (3 * i * factor1), (1 + (i * 0.1)) * factor1, (1 + (i * 0.1)) * factor1, 15 + (i * 25 * factor1), image_blend, alpha);
        draw_sprite_ext(splBullet, index2 + (i * 3), (view_wview[0] / 2) + (3 * i * factor1), (view_hview[0] / 2) + (3 * i * factor1), (1 + (i * 0.1)) * factor1, (1 + (i * 0.1)) * factor1, -(15 + (i * 25 * factor1)), image_blend, alpha);
        i += 1;
    }
    if (index3 < 12 && index3 > 0)
    {
        draw_sprite_ext(splWaveComing, index3, (view_wview[0] / 2) - 1, view_hview[0] / 2, 1, 1, 0, c_black, alpha);
        draw_sprite_ext(splWaveComing, index3, (view_wview[0] / 2) + 1, view_hview[0] / 2, 1, 1, 0, c_black, alpha);
        draw_sprite_ext(splWaveComing, index3, view_wview[0] / 2, (view_hview[0] / 2) - 1, 1, 1, 0, c_black, alpha);
        draw_sprite_ext(splWaveComing, index3, view_wview[0] / 2, (view_hview[0] / 2) + 1, 1, 1, 0, c_black, alpha);
        draw_sprite_ext(splWaveComing, index3, view_wview[0] / 2, view_hview[0] / 2, 1, 1, 0, image_blend, alpha);
    }
    if (index3 == 0)
    {
        if (index4 < 19)
        {
            index4 += 0.5;
        }
        draw_sprite_ext(splSplashShift, index4, view_wview[0] / 2, view_hview[0] / 2, 1, 1, 0, image_blend, alpha);
    }
    if (factor2 > 0)
    {
        draw_sprite_ext(splSpeaker, 0, (view_wview[0] / 2) - (factor2 * 4), (view_hview[0] / 2) + 10, factor2, factor2, factor2 * 12, image_blend, alpha);
        draw_sprite_ext(splSpeaker, 0, (view_wview[0] / 2) + (factor2 * 4), (view_hview[0] / 2) + 10, -factor2, factor2, -factor2 * 12, image_blend, alpha);
    }
    addx = (-index1 * 0.25) + random(index1 * 0.5);
    addy = (-index1 * 0.25) + random(index1 * 0.5);
    draw_sprite_ext(splDennatonFlash, index1, (view_wview[0] / 2) + addx, ((view_hview[0] / 2) + addy) - 1, 1, 1, 0, c_black, alpha);
    draw_sprite_ext(splDennatonFlash, index1, (view_wview[0] / 2) + addx, (view_hview[0] / 2) + addy + 1, 1, 1, 0, c_black, alpha);
    draw_sprite_ext(splDennatonFlash, index1, (view_wview[0] / 2) + addx + 1, (view_hview[0] / 2) + addy, 1, 1, 0, c_black, alpha);
    draw_sprite_ext(splDennatonFlash, index1, ((view_wview[0] / 2) + addx) - 1, (view_hview[0] / 2) + addy, 1, 1, 0, c_black, alpha);
    draw_sprite_ext(splDennatonFlash, index1, (view_wview[0] / 2) + addx, (view_hview[0] / 2) + addy, 1, 1, 0, image_blend, alpha);
    if (index1 > 0)
    {
        index1 -= 0.5;
    }
    else
    {
        if (state == 2 && factor2 > 0.65)
        {
            state = 3;
            audio_play_sound(sndSplashWave, 0, false);
        }
        if (factor2 < 1)
        {
            factor2 += 0.05;
        }
        else
        {
            if (state == 3)
            {
                audio_play_sound(sndSplashLogo, 0, false);
                state = 4;
            }
            if (index3 > 0)
            {
                index3 -= 1;
            }
            if (index5 < 16)
            {
                index5 += 0.25;
            }
            if (index6 < 37.6)
            {
                index6 += 0.7;
            }
        }
    }
    if (state == 1)
    {
        audio_play_sound(sndSplashAmmo, 0, false);
        state = 2;
    }
    if (factor1 < 1)
    {
        factor1 += 0.03;
    }
}
if (factor2 >= 1)
{
    draw_sprite_ext(splDennatonTitle, index5, view_wview[0] / 2, (view_hview[0] / 2) + 29, 1, 1, 0, image_blend, alpha);
    draw_sprite_ext(splGames, index6, (view_wview[0] / 2) - 1, (view_hview[0] / 2) + 41, 1, 1, 0, c_black, alpha);
    draw_sprite_ext(splGames, index6, (view_wview[0] / 2) + 1, (view_hview[0] / 2) + 41, 1, 1, 0, c_black, alpha);
    draw_sprite_ext(splGames, index6, view_wview[0] / 2, (view_hview[0] / 2) + 41 + 1, 1, 1, 0, c_black, alpha);
    draw_sprite_ext(splGames, index6, view_wview[0] / 2, ((view_hview[0] / 2) + 41) - 1, 1, 1, 0, c_black, alpha);
    draw_sprite_ext(splGames, index6, view_wview[0] / 2, (view_hview[0] / 2) + 41, 1, 1, 0, merge_color(c_white, c_red, index6 * 0.02631578947368421), alpha);
}
if (index5 >= 16 || fade == 1)
{
    if (wait > 0)
    {
        wait -= 1;
    }
    if (wait <= 0 || fade == 1)
    {
        if (amount > 0)
        {
            amount -= 10;
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
        if (amount == 0)
        {
            if (state == 4)
            {
                audio_play_sound(sndNoise, 0, false);
                state = 5;
            }
            draw_sprite_tiled(sprNoise, index2 * 2.5, 0, 0);
            if (wait2 > 0)
            {
                wait2 -= 1;
            }
            else
            {
                audio_stop_sound(sndNoise);
                room_goto_next();
            }
        }
    }
}
d3d_set_projection_ortho(0, 0, view_wview[0] * 2, view_hview[0] * 2, 0);
draw_set_blend_mode(bm_subtract);
my_y = random(32);
draw_sprite_tiled(sprScanlines, 0, 0, my_y);
draw_set_blend_mode(bm_normal);
