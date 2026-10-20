dirvin += 1;
color1 = merge_color(c_white, c_aqua, 0.5 + lengthdir_x(0.5, dir * 10));
color2 = merge_color(c_aqua, c_teal, 0.5 + lengthdir_x(0.5, dir * 10));
color1s = merge_color(c_white, c_red, 0.5 + lengthdir_x(0.5, dir * 10));
color2s = merge_color(c_fuchsia, c_maroon, 0.5 + lengthdir_x(0.5, dir * 10));
if (!surface_exists(global.surf_ach))
{
    global.surf_ach = surface_create(room_width, room_height);
    if (surface_exists(global.surf_ach))
    {
        surface_set_target(global.surf_ach);
        draw_clear_alpha(c_black, 0);
        surface_reset_target();
    }
}
surface_set_target(global.surf_ach);
draw_clear_alpha(c_black, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
i = 0;
ii = 0;
draw_set_font(fntMenu);
draw_set_blend_mode(bm_min);
repeat (array_length_1d(global.ach_title))
{
    draw_set_font(fntFeats);
    amount = 0.5 + lengthdir_x(0.5, dir * 10);
    if (global.ach_secret[i] == 0 || (global.ach_secret[i] == 1 && global.ach_get[i] == 1))
    {
        draw_text_colour(textx + 1, (54 + (i * 35)) - scroll, global.ach_title[i], color1s, color1s, color2s, color2s, 1);
        draw_text_colour(textx, (53 + (i * 35)) - scroll, global.ach_title[i], color1, color1, color2, color2, 1);
        draw_set_font(fntDetails);
        draw_set_color(c_purple);
        draw_text(textx + 10, (67 + (i * 35)) - scroll, global.ach_descr[i]);
        draw_set_color(merge_color(c_white, c_yellow, amount));
        draw_text(textx + 9, (66 + (i * 35)) - scroll, global.ach_descr[i]);
        scrGetAchievementProperty(global.ach_title[i]);
        if (count == 1)
        {
            draw_set_halign(fa_center);
            draw_set_color(c_purple);
            draw_text(413, (55 + (i * 35)) - scroll, counttext);
            draw_set_color(merge_color(c_white, c_yellow, amount));
            draw_text(412, (54 + (i * 35)) - scroll, counttext);
            draw_set_halign(fa_left);
        }
        draw_sprite_ext(sprAchievementCheck, 0, 430, (46 + (i * 35)) - scroll, 1, 1, 0, c_white, 1);
        if (global.ach_get[i] == 1)
        {
            draw_sprite_ext(sprAchievementCheck, 1, 431, (47 + (i * 35)) - scroll, 1, 1, 0, merge_color(c_fuchsia, c_aqua, amount), 1);
            draw_sprite_ext(sprDiskAchievement, global.ach_disk[i], 20, (55 + (i * 35)) - scroll, 1, 1, dirvin, c_white, 1);
            draw_sprite_ext(sprDiskCoverAchievement, global.ach_grade[i], 20, (55 + (i * 35)) - scroll, 1, 1, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(sprDiskAchievement, 0, 20, (55 + (i * 35)) - scroll, 1, 1, 0, c_black, 1);
        }
    }
    else
    {
        draw_text_colour(textx + 1, (54 + (i * 35)) - scroll, "???", color1s, color1s, color2s, color2s, 1);
        draw_text_colour(textx, (53 + (i * 35)) - scroll, "???", color1, color1, color2, color2, 1);
        draw_set_font(fntDetails);
        draw_set_color(c_purple);
        draw_text(textx + 10, (67 + (i * 35)) - scroll, "???");
        draw_set_color(merge_color(c_white, c_yellow, amount));
        draw_text(textx + 9, (66 + (i * 35)) - scroll, "???");
        draw_sprite_ext(sprAchievementCheck, 0, 430, (46 + (i * 35)) - scroll, 1, 1, 0, c_white, 1);
        draw_sprite_ext(sprDiskAchievement, 0, 20, (55 + (i * 35)) - scroll, 1, 1, 0, c_black, 1);
    }
    i += 1;
}
surface_alpha();
surface_reset_target();
