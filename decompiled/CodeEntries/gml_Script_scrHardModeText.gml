if (test == 0)
{
    if (global.hardmode == 0)
    {
        presstext = "Press SPACE for Hard Mode";
    }
    else
    {
        presstext = "Press SPACE for Normal Mode";
    }
    if (global.hardmode == 0)
    {
        draw_set_font(fntDate);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(colorhighscoretext1);
        draw_text(room_width / 2, (room_height - (room_height * 0.36 * 0.68)) + 16 + presstexty, presstext);
        draw_set_colour(colorhighscoretext2);
        draw_text(room_width / 2, (((room_height - (room_height * 0.36 * 0.68)) + 16) - 1) + presstexty, presstext);
    }
    else
    {
        draw_set_font(fntDate);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(colorhighscorenum1);
        draw_text(room_width / 2, (room_height - (room_height * 0.36 * 0.68)) + 16 + presstexty, presstext);
        draw_set_color(colorhighscorenum2);
        draw_text(room_width / 2, (((room_height - (room_height * 0.36 * 0.68)) + 16) - 1) + presstexty, presstext);
    }
}
if (state == 1)
{
    if (presstexty < 24)
    {
        presstexty += 4;
    }
    else
    {
        presstexty = 24;
    }
}
else if (musictexty == -24)
{
    if (presstexty > 0)
    {
        presstexty -= 4;
    }
    else
    {
        presstexty = 0;
    }
}
