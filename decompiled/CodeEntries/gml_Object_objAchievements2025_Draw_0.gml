dirBackGround += 0.15;
view_angle[0] = lengthdir_y(0.75, dirBackGround * 3.5);
if (CompleteAllAchievements == 0)
{
    colorAchievementWhore = 16777215;
    ymoon = yMoonStart + lengthdir_x(5, dirBackGround);
    colormoon2 = 16777215;
    colormoon1 = merge_color(make_colour_rgb(238, 200, 200), make_colour_rgb(236, 213, 203), 0.5 + lengthdir_x(0.5, dirBackGround * 3));
    color5 = make_colour_rgb(252, 0, 0);
    color4 = make_colour_rgb(227, 42, 87);
    color3 = merge_color(make_colour_rgb(204, 132, 108), make_colour_rgb(204, 171, 108), 0.5 + lengthdir_x(0.5, dirBackGround * 3));
    color2 = merge_color(make_colour_rgb(224, 171, 182), make_colour_rgb(220, 179, 175), 0.5 + lengthdir_x(0.5, dirBackGround * 2));
    color1 = make_colour_rgb(203, 63, 104);
    colorwater1 = merge_color(make_colour_rgb(46, 30, 144), make_colour_rgb(73, 26, 136), 0.5 + lengthdir_x(0.5, dirBackGround * 2));
    colorwater0 = merge_color(make_colour_rgb(126, 103, 161), make_colour_rgb(135, 101, 152), 0.5 + lengthdir_x(0.5, dirBackGround * 2));
    color0 = make_colour_rgb(197, 131, 96);
    color1s = merge_color(c_red, c_purple, 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    color2s = merge_color(c_purple, c_orange, 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    colorTextShadow = merge_color(merge_color(color2s, c_black, 0.5), merge_color(color1s, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    colorTextDescriptionsShadow = merge_color(merge_color(c_orange, c_black, 0.5), merge_color(c_red, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    colorTextDescriptions = merge_color(c_olive, c_red, 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    colorTextDescriptions1 = merge_color(c_yellow, c_orange, 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    colorclouds2 = merge_color(make_colour_rgb(250, 211, 211), make_colour_rgb(242, 195, 211), 0.5 + lengthdir_x(0.5, dirBackGround));
    colorclouds1 = merge_color(make_colour_rgb(208, 135, 140), make_colour_rgb(210, 126, 155), 0.5 + lengthdir_x(0.5, dirBackGround));
    colorachtextShadow = colorTextShadow;
    colorachtext = color1s;
    colorachtext1 = color2s;
    speedComplete = 38;
    alphaShine = 0.25 - (image_alpha / 4);
}
if (CompleteAllAchievements == 1)
{
    colorAchievementWhore = 0;
    ymoon = 0;
    colormoon2 = 16777215;
    colormoon1 = merge_color(make_colour_rgb(255, 224, 91), make_colour_rgb(250, 176, 98), 0.5 + lengthdir_x(0.5, dirBackGround * 3));
    color5 = make_colour_rgb(253, 59, 0);
    color4 = make_colour_rgb(227, 109, 41);
    color3 = merge_color(make_colour_rgb(204, 132, 108), make_colour_rgb(204, 171, 108), 0.5 + lengthdir_x(0.5, dirBackGround * 3));
    color2 = merge_color(make_colour_rgb(245, 98, 0), make_colour_rgb(245, 180, 0), 0.5 + lengthdir_x(0.5, dirBackGround * 2));
    color1 = make_colour_rgb(245, 208, 130);
    colorwater1 = merge_color(make_colour_rgb(255, 206, 176), make_colour_rgb(222, 255, 176), 0.5 + lengthdir_x(0.5, dirBackGround * 2));
    colorwater0 = merge_color(make_colour_rgb(204, 103, 53), make_colour_rgb(65, 161, 151), 0.5 + lengthdir_x(0.5, dirBackGround * 2));
    color0 = make_colour_rgb(197, 131, 96);
    color1s = merge_color(c_red, c_purple, 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    color2s = merge_color(c_purple, c_orange, 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    colorTextShadow = merge_color(merge_color(color2s, c_black, 0.5), merge_color(color1s, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    colorTextDescriptionsShadow = merge_color(merge_color(c_orange, c_black, 0.5), merge_color(c_red, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    colorTextDescriptions = merge_color(c_olive, c_red, 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    colorTextDescriptions1 = merge_color(c_yellow, c_orange, 0.5 + lengthdir_x(0.5, dirBackGround * 4));
    colorclouds2 = merge_colour(c_white, color1, 0.8);
    colorclouds1 = merge_colour(c_white, color2, 0.8);
    colorachtextShadow = merge_color(merge_color(c_maroon, c_black, 0.5), merge_color(c_green, c_black, 0.5), clamp(CompleteAchievements / array_length_1d(global.ach_title), 0, 1));
    colorachtext = merge_color(merge_color(c_white, c_maroon, 0.5 + lengthdir_x(0.5, dirBackGround * 8)), merge_color(c_white, c_green, 0.5 + lengthdir_x(0.5, dirBackGround * 8)), clamp(CompleteAchievements / array_length_1d(global.ach_title), 0, 1));
    colorachtext1 = merge_color(c_red, c_lime, clamp(CompleteAchievements / array_length_1d(global.ach_title), 0, 1));
    speedComplete = 12;
    alphaShine = 0.08333333333333333 - (image_alpha / 12);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_rectangle_color(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - 34 - 33, color2, color2, color1, color1, 0);
draw_set_blend_mode(bm_add);
draw_rectangle_color(0, room_height - 79, room_width, room_height, c_black, c_black, color0, color0, 0);
draw_set_alpha(0.3);
draw_set_blend_mode(bm_subtract);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, secretBo, make_colour_rgb(secretBoColor[1], secretBoColor[1], secretBoColor[1]), make_colour_rgb(secretBoColor[0], secretBoColor[0], secretBoColor[0]), 0);
draw_set_blend_mode(bm_add);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 100 + 24 + ymoon, 175, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 100 + 24 + ymoon, 175, color4, c_black, 0);
draw_set_alpha(0.025);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, 118.99999999999999, color5, c_black, 0);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, 101.5, color5, c_black, 0);
draw_set_alpha(0.225);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, 94.5, color4, c_black, 0);
draw_set_alpha(0.825);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, 75, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, 82 + random(4), color4, c_black, 0);
draw_set_alpha(0.525);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, 82 + random(8), color4, c_black, 0);
draw_set_blend_mode_ext(12, 19);
i = 0;
repeat (6)
{
    draw_sprite_general(sprScoreClouds, cloudindex[i], 0, 0, sprite_get_width(sprScoreClouds), sprite_get_width(sprScoreClouds), cloudx[i], cloudy[i], cloudscale[i], cloudscale[i], 0, colorclouds2, colorclouds2, colorclouds1, colorclouds1, 1.25 - cloudalpha[i]);
    cloudx[i] -= cloudspeed[i];
    cloudalpha[i] = abs((view_wview[0] / 2) - cloudx[i]) / 226.5;
    if (cloudx[i] <= -220)
    {
        cloudx[i] = room_width + 105;
        cloudindex[i] = round(random(1));
        cloudspeed[i] = 0.2 + random(0.2);
        cloudy[i] = (room_height - 220) + irandom_range(-10, 10);
        cloudscale[i] = 1 + irandom_range(-0.15, 0.15);
        cloudalpha[i] = abs((view_wview[0] / 2) - cloudx[i]) / 226.5;
    }
    i += 1;
}
draw_set_blend_mode(bm_add);
ii = 0;
repeat (32)
{
    length = (room_width / 2.5) + lengthdir_x(32, dirBackGround + (ii * 2));
    draw_line_width_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, (view_wview[0] / 2) + lengthdir_x(length * 1.25, dirBackGround + (ii * 11.25)), ((view_hview[0] / 2) + 24 + ymoon) - lengthdir_y(length, dirBackGround + (ii * 11.25)), 45, merge_color(color1, c_black, 0.9), c_black);
    ii += 1;
}
draw_set_blend_mode(bm_normal);
draw_sprite_general(sprBigMoon, image_index, 0, 0, 160, 160, (room_width / 2) - 55.3, ((room_height / 2) - 56) + 24 + ymoon, 0.7, 0.7, 0, colormoon2, colormoon2, colormoon1, colormoon1, 1);
draw_set_blend_mode(bm_add);
draw_rectangle_colour(0, 170, room_width, room_height, c_black, c_black, c_white, c_white, 0);
draw_set_alpha(0.5 - (CompleteAllAchievements / 4));
draw_circle_color((view_wview[0] / 2) - 0.5, (view_hview[0] / 2) + 23.5 + ymoon, 56, c_white, c_black, 0);
draw_set_alpha(0.4);
draw_rectangle_color(0, room_height - 56 - 12, room_width, room_height - 75, colorwater1, colorwater1, colorwater0, colorwater0, 0);
draw_set_alpha(0.8);
draw_rectangle_color(0, room_height - 56 - 12, room_width, room_height - 72, colorwater1, colorwater1, colorwater0, colorwater0, 0);
draw_set_alpha(1);
draw_rectangle_color(0, room_height - 56 - 12, room_width, room_height, colorwater1, colorwater1, colorwater0, colorwater0, 0);
draw_set_alpha(0.8);
draw_rectangle_color(0, room_height - 109 - 12, room_width, room_height, c_black, c_black, c_dkgray, c_dkgray, 0);
draw_set_alpha(1);
draw_set_blend_mode(bm_subtract);
draw_rectangle_colour(0, room_height - 59, room_width, room_height + 8, c_black, c_black, c_white, c_white, 0);
draw_set_blend_mode(bm_add);
draw_set_alpha(0.15);
draw_rectangle_color(0, room_height - 56 - 12, room_width, room_height, c_white, c_white, c_navy, c_navy, 0);
draw_set_alpha(1);
draw_set_blend_mode(bm_subtract);
draw_circle_color(room_width / 2, room_height / 2, (room_width * 0.8) + random(10), merge_color(make_colour_rgb(0, 43, 156), c_black, 0.9), merge_color(make_colour_rgb(47, 253, 136), make_colour_rgb(189, 194, 40), 0.5 + lengthdir_x(0.5, dirBackGround * 2)), 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], view_angle[0]);
with (objWave)
{
    image_xscale = 1 + (y * 0.02);
    if (y > 0)
    {
        image_yscale = y * 0.008;
    }
    else
    {
        image_yscale = 0;
    }
    if (y < 0)
    {
        colorwave = 0;
        image_blend = c_black;
    }
    else
    {
        colorwave = merge_color(c_black, c_white, (y * 1) / ((room_height / 3) + 100));
        image_blend = merge_color(c_white, objAchievements2025.colorwater0, (y * 1) / (room_height - 52));
    }
    draw_set_blend_mode(bm_add);
    draw_rectangle_color(0, (room_height / 2) + 30 + 29 + (y * 0.5), room_width, (room_height / 2) + 30 + 29 + (y * 0.5 * image_xscale), c_black, c_black, colorwave, colorwave, 0);
    draw_set_alpha(0.5);
    draw_rectangle_color(0, (room_height / 2) + 30 + 29 + (y * 0.5), room_width, (room_height / 2) + 30 + 29 + (y * 0.5 * image_xscale), c_black, c_black, colorwave, colorwave, 0);
    draw_set_alpha(1);
    draw_set_blend_mode(bm_normal);
    i = 0;
    repeat (6)
    {
        draw_sprite_ext(sprite_index, index[i] + 1, x + (i * sprite_get_width(sprite_index) * 0.5 * image_xscale), (room_height / 2) + 61.5 + (y * 0.5 * image_xscale), image_xscale, image_yscale, image_angle, image_blend, 0.5);
        draw_sprite_ext(sprite_index, index[i] + 1, x - (i * sprite_get_width(sprite_index) * 0.5 * image_xscale), (room_height / 2) + 61.5 + (y * 0.5 * image_xscale), image_xscale, image_yscale, image_angle, image_blend, 0.5);
        draw_sprite_ext(sprite_index, index[i], x + (i * sprite_get_width(sprite_index) * 0.5 * image_xscale), (room_height / 2) + 61 + (y * 0.5 * image_xscale), image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprite_index, index[i], x - (i * sprite_get_width(sprite_index) * 0.5 * image_xscale), (room_height / 2) + 61 + (y * 0.5 * image_xscale), image_xscale, image_yscale, image_angle, image_blend, 0.75);
        index[i] += 0.1;
        i += 1;
    }
    if (y < room_height)
    {
        y += 0.25;
    }
    else
    {
        y = -30;
    }
}
draw_set_blend_mode_ext(0, bm_src_color);
draw_circle_color(room_width / 2, room_height / 2, 310 - random_range(5, -5), c_white, merge_color(color2s, c_white, 0.5), 0);
draw_set_blend_mode(bm_add);
draw_sprite_tiled_ext(sprNoise, dirBackGround * 0.5, 0, 0, 1 + random(1), 1 + random(1), c_white, (secretBo - 279.98) + random(0.05));
draw_set_blend_mode_ext(bm_dest_color, bm_inv_src_alpha);
draw_circle_colour(room_width / 2, room_height / 2, 530 + random(25), c_white, merge_color(c_olive, c_orange, 0.5 + lengthdir_x(0.5, dirBackGround * 12)), 0);
draw_set_blend_mode(bm_normal);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], lengthdir_x(2, dirBackGround * 1.25));
draw_sprite_general(sprPalmTrees, 3, 0, 0, 127, 277, 336, lengthdir_x(3, dirBackGround * 1.5) + islandStart, 1, 1, 0, c_black, c_black, c_black, c_black, 1);
draw_set_blend_mode(bm_add);
draw_sprite_general(sprPalmTrees, 3, 0, 0, 127, 277, 336, lengthdir_x(3, dirBackGround * 1.5) + islandStart, 1, 1, 0, merge_colour(merge_colour(c_lime, c_green, 0.5), c_green, clamp(lengthdir_y(1, dirBackGround), 0, 1)), merge_colour(merge_colour(c_lime, c_green, 0.5), c_green, clamp(lengthdir_y(1, dirBackGround), 0, 1)), c_black, c_black, 1);
draw_sprite_general(sprPalmTrees, 3, 0, 0, 127, 277, 336, lengthdir_x(3, dirBackGround * 1.5) + islandStart, 1, 1, 0, color4, c_black, c_black, c_black, 1);
draw_set_blend_mode(bm_normal);
draw_set_alpha(0.85);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], -lengthdir_x(2, dirBackGround * 1.25));
draw_sprite_general(sprPalmTrees, 2, 0, 0, 127, 277, 0, -lengthdir_x(3, dirBackGround * 1.5) + islandStart, 1, 1, 0, c_black, c_black, c_black, c_black, 1);
draw_set_blend_mode(bm_add);
draw_sprite_general(sprPalmTrees, 2, 0, 0, 127, 277, 0, -lengthdir_x(3, dirBackGround * 1.5) + islandStart, 1, 1, 0, merge_colour(merge_colour(c_lime, c_green, 0.5), c_green, clamp(lengthdir_y(1, dirBackGround), 0, 1)), merge_colour(merge_colour(c_lime, c_green, 0.5), c_green, clamp(lengthdir_y(1, dirBackGround), 0, 1)), c_black, c_black, 1);
draw_sprite_general(sprPalmTrees, 2, 0, 0, 127, 277, 0, -lengthdir_x(3, dirBackGround * 1.5) + islandStart, 1, 1, 0, c_black, color4, c_black, c_black, 1);
draw_set_blend_mode(bm_normal);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_blend_mode(bm_add);
draw_set_alpha(0.85);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
draw_sprite_general(sprMountain, 1, 0, 0, 480, 79, 0, 174 + (islandStart / 1.5), 1, 1, 0, merge_colour(c_yellow, c_orange, clamp(lengthdir_y(1, dirBackGround), 0.4, 1)), merge_colour(c_yellow, c_orange, clamp(lengthdir_y(1, dirBackGround), 0.4, 1)), merge_colour(c_black, c_purple, 0.05), merge_colour(c_black, c_purple, 0.05), 1);
draw_sprite_general(sprMountain, 0, 0, 0, 480, 79, 0, 177 + (islandStart / 2), 1, 1, 0, merge_colour(c_orange, c_yellow, clamp(lengthdir_y(1, dirBackGround), 0.4, 1)), merge_colour(c_orange, c_yellow, clamp(lengthdir_y(1, dirBackGround), 0.4, 1)), merge_colour(c_black, c_purple, 0.15), merge_colour(c_black, c_purple, 0.15), 1);
draw_set_blend_mode(bm_subtract);
i = 0;
dir -= 1;
Yachievements = 0;
draw_rectangle_colour(0, 0, room_width, room_height / 2, make_colour_rgb(slideshadow[1], slideshadow[1], slideshadow[1]), make_colour_rgb(slideshadow[1], slideshadow[1], slideshadow[1]), c_black, c_black, 0);
draw_rectangle_colour(0, room_height / 2, room_width, room_height, c_black, c_black, make_colour_rgb(slideshadow[0], slideshadow[0], slideshadow[0]), make_colour_rgb(slideshadow[0], slideshadow[0], slideshadow[0]), 0);
draw_set_blend_mode(bm_subtract);
draw_rectangle_colour(67 + XdescriptionMenu, 154, 600, 213 + YdescriptionMenu, c_gray, c_gray, c_black, c_black, 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(image_alpha);
repeat (array_length_1d(global.ach_title))
{
    if (select <= (i + 3) && select >= (i - 3))
    {
        draw_set_blend_mode(bm_subtract);
        if (select == i)
        {
            ii = 0;
            repeat (6)
            {
                draw_rectangle_color(0, 109 + Yachievements + scroll + (ii * 4), view_wview[0], 112 + Yachievements + scroll + (ii * 4), c_black, merge_color(c_black, make_colour_rgb(shadow, shadow, shadow), image_alpha), merge_color(c_black, make_colour_rgb(shadow, shadow, shadow), image_alpha), c_black, 0);
                ii += 1.5;
            }
            draw_circle_colour(49 + Xachievements[i], 128 + Yachievements + scroll + slideimpact, 28 + lengthdir_x(1, dir * 1.25), merge_color(c_black, c_white, image_alpha), c_black, 0);
        }
        else
        {
            ii = 0;
            repeat (6)
            {
                draw_rectangle_color(0, 109 + Yachievements + Ydescription[i] + scroll + (ii * 4), view_wview[0], 112 + Yachievements + Ydescription[i] + scroll + (ii * 4), c_black, merge_color(c_black, c_dkgray, image_alpha), merge_color(c_black, c_dkgray, image_alpha), c_black, 0);
                ii += 1.5;
            }
        }
        draw_rectangle_colour(20 + Xachievements[i], 104 + Yachievements + Ydescription[i] + scroll, 600 + Xachievements[i], 151 + Yachievements + Ydescription[i] + scroll, c_black, c_black, merge_color(c_black, c_white, image_alpha), merge_color(c_black, c_white, image_alpha), 0);
        draw_set_blend_mode(bm_normal);
        draw_rectangle_colour(18 + Xachievements[i], 148 + Yachievements + Ydescription[i] + scroll, 600 + Xachievements[i], 156 + Yachievements + Ydescription[i] + scroll, c_white, merge_color(c_white, c_ltgray, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), c_white, merge_color(c_white, c_ltgray, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), 0);
        if (global.ach_secret[i] == 0 || (global.ach_secret[i] == 1 && global.ach_get[i] == 1))
        {
            draw_set_blend_mode(bm_subtract);
            draw_circle_colour(437, 128 + Yachievements + Ydescription[i] + scroll, 11, c_black, merge_color(c_black, c_white, image_alpha), 0);
            draw_set_blend_mode(bm_normal);
            if (global.ach_get[i] == 1)
            {
                if (CompleteAllAchievements == 0)
                {
                    draw_set_blend_mode(bm_add);
                    draw_ellipse_colour((18 + Xachievements[i]) - 15, (148 + Yachievements + Ydescription[i] + scroll) - 15, 600 + Xachievements[i] + 15, 154 + Yachievements + Ydescription[i] + scroll + 15, merge_color(merge_color(c_orange, c_fuchsia, 0.5 + lengthdir_x(0.5, (dirBackGround * 4) + (i * 64))), c_black, 0.8), c_black, 0);
                    draw_set_blend_mode(bm_normal);
                    draw_rectangle_colour(18 + Xachievements[i], 148 + Yachievements + Ydescription[i] + scroll, 600 + Xachievements[i], 154 + Yachievements + Ydescription[i] + scroll, merge_color(c_fuchsia, c_orange, 0.5 + lengthdir_x(0.5, (dirBackGround * 4) + (i * 64))), merge_color(c_fuchsia, c_orange, 0.5 + lengthdir_x(0.5, (dirBackGround * 4) + (i * 64))), merge_color(c_orange, c_fuchsia, 0.5 + lengthdir_x(0.5, (dirBackGround * 4) + (i * 64))), merge_color(c_orange, c_fuchsia, 0.5 + lengthdir_x(0.5, (dirBackGround * 4) + (i * 64))), 0);
                    draw_sprite_general(sprAchievementCheck, 0, 0, 0, 16, 16, 426, 117 + Yachievements + Ydescription[i] + scroll, 1.5, 1.5, 0, c_white, c_white, merge_color(merge_color(c_white, c_fuchsia, 0.5), merge_color(c_white, c_fuchsia, 0.25), 0.5 + lengthdir_x(0.5, (dirBackGround * 4) + (i * 64))), merge_color(merge_color(c_white, c_fuchsia, 0.5), merge_color(c_white, c_fuchsia, 0.25), 0.5 + lengthdir_x(0.5, (dirBackGround * 4) + (i * 64))), image_alpha);
                    draw_sprite_general(sprAchievementCheck, 1, 0, 0, 16, 16, 427.5, 118.5 + Yachievements + Ydescription[i] + scroll, 1.5, 1.5, 0, merge_color(c_fuchsia, c_orange, 0.5 + lengthdir_x(0.5, (dirBackGround * 4) + (i * 64))), merge_color(c_fuchsia, c_orange, 0.5 + lengthdir_x(0.5, (dirBackGround * 4) + (i * 64))), merge_color(c_orange, c_fuchsia, 0.5 + lengthdir_x(0.5, (dirBackGround * 4) + (i * 64))), merge_color(c_orange, c_fuchsia, 0.5 + lengthdir_x(0.5, (dirBackGround * 4) + (i * 64))), image_alpha);
                }
                else
                {
                    draw_set_blend_mode(bm_add);
                    draw_ellipse_colour((18 + Xachievements[i]) - 15, (148 + Yachievements + Ydescription[i] + scroll) - 15, 600 + Xachievements[i] + 15, 154 + Yachievements + Ydescription[i] + scroll + 15, merge_color(c_lime, c_black, 0.8), c_black, 0);
                    draw_set_blend_mode(bm_normal);
                    draw_rectangle_colour(18 + Xachievements[i], 148 + Yachievements + Ydescription[i] + scroll, 600 + Xachievements[i], 154 + Yachievements + Ydescription[i] + scroll, c_green, c_green, c_lime, merge_color(c_lime, c_white, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), 0);
                    draw_sprite_general(sprAchievementCheck, 0, 0, 0, 16, 16, 426, 117 + Yachievements + Ydescription[i] + scroll, 1.5, 1.5, 0, c_white, c_white, merge_color(merge_color(c_white, c_green, 0.5), merge_color(c_white, c_green, 0.25), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(merge_color(c_white, c_green, 0.5), merge_color(c_white, c_green, 0.25), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), image_alpha);
                    draw_sprite_general(sprAchievementCheck, 1, 0, 0, 16, 16, 427.5, 118.5 + Yachievements + Ydescription[i] + scroll, 1.5, 1.5, 0, merge_color(c_green, c_lime, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(c_green, c_lime, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(c_lime, c_green, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(c_lime, c_green, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), image_alpha);
                }
                color[i] = 16777215;
            }
            else
            {
                draw_set_blend_mode(bm_add);
                draw_ellipse_colour((18 + Xachievements[i]) - 15, (148 + Yachievements + Ydescription[i] + scroll) - 15, 600 + Xachievements[i] + 15, 154 + Yachievements + Ydescription[i] + scroll + 15, merge_color(c_red, c_black, 0.8), c_black, 0);
                draw_set_blend_mode(bm_normal);
                draw_rectangle_colour(18 + Xachievements[i], 148 + Yachievements + Ydescription[i] + scroll, 600 + Xachievements[i], 154 + Yachievements + Ydescription[i] + scroll, c_red, c_red, c_orange, merge_color(c_red, c_orange, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), 0);
                draw_sprite_general(sprAchievementCheck, 0, 0, 0, 16, 16, 426, 117 + Yachievements + Ydescription[i] + scroll, 1.5, 1.5, 0, merge_color(c_white, merge_color(c_red, c_white, 0.75), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(c_white, merge_color(c_red, c_white, 0.75), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), c_black, c_black, image_alpha);
                if (global.ach_title[i] == "Achievement Whore")
                {
                    color[i] = 0;
                }
                else
                {
                    color[i] = merge_color(merge_color(c_red, c_black, 0.85), merge_color(c_red, c_black, 0.9), 0.5 + lengthdir_x(0.5, dirBackGround * 8));
                }
                CompleteAllAchievements = 1;
            }
            draw_set_font(fntFeats);
            if (string_length(global.ach_title[i]) > 22)
            {
                TextsizeTitle = clamp(1.15 - (string_length(global.ach_title[i]) / 8), 1, 1.15);
            }
            else
            {
                TextsizeTitle = 1.15;
            }
            draw_text_transformed_colour(80 + Xachievements[i], (102 + Yachievements + Ydescription[i] + scroll) - 1, global.ach_title[i], TextsizeTitle, TextsizeTitle, 0, c_black, c_black, colorTextShadow, colorTextShadow, image_alpha);
            draw_text_transformed_colour(80 + Xachievements[i], 102 + Yachievements + Ydescription[i] + scroll + 1, global.ach_title[i], TextsizeTitle, TextsizeTitle, 0, c_black, c_black, colorTextShadow, colorTextShadow, image_alpha);
            draw_text_transformed_colour(80 + Xachievements[i], 102 + Yachievements + Ydescription[i] + scroll + 2, global.ach_title[i], TextsizeTitle, TextsizeTitle, 0, c_black, c_black, colorTextShadow, colorTextShadow, image_alpha);
            draw_text_transformed_colour((80 + Xachievements[i]) - 1, 102 + Yachievements + Ydescription[i] + scroll, global.ach_title[i], TextsizeTitle, TextsizeTitle, 0, c_black, c_black, colorTextShadow, colorTextShadow, image_alpha);
            draw_text_transformed_colour(80 + Xachievements[i] + 1, 102 + Yachievements + Ydescription[i] + scroll + 1, global.ach_title[i], TextsizeTitle, TextsizeTitle, 0, c_black, c_black, colorTextShadow, colorTextShadow, image_alpha);
            draw_text_transformed_colour((80 + Xachievements[i]) - 2, 102 + Yachievements + Ydescription[i] + scroll + 1, global.ach_title[i], TextsizeTitle, TextsizeTitle, 0, c_black, c_black, colorTextShadow, colorTextShadow, image_alpha);
            draw_text_transformed_colour(80 + Xachievements[i] + 2, 102 + Yachievements + Ydescription[i] + scroll, global.ach_title[i], TextsizeTitle, TextsizeTitle, 0, c_black, c_black, colorTextShadow, colorTextShadow, image_alpha);
            draw_set_blend_mode(bm_add);
            draw_text_transformed_colour(80 + Xachievements[i], 103 + Yachievements + Ydescription[i] + scroll, global.ach_title[i], TextsizeTitle, TextsizeTitle, 0, merge_color(color1s, c_white, 0.5), merge_color(color1s, c_white, 0.5), merge_color(color2s, c_white, 0.5), merge_color(color2s, c_white, 0.5), image_alpha - 0.65);
            draw_set_blend_mode(bm_normal);
            draw_text_transformed_colour(80 + Xachievements[i], 102 + Yachievements + Ydescription[i] + scroll, global.ach_title[i], TextsizeTitle, TextsizeTitle, 0, color1s, color1s, color2s, color2s, image_alpha);
            draw_set_font(fntDetails);
            if (string_length(global.ach_descr[i]) > 36)
            {
                array = string_split(global.ach_descr[i], " ");
                achtextdescr1 = "";
                achtextdescr2 = "";
                achtextdescr = "";
                nextline = 0;
                ii = 0;
                repeat (array_length_1d(array))
                {
                    if (string_length(achtextdescr1 + array[ii]) <= 24 && !nextline)
                    {
                        achtextdescr1 += (array[ii] + " ");
                    }
                    else
                    {
                        achtextdescr2 += (array[ii] + " ");
                        nextline = 1;
                    }
                    ii++;
                }
                achtextdescr = achtextdescr1 + "#" + achtextdescr2;
            }
            else
            {
                achtextdescr = global.ach_descr[i];
            }
            draw_text_transformed_colour((80 + Xachievements[i]) - 1.25, 122 + Yachievements + Ydescription[i] + scroll, achtextdescr, 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, image_alpha);
            draw_text_transformed_colour(80 + Xachievements[i] + 1.25, 122 + Yachievements + Ydescription[i] + scroll, achtextdescr, 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, image_alpha);
            draw_text_transformed_colour(80 + Xachievements[i], (122 + Yachievements + Ydescription[i] + scroll) - 1.25, achtextdescr, 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, image_alpha);
            draw_text_transformed_colour(80 + Xachievements[i], 122 + Yachievements + Ydescription[i] + scroll + 1.25, achtextdescr, 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, image_alpha);
            draw_text_transformed_colour(80 + Xachievements[i], 122 + Yachievements + Ydescription[i] + scroll, achtextdescr, 1.35, 1.35, 0, colorTextDescriptions, colorTextDescriptions, colorTextDescriptions1, colorTextDescriptions1, image_alpha);
            draw_set_halign(fa_left);
            if (select == i)
            {
                draw_sprite_ext(sprDiskAchievement, global.ach_disk[i], (50 + Xachievements[i]) - AWx[i], 128 + Yachievements + Ydescription[i] + scroll + slideimpact, 1.5, 1.5, dir + (slideimpact * 2) + (AWx[i] * 2), merge_color(color[i], c_black, clamp(abs(AWx[i] / 2), 0, 1)), image_alpha);
                draw_sprite_ext(sprDiskCoverAchievement, global.ach_grade[i], (50 + Xachievements[i]) - AWx[i], 128 + Yachievements + Ydescription[i] + scroll + slideimpact, 1.5, 1.5, (lengthdir_x(5, dir * 3) + (slideimpact * 5)) - (AWx[i] * 2), merge_color(color[i], c_black, clamp(abs(AWx[i] / 2), 0, 1)), image_alpha);
                scroll = lerp(scroll, -Yachievements, 0.25);
            }
            else
            {
                draw_sprite_ext(sprDiskAchievement, global.ach_disk[i], (50 + Xachievements[i]) - AWx[i], 128 + Yachievements + Ydescription[i] + scroll, 1.5, 1.5, 0 + (AWx[i] * 2), merge_color(color[i], c_black, clamp(abs(AWx[i] / 2), 0, 1)), image_alpha);
                draw_sprite_ext(sprDiskCoverAchievement, global.ach_grade[i], (50 + Xachievements[i]) - AWx[i], 128 + Yachievements + Ydescription[i] + scroll, 1.5, 1.5, 0 - (AWx[i] * 2), merge_color(color[i], c_black, clamp(abs(AWx[i] / 2), 0, 1)), image_alpha);
            }
        }
        else
        {
            CompleteAllAchievements = 1;
            draw_set_blend_mode(bm_add);
            draw_ellipse_colour((18 + Xachievements[i]) - 15, (148 + Yachievements + Ydescription[i] + scroll) - 15, 600 + Xachievements[i] + 15, 154 + Yachievements + Ydescription[i] + scroll + 15, merge_color(c_fuchsia, c_black, 0.8), c_black, 0);
            draw_set_blend_mode(bm_normal);
            draw_rectangle_colour(18 + Xachievements[i], 148 + Yachievements + Ydescription[i] + scroll, 600 + Xachievements[i], 154 + Yachievements + Ydescription[i] + scroll, c_purple, c_purple, c_fuchsia, merge_color(c_fuchsia, c_white, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), 0);
            draw_set_blend_mode(bm_subtract);
            draw_circle_colour(437, 128 + Yachievements + Ydescription[i] + scroll + lengthdir_x(2, dirBackGround * 4), 11, c_black, merge_color(c_black, c_white, image_alpha), 0);
            draw_set_blend_mode(bm_normal);
            ii = 0;
            d3d_set_fog(true, c_purple, 0, 0);
            repeat (6)
            {
                draw_sprite_ext(sprDiskAchievement, global.ach_disk[i], 50 + Xachievements[i], 128 + Yachievements + Ydescription[i] + scroll + lengthdir_x(4, dirBackGround * ii), 1.5, 1.5, lengthdir_x(0.5, dirBackGround * ii), c_white, clamp((ii / 35) - image_alpha, 0, 1));
                draw_sprite_ext(sprAchievementCheck, 0, 426, 117 + Yachievements + Ydescription[i] + scroll + lengthdir_x(2, dirBackGround * ii), 1.5, 1.5, 0, c_white, clamp((ii / 35) - image_alpha, 0, 1));
                ii += 1;
            }
            d3d_set_fog(false, c_black, 0, 0);
            draw_sprite_general(sprAchievementCheck, 0, 0, 0, 16, 16, 426, 117 + Yachievements + Ydescription[i] + scroll + lengthdir_x(2, dirBackGround * 4), 1.5, 1.5, 0, merge_color(c_white, merge_color(c_purple, c_white, 0.75), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(c_white, merge_color(c_purple, c_white, 0.75), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), c_black, c_black, image_alpha);
            draw_set_font(fntFeats);
            ii = 0;
            repeat (string_length(global.ach_title[i]))
            {
                ii += 13;
                draw_text_transformed_colour((67 + Xachievements[i] + ii) - 1, 102 + Yachievements + Ydescription[i] + scroll + lengthdir_x(4, (dirBackGround * 12) + (ii * 2)), "?", 1.15, 1.15, 0, merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), c_black, c_black, image_alpha - (ii / 236));
                draw_text_transformed_colour(67 + Xachievements[i] + ii + 1, 102 + Yachievements + Ydescription[i] + scroll + lengthdir_x(4, (dirBackGround * 12) + (ii * 2)), "?", 1.15, 1.15, 0, merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), c_black, c_black, image_alpha - (ii / 236));
                draw_text_transformed_colour(67 + Xachievements[i] + ii, (102 + Yachievements + Ydescription[i] + scroll + lengthdir_x(4, (dirBackGround * 12) + (ii * 2))) - 1, "?", 1.15, 1.15, 0, merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), c_black, c_black, image_alpha - (ii / 236));
                draw_text_transformed_colour(67 + Xachievements[i] + ii, 102 + Yachievements + Ydescription[i] + scroll + lengthdir_x(4, (dirBackGround * 12) + (ii * 2)) + 1, "?", 1.15, 1.15, 0, merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), c_black, c_black, image_alpha - (ii / 236));
                draw_text_transformed_colour(67 + Xachievements[i] + ii, 102 + Yachievements + Ydescription[i] + scroll + lengthdir_x(4, (dirBackGround * 12) + (ii * 2)), "?", 1.15, 1.15, 0, merge_color(c_purple, c_fuchsia, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(c_purple, c_fuchsia, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), c_black, c_black, image_alpha - (ii / 236));
            }
            draw_set_font(fntDetails);
            ii = 0;
            repeat (string_length(global.ach_descr[i]))
            {
                ii += 8;
                draw_text_transformed_colour((72 + Xachievements[i] + ii) - 1.25, 122 + Yachievements + Ydescription[i] + scroll + lengthdir_x(4, (dirBackGround * 12) + (ii * 3)), "?", 1.35, 1.35, 0, c_black, c_black, merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), image_alpha - (ii / 236));
                draw_text_transformed_colour(72 + Xachievements[i] + ii + 1.25, 122 + Yachievements + Ydescription[i] + scroll + lengthdir_x(4, (dirBackGround * 12) + (ii * 3)), "?", 1.35, 1.35, 0, c_black, c_black, merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), image_alpha - (ii / 236));
                draw_text_transformed_colour(72 + Xachievements[i] + ii, (122 + Yachievements + Ydescription[i] + scroll + lengthdir_x(4, (dirBackGround * 12) + (ii * 3))) - 1.25, "?", 1.35, 1.35, 0, c_black, c_black, merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), image_alpha - (ii / 236));
                draw_text_transformed_colour(72 + Xachievements[i] + ii, 122 + Yachievements + Ydescription[i] + scroll + lengthdir_x(4, (dirBackGround * 12) + (ii * 3)) + 1.25, "?", 1.35, 1.35, 0, c_black, c_black, merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(merge_color(c_purple, c_black, 0.5), merge_color(c_fuchsia, c_black, 0.5), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), image_alpha - (ii / 236));
                draw_text_transformed_colour(72 + Xachievements[i] + ii, 122 + Yachievements + Ydescription[i] + scroll + lengthdir_x(4, (dirBackGround * 12) + (ii * 3)), "?", 1.35, 1.35, 0, c_black, c_black, merge_color(c_purple, merge_color(c_fuchsia, c_black, 0.25), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), merge_color(c_purple, merge_color(c_fuchsia, c_black, 0.25), 0.5 + lengthdir_x(0.5, dirBackGround * 4)), image_alpha - (ii / 236));
            }
            d3d_set_fog(true, merge_color(merge_color(c_purple, c_black, 0.5), c_black, 0.5 + lengthdir_x(0.5, dirBackGround * 8)), 0, 0);
            draw_sprite_ext(sprDiskAchievement, global.ach_disk[i], 50 + Xachievements[i], 128 + Yachievements + Ydescription[i] + scroll + lengthdir_x(2, dirBackGround * 4), 1.5, 1.5, 0, color[i], image_alpha);
            d3d_set_fog(false, c_black, 0, 0);
            draw_set_blend_mode(bm_subtract);
            draw_circle_colour(49 + Xachievements[i], 128 + Yachievements + Ydescription[i] + scroll + lengthdir_x(0.5, dirBackGround * 6), 25, merge_color(c_black, c_purple, image_alpha), c_black, 0);
            draw_set_blend_mode(bm_normal);
            d3d_set_fog(true, merge_color(c_purple, c_black, 0.5 + lengthdir_x(0.5, dirBackGround * 8)), 0, 0);
            draw_sprite_ext(sprDiskCoverAchievement, global.ach_grade[i], 50 + Xachievements[i], 128 + Yachievements + Ydescription[i] + scroll + lengthdir_x(0.5, dirBackGround * 6), 1.5, 1.5, 0, color[i], image_alpha);
            d3d_set_fog(false, c_black, 0, 0);
            if (select == i)
            {
                scroll = lerp(scroll, -Yachievements + lengthdir_x(2, dirBackGround * 4), 0.2);
            }
        }
        scrGetAchievementProperty(global.ach_title[i]);
        draw_set_halign(fa_right);
        if (count == 1)
        {
            draw_set_colour(merge_color(merge_color(c_maroon, c_black, 0.5), merge_color(c_green, c_black, 0.5), clamp(countcolor, 0, 1)));
            draw_text_transformed(423, 122 + Yachievements + Ydescription[i] + scroll, counttext, 1.35, 1.35, 0);
            draw_text_transformed(425, 122 + Yachievements + Ydescription[i] + scroll, counttext, 1.35, 1.35, 0);
            draw_text_transformed(424, (122 + Yachievements + Ydescription[i] + scroll) - 1, counttext, 1.35, 1.35, 0);
            draw_text_transformed(424, 122 + Yachievements + Ydescription[i] + scroll + 1, counttext, 1.35, 1.35, 0);
            draw_text_transformed_colour(424, 122 + Yachievements + Ydescription[i] + scroll, counttext, 1.35, 1.35, 0, merge_color(merge_color(c_white, c_maroon, 0.5 + lengthdir_x(0.5, dirBackGround * 8)), merge_color(c_white, c_green, 0.5 + lengthdir_x(0.5, dirBackGround * 8)), clamp(countcolor, 0, 1)), merge_color(merge_color(c_white, c_maroon, 0.5 + lengthdir_x(0.5, dirBackGround * 8)), merge_color(c_white, c_green, 0.5 + lengthdir_x(0.5, dirBackGround * 8)), clamp(countcolor, 0, 1)), merge_color(c_red, c_lime, clamp(countcolor, 0, 1)), merge_color(c_red, c_lime, clamp(countcolor, 0, 1)), image_alpha);
        }
        draw_set_halign(fa_left);
    }
    Yachievements += (60 + Yachievementslerp);
    i += 1;
}
switch (global.ach_rank[select])
{
    case 0:
        colorframework = make_colour_rgb(158, 49, 0);
        colorframework1 = make_colour_rgb(200, 79, 24);
        break;
    case 1:
        colorframework = make_colour_rgb(102, 102, 102);
        colorframework1 = make_colour_rgb(140, 140, 140);
        break;
    case 2:
    case 3:
        colorframework = 4235519;
        colorframework1 = 65535;
        break;
    case 4:
        colorframework = merge_color(make_colour_rgb(122, 150, 215), make_color_hsv((current_time / 12) % 255, 255, 255), 0.15);
        colorframework1 = merge_color(make_colour_rgb(158, 191, 220), make_color_hsv((current_time / 12) % 255, 255, 255), 0.15);
        break;
}
draw_set_blend_mode(bm_subtract);
ii = 0;
repeat (7)
{
    draw_rectangle_color(67 + XdescriptionMenu, 160 + (ii * 4.5), view_wview[0], 163 + (ii * 4.5), c_black, make_colour_rgb(shadow0, shadow0, shadow0), make_colour_rgb(shadow0, shadow0, shadow0), c_black, 0);
    ii += 1.5;
}
draw_rectangle_colour(67 + XdescriptionMenu, 166, 600, 213 + YdescriptionMenu, c_black, c_black, c_white, c_white, 0);
draw_set_blend_mode(bm_add);
draw_ellipse_colour((65 + XdescriptionMenu) - 15, (210 + YdescriptionMenu) - 15, 615, 218 + YdescriptionMenu + 15, merge_color(colorframework, c_black, 0.8), c_black, 0);
draw_set_blend_mode(bm_normal);
draw_rectangle_colour(65 + XdescriptionMenu, 210 + YdescriptionMenu, 600, 218 + YdescriptionMenu, c_white, merge_color(c_white, c_ltgray, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), c_white, merge_color(c_white, c_ltgray, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), 0);
draw_rectangle_colour(65 + XdescriptionMenu, 210 + YdescriptionMenu, 600, 216 + YdescriptionMenu, colorframework, colorframework, colorframework1, merge_color(colorframework1, c_white, 0.5 + lengthdir_x(0.5, dirBackGround * 4)), 0);
draw_sprite_ext(sprDiskAchievementRank, global.ach_rank[select], 98 + XdescriptionText, 187, 1.5, 1.5, dir, c_white, 1);
draw_sprite_ext(sprRankCup, global.ach_rank[select], 98 + XdescriptionText, 187, 1.5, 1.5, lengthdir_x(5, dir * 3), c_white, 1);
if (global.ach_rank[select] == 4)
{
    draw_set_blend_mode(bm_add);
    draw_circle_color(98 + XdescriptionText, 187, 43, merge_color(colorframework, c_black, 0.65), c_black, 0);
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(sprRankCup, 5, 98 + XdescriptionText, 187, 1.5, 1.5, lengthdir_x(5, dir * 3), merge_color(c_white, colorframework, 0.35), 1);
}
draw_set_font(fntDetails);
draw_text_transformed_colour(129.75 + XdescriptionText, 169, "level:" + string(global.ach_level[select]), 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(132.25 + XdescriptionText, 169, "level:" + string(global.ach_level[select]), 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(131 + XdescriptionText, 167.75, "level:" + string(global.ach_level[select]), 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(131 + XdescriptionText, 170.25, "level:" + string(global.ach_level[select]), 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(131 + XdescriptionText, 169, "level:" + string(global.ach_level[select]), 1.35, 1.35, 0, colorTextDescriptions, colorTextDescriptions, colorTextDescriptions1, colorTextDescriptions1, 1);
draw_text_transformed_colour(256.75 + XdescriptionText, 169, string(achtext) + ": ", 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(259.25 + XdescriptionText, 169, string(achtext) + ": ", 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(258 + XdescriptionText, 167.75, string(achtext) + ": ", 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(258 + XdescriptionText, 170.25, string(achtext) + ": ", 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(258 + XdescriptionText, 169, string(achtext) + ": ", 1.35, 1.35, 0, colorTextDescriptions, colorTextDescriptions, colorTextDescriptions1, colorTextDescriptions1, 1);
draw_set_colour(colorachtextShadow);
draw_text_transformed((345 + XdescriptionText) - 1, 169 + lengthdir_y(CompleteAchievements / array_length_1d(global.ach_title), dirBackGround * speedComplete), string(CompleteAchievements) + "/" + string(array_length_1d(global.ach_title)), 1.35, 1.35, 0);
draw_text_transformed(345 + XdescriptionText + 1, 169 + lengthdir_y(CompleteAchievements / array_length_1d(global.ach_title), dirBackGround * speedComplete), string(CompleteAchievements) + "/" + string(array_length_1d(global.ach_title)), 1.35, 1.35, 0);
draw_text_transformed(345 + XdescriptionText, 168 + lengthdir_y(CompleteAchievements / array_length_1d(global.ach_title), dirBackGround * speedComplete), string(CompleteAchievements) + "/" + string(array_length_1d(global.ach_title)), 1.35, 1.35, 0);
draw_text_transformed(345 + XdescriptionText, 170 + lengthdir_y(CompleteAchievements / array_length_1d(global.ach_title), dirBackGround * speedComplete), string(CompleteAchievements) + "/" + string(array_length_1d(global.ach_title)), 1.35, 1.35, 0);
draw_text_transformed_colour(345 + XdescriptionText, 169 + lengthdir_y(CompleteAchievements / array_length_1d(global.ach_title), dirBackGround * speedComplete), string(CompleteAchievements) + "/" + string(array_length_1d(global.ach_title)), 1.35, 1.35, 0, colorachtext, colorachtext, colorachtext1, colorachtext1, 1);
draw_text_transformed_colour((131 + XdescriptionText) - 1.25, 186, string(global.ach_time[select]), 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(131 + XdescriptionText + 1.25, 186, string(global.ach_time[select]), 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(131 + XdescriptionText, 184.75, string(global.ach_time[select]), 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(131 + XdescriptionText, 187.25, string(global.ach_time[select]), 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(131 + XdescriptionText, 186, string(global.ach_time[select]), 1.35, 1.35, 0, colorTextDescriptions, colorTextDescriptions, colorTextDescriptions1, colorTextDescriptions1, 1);
draw_text_transformed_colour(256.75 + XdescriptionText, 186, "mask:", 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(259.25 + XdescriptionText, 186, "mask:", 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(258 + XdescriptionText, 184.75, "mask:", 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(258 + XdescriptionText, 187.25, "mask:", 1.35, 1.35, 0, c_black, c_black, colorTextDescriptionsShadow, colorTextDescriptionsShadow, 1);
draw_text_transformed_colour(258 + XdescriptionText, 186, "mask:", 1.35, 1.35, 0, colorTextDescriptions, colorTextDescriptions, colorTextDescriptions1, colorTextDescriptions1, 1);
draw_set_font(fntChapter);
draw_set_halign(fa_right);
draw_text_transformed_colour(445 + XdescriptionText, 152, string(select + 1), 0.6, 0.6, 0, c_black, c_black, colorTextShadow, colorTextShadow, 1);
draw_text_transformed_colour(445 + XdescriptionText, 154, string(select + 1), 0.6, 0.6, 0, c_black, c_black, colorTextShadow, colorTextShadow, 1);
draw_text_transformed_colour((445 + XdescriptionText) - 1, 153, string(select + 1), 0.6, 0.6, 0, c_black, c_black, colorTextShadow, colorTextShadow, 1);
draw_text_transformed_colour(445 + XdescriptionText + 1, 153, string(select + 1), 0.6, 0.6, 0, c_black, c_black, colorTextShadow, colorTextShadow, 1);
draw_text_transformed_colour(445 + XdescriptionText, 153, string(select + 1), 0.6, 0.6, 0, color1s, color1s, color2s, color2s, 1);
if (global.ach_maskskin[select] == -1)
{
    draw_sprite_ext(sprMasksIconNoMask, 0, 308 + XdescriptionText, 194, 1.5, 1.5, 0, c_white, 1);
}
else
{
    draw_sprite_ext(scrGetMaskSkin(global.ach_mask[select], global.ach_maskskin[select], "Icon"), global.ach_mask[select], 308 + XdescriptionText, 194, 1.5, 1.5, 0, c_white, 1);
}
if (global.ach_level[select] == "CHEATER")
{
    global.ach_time[select] = "CHEATER";
    draw_set_blend_mode(bm_add);
    repeat (7)
    {
        draw_text_transformed_colour(389 + XdescriptionText + random_range(2, -2), 164 + random_range(2, -2), "CHEATER", 1, 1, 0, c_red, c_red, c_red, c_red, 0.035);
    }
    draw_set_blend_mode(bm_normal);
}
draw_sprite_ext(sprArrowDescription, 0, (438 + (Xachievements[select] * 18)) - arrowx, 155 + arrowy + lengthdir_x(2, dirBackGround * 10), 1.5, 1.5, arrowangle, c_white, image_alpha);
draw_set_halign(fa_left);
draw_set_alpha(0.009 + alphaShine);
draw_set_blend_mode(bm_add);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 100 + 24 + ymoon, 350, color4, c_black, 0);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 100 + 24 + ymoon, 350, color4, c_black, 0);
draw_set_alpha(0.073 + alphaShine);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, 237.99999999999997, color5, c_black, 0);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, 203, color5, c_black, 0);
draw_set_alpha(0.153 + alphaShine);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, 189, color4, c_black, 0);
draw_set_alpha(0.076 + alphaShine);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, 164 + random(4), color4, c_black, 0);
draw_set_alpha(0.042 + alphaShine);
draw_circle_color(view_wview[0] / 2, (view_hview[0] / 2) + 24 + ymoon, 164 + random(8), color4, c_black, 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
if (fade == 0)
{
    islandStart = lerp(islandStart, 0, 0.05);
    if (c_amount < 180)
    {
        c_amount += 5;
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
        {
            color2 = merge_color(c_black, merge_color(c_purple, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        }
        else
        {
            color2 = 16777215;
        }
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + view_wview[0] + 10, view_yview[0] + view_hview[0] + 10, color1, color2, color2, color1, 0);
        draw_set_blend_mode(bm_normal);
    }
}
if (fade == 1)
{
    if (c_amount > 0)
    {
        image_alpha = lerp(image_alpha, 0, 0.075);
        if (image_alpha <= 0.035)
        {
            islandStart = lerp(islandStart, 75, 0.05);
            c_amount -= 5;
            color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
            if (c_amount > 90)
            {
                color2 = merge_color(c_black, merge_color(c_purple, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
            }
            else
            {
                color2 = 16777215;
            }
            draw_set_blend_mode(bm_subtract);
            draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + view_wview[0] + 10, view_yview[0] + view_hview[0] + 10, color2, color1, color1, color2, 0);
            draw_rectangle_color(view_xview[0] - 10, view_yview[0] - 10, view_xview[0] + view_wview[0] + 10, view_yview[0] + view_hview[0] + 10, color1, color2, color2, color1, 0);
            draw_set_blend_mode(bm_normal);
        }
        else
        {
            islandStart = lerp(islandStart, 0, 0.05);
        }
    }
    else
    {
        room = rmOptions;
    }
}
