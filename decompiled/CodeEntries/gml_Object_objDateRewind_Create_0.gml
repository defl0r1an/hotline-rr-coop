day = 23;
currentmonth = 3;
month[0] = "APR";
month[1] = "MAY";
month[2] = "JUN";
month[3] = "JUL";
reload = 5;
maxreload = 5;
on = 0;
draw_set_font(fntDateHLM2);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
text = month[currentmonth] + " " + string(day) + scrNth(string(day)) + ", 1989#MIAMI, FLORIDA";
surf = surface_create(room_width * 3, room_height * 3);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_set_color(c_gray);
draw_text_transformed(((room_width / 2) * 3) + 3, ((room_height / 2) * 3) + 3, month[currentmonth] + " " + string(day) + scrNth(string(day)) + ", 1989#MIAMI, FLORIDA", 3, 3, 0);
draw_set_color(c_white);
draw_text_transformed((room_width / 2) * 3, (room_height / 2) * 3, month[currentmonth] + " " + string(day) + scrNth(string(day)) + ", 1989#MIAMI, FLORIDA", 3, 3, 0);
surface_reset_target();
factor = 0;
alarm[1] = 60;
i = 0;
draw_clear(c_black);
repeat (100)
{
    draw_surface_ext(surf, 0, 0, 1, 1, 0, merge_color(c_black, c_white, i * 0.016666666666666666), 1);
    if (i < 60)
    {
        i += 1;
    }
    sleep(16.666666666666668);
    screen_refresh();
}
