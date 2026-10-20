texture_set_interpolation(true);
if (global.locked == 1)
{
    draw_sprite_ext(sprSplashScreenFail, 0, 0, 0, 1, 1, 0, c_white, 1);
    soundlogo = 147;
    colorlogo0 = 128;
    colorlogo1 = 255;
}
else
{
    draw_sprite_ext(sprSplashScreen, 0, 0, 0, 1, 1, 0, c_white, 1);
    colorlogo0 = 8388608;
    colorlogo1 = 8421376;
}
texture_set_interpolation(false);
if (stage == 1)
{
    shadow = lerp(shadow, 1, 0.15);
    draw_set_blend_mode(bm_subtract);
    draw_circle_colour(view_wview[0] / 2, view_hview[0] / 2, 1850, c_black, merge_color(c_black, c_white, shadow), 0);
    draw_rectangle_color(-10, -10, view_wview[0] + 10, view_hview[0] + 10, c_black, c_black, merge_color(c_black, c_white, shadow), merge_color(c_black, c_white, shadow), 0);
    draw_set_blend_mode(bm_normal);
    if (shadow >= 0.85)
    {
        alphalogo = lerp(alphalogo, 1, 0.15);
        ylogo = lerp(ylogo, 250, 0.15);
        if (sound == 0)
        {
            audio_play_sound(soundlogo, 0, false);
            sound = 1;
        }
        anglelogo = lerp(anglelogo, 0, 0.1);
        if (alphalogo >= 0.9)
        {
            alphalogo1 = lerp(alphalogo1, 1, 0.05);
        }
    }
}
if (alphalogo >= 1)
{
    dir += 0.15;
}
i = 0;
ii = 1;
draw_set_blend_mode(bm_add);
repeat (12)
{
    i += 1;
    ii += 0.3;
    draw_sprite_ext(sprLogoSuperRR, 0, view_wview[0] / 2, (view_hview[0] / 2) + ylogo + (i * ii), 4 - (i / 48), 4 - (i / 48), 0, merge_color(colorlogo0, merge_color(colorlogo1, colorlogo0, 0.35), 0.5 + lengthdir_x(0.5, (dir * 18) + (i * 38))), alphalogo1 - 0.075 - (i / 12));
}
draw_set_alpha(alphalogo / 2);
draw_circle_colour(view_wview[0] / 2, (view_hview[0] / 2) + ylogo + 1, 275 + random(0.15), merge_color(merge_color(c_orange, c_red, 0.5), c_black, 0.95), c_black, 0);
draw_circle_colour(view_wview[0] / 2, (view_hview[0] / 2) + ylogo + 1, 150 + random(0.25), merge_color(merge_color(c_orange, c_red, 0.5), c_black, 0.75), c_black, 0);
draw_circle_colour(view_wview[0] / 2, (view_hview[0] / 2) + ylogo + 1, 70 + random(0.75), c_dkgray, c_black, 0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprLogoSuperRR, 0, view_wview[0] / 2, ((view_hview[0] / 2) + ylogo) - 2, 4, 4, anglelogo, c_maroon, alphalogo);
draw_sprite_ext(sprLogoSuperRR, 0, view_wview[0] / 2, (view_hview[0] / 2) + ylogo + 2, 4, 4, anglelogo, c_orange, alphalogo);
draw_sprite_ext(sprLogoSuperRR, 0, view_wview[0] / 2, (view_hview[0] / 2) + ylogo, 4, 4, anglelogo, c_red, alphalogo);
draw_set_blend_mode(bm_add);
draw_set_alpha(alphalogo / 4);
draw_circle_colour(view_wview[0] / 2, (view_hview[0] / 2) + ylogo + 1, 275 + random(0.15), merge_color(merge_color(c_orange, c_red, 0.5), c_black, 0.95), c_black, 0);
draw_circle_colour(view_wview[0] / 2, (view_hview[0] / 2) + ylogo + 1, 150 + random(0.25), merge_color(merge_color(c_orange, c_red, 0.5), c_black, 0.75), c_black, 0);
draw_circle_colour(view_wview[0] / 2, (view_hview[0] / 2) + ylogo + 1, 70 + random(0.75), c_dkgray, c_black, 0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
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
    }
    else if (global.locked == 1)
    {
        game_end();
    }
    else
    {
        room_goto_next();
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
