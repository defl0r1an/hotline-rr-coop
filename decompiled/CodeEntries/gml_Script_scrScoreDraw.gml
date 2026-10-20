if (blankline == 90)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_set_font(fntCombo);
    draw_set_color(c_black);
    draw_text_transformed(16, 27.5, string(combostring), 1, 1, 0);
    draw_text_transformed(13, 24.5, string(combostring), 1, 1, 0);
    draw_set_color(color1);
    draw_text_transformed(15, 26.5, string(combostring), 1, 1, 0);
    draw_set_color(color2);
    draw_text_transformed(14, 25.5, string(combostring), 1, 1, 0);
}
