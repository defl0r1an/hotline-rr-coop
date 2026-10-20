global.levels[scrGetCurrentLevel() - 1] = 1;
scrSaveUnlocked();
scrSaveAchievements();
if (argument0 == 44)
{
    text = "APR 3RD, 1989#MIAMI, FLORIDA";
}
if (argument0 == 46)
{
    text = "APR 8TH, 1989#MIAMI, FLORIDA";
}
if (argument0 == 48)
{
    text = "APR 16TH, 1989#MIAMI, FLORIDA";
}
if (argument0 == 50)
{
    text = "APR 25TH, 1989#MIAMI, FLORIDA";
}
if (argument0 == 52)
{
    text = "MAY 5TH, 1989#MIAMI, FLORIDA";
}
if (argument0 == 54)
{
    text = "MAY 11TH, 1989#MIAMI, FLORIDA";
}
if (argument0 == 56)
{
    text = "MAY 13TH, 1989#MIAMI, FLORIDA";
}
if (argument0 == 71)
{
    text = "MAY 23RD, 1989#MIAMI, FLORIDA";
}
if (argument0 == 73)
{
    text = "MAY 27TH, 1989#MIAMI, FLORIDA";
}
if (argument0 == 75)
{
    text = "MAY 31ST, 1989#MIAMI, FLORIDA";
}
if (argument0 == 77)
{
    text = "JUN 3RD, 1989#MIAMI, FLORIDA";
}
if (argument0 == 79)
{
    text = "JUN 8TH, 1989#MIAMI, FLORIDA";
}
if (argument0 == 84)
{
    text = "JUL 22ND, 1989#MIAMI, FLORIDA";
}
if (argument0 == 86)
{
    text = "JUL 23RD, 1989#MIAMI, FLORIDA";
}
if (argument0 == 125)
{
    text = "JUL 21ST, 1989#MIAMI, FLORIDA";
}
if (argument0 == 37)
{
    text = "MAY 13th, 1989#MIAMI, FLORIDA";
}
if (argument0 == 38)
{
    text = "MAY 16TH, 1989#MIAMI, FLORIDA";
}
if (argument0 == 40)
{
    text = "MAY 23RD, 1989#MIAMI, FLORIDA";
}
if (argument0 == 42)
{
    text = "MAY 24TH, 1989#MIAMI, FLORIDA";
}
if (room == rmMCBar)
{
    nothing = 1;
}
else
{
    draw_set_font(fntDateHLM2);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
    i = 0;
    draw_clear(c_black);
    repeat (100)
    {
        draw_set_color(merge_color(c_black, c_gray, i * 0.016666666666666666));
        draw_text((view_wview[0] / 2) + 1, (view_hview[0] / 2) + 1, text);
        draw_set_color(merge_color(c_black, c_white, i * 0.016666666666666666));
        draw_text(view_wview[0] / 2, view_hview[0] / 2, text);
        if (i < 60)
        {
            i += 1;
        }
        sleep(16.666666666666668);
        screen_refresh();
    }
}
show_date = 1;
