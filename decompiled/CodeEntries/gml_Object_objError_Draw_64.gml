d3d_set_projection_ortho(0, 0, global.wview, global.hview, 0);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_font(fntDate);
draw_set_colour(c_blue);
draw_set_blend_mode_ext(bm_src_alpha_sat, bm_inv_dest_color);
draw_rectangle(((global.wview / 2) + (textsize * 6)) - (string_length(text) * 3), global.hview - texty, ((global.wview / 2) - (textsize * 6)) + (string_length(text) * 3), global.hview, false);
draw_rectangle_colour(((global.wview / 2) + (textsize * 6)) - (string_length(text) * 3), (global.hview - texty) + 8, ((global.wview / 2) - (textsize * 6)) + (string_length(text) * 3), global.hview, c_blue, c_blue, c_navy, c_navy, 0);
draw_set_colour(c_red);
draw_rectangle((((global.wview / 2) + (textsize * 6)) - (string_length(text) * 3)) + 1, global.hview - texty, (((global.wview / 2) - (textsize * 6)) + (string_length(text) * 3)) - 1, (global.hview - texty) + 8, false);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1 - alphaAll);
draw_set_colour(c_blue);
draw_rectangle(((global.wview / 2) + (textsize * 6)) - (string_length(text) * 3), global.hview - texty, ((global.wview / 2) - (textsize * 6)) + (string_length(text) * 3), global.hview, false);
draw_rectangle_colour(((global.wview / 2) + (textsize * 6)) - (string_length(text) * 3), (global.hview - texty) + 8, ((global.wview / 2) - (textsize * 6)) + (string_length(text) * 3), global.hview, c_blue, c_blue, c_navy, c_navy, 0);
draw_set_colour(c_red);
draw_rectangle((((global.wview / 2) + (textsize * 6)) - (string_length(text) * 3)) + 1, global.hview - texty, (((global.wview / 2) - (textsize * 6)) + (string_length(text) * 3)) - 1, (global.hview - texty) + 8, false);
if (tickcount != (string_length(textF) + 1) && tick <= 0)
{
    text += string_char_at(textF, tickcount);
    tickcount += 1;
    audio_sound_pitch(audio_play_sound(sndMaskClick, 0, false), 0.5 + random_range(0.25, -0.25));
    if (tickcount == (string_length(textF) + 1))
    {
        audio_play_sound(sndMaskClickEnd, 0, false);
    }
    tick = random_range(5, 15);
}
dir += 1;
i = 1;
ii = 0;
repeat (string_length(text))
{
    iii = 0;
    draw_set_blend_mode(bm_add);
    repeat (30)
    {
        shake = lengthdir_x(random_range(0.5, -0.5), dir);
        colorghost = merge_color(c_red, c_blue, 1 - (iii / 30));
        draw_text_ext_colour((((global.wview / 2) + (ii * 6)) - (string_length(text) * 3)) + 4 + shake + lengthdir_x(1, (dir * 3) + (iii * 33)), (global.hview - texty) + iii, string_char_at(text, i), 5, 300, colorghost, colorghost, colorghost, colorghost, 1 - (iii / alpha) - alphaAll);
        iii += 1;
    }
    shake = lengthdir_x(random_range(0.15, -0.15), dir);
    draw_set_blend_mode(bm_normal);
    draw_text_ext_colour((((global.wview / 2) + (ii * 6)) - (string_length(text) * 3)) + 4 + shake, (global.hview - texty) + 1, string_char_at(text, i), 5, 300, c_purple, c_purple, c_fuchsia, c_fuchsia, 1 - alphaAll);
    draw_text_ext_colour((((global.wview / 2) + (ii * 6)) - (string_length(text) * 3)) + 4 + shake, global.hview - texty, string_char_at(text, i), 5, 300, c_white, c_white, c_white, c_white, 1 - alphaAll);
    draw_set_blend_mode(bm_add);
    draw_text_ext_colour((((global.wview / 2) + (ii * 6)) - (string_length(text) * 3)) + 4 + shake, global.hview - texty - 1, string_char_at(text, i), 5, 300, c_red, c_red, c_black, c_black, 0.75 - alphaAll);
    ii += 1;
    textsize = ii;
    i += 1;
}
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
if (tick >= 0)
{
    tick -= 1;
}
if (time >= 0)
{
    time -= 1;
}
if (time <= 0)
{
    alphaAll = lerp(alphaAll, 1, clamp(random_range(0.25, -0.5), 0, 0.25));
    texty = lerp(texty, 0, clamp(random_range(0.15, -0.15), 0, 0.15));
    if (text <= 0)
    {
        instance_destroy();
    }
}
else
{
    texty = lerp(texty, 20, clamp(random_range(0.25, -0.5), 0, 0.25));
}
alpha = lerp(alpha, clamp(lengthdir_x(28, dir), 3, 12), 0.015);
