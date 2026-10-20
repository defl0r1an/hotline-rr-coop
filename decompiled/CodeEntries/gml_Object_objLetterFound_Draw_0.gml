d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
i = 0;
factor = 0.5 - lengthdir_x(0.5, dir2);
if (dir2 < 360)
{
    dir2 += 5;
}
else
{
    instance_destroy();
}
draw_set_font(fntCheckpoint);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
start_x = (view_wview[0] / 2) - (string_width(text) * 0.5);
repeat (string_length(text))
{
    letter = string_copy(text, 1 + i, 1);
    ii = 0;
    color1 = merge_color(c_orange, c_orange, ii * 0.1);
    color2 = merge_color(c_white, c_white, ii * 0.1);
    color3 = merge_color(c_purple, c_purple, ii * 0.1);
    color4 = merge_color(c_fuchsia, c_white, ii * 0.1);
    draw_set_color(c_black);
    if (dir2 > 180)
    {
        draw_set_alpha(0.5 - lengthdir_x(0.5, dir2));
    }
    draw_text_transformed(start_x, (view_hview[0] * 0.5) - (ii * 0.35) - 1, letter, 1, 1, 0);
    draw_text_transformed(start_x, ((view_hview[0] * 0.5) - (ii * 0.35)) + 2, letter, 1, 1, 0);
    draw_text_transformed(start_x + 1, (view_hview[0] * 0.5) - (ii * 0.35), letter, 1, 1, 0);
    draw_text_transformed(start_x - 1, (view_hview[0] * 0.5) - (ii * 0.35), letter, 1, 1, 0);
    draw_text_transformed_color(start_x, (view_hview[0] * 0.5) - (ii * 0.35), letter, 1, 1, 0, c_gray, c_gray, c_olive, c_olive, factor);
    draw_set_alpha(1);
    repeat ((5 + lengthdir_x(4, dir + (i * 60))) * factor)
    {
        draw_text_transformed_color(start_x, (view_hview[0] * 0.5) - (ii * 0.35), letter, 1, 1, 0, color4, color4, color3, color3, image_alpha);
        draw_text_transformed_color(start_x, ((view_hview[0] * 0.5) - (ii * 0.35)) + 1, letter, 1, 1, 0, color4, color4, color3, color3, image_alpha);
        draw_text_transformed_color(start_x, (view_hview[0] * 0.5) - (ii * 0.35), letter, 1, 1, 0, color2, color2, color1, color1, image_alpha);
        ii += 1;
    }
    start_x += string_width(letter);
    i += 1;
}
dir += 8;
