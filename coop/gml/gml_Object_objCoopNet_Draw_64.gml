// Draw GUI: small co-op status line while a session exists (the CO-OP submenu shows it in its own style).
var txt, yy;
if (instance_exists(objTitleNew))
{
    if (objTitleNew.level == 2)
    {
        exit;
    }
}
if (global.coop_state == 0 && global.coop_notice_time <= 0)
{
    exit;
}
txt = "CO-OP: " + scrCoopStatusText();
if (room == rmMenu)
{
    txt += "   (F7 HOST  F8 JOIN  F11 LEAVE)";
}
draw_set_font(fntDate);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
yy = 8;
if (global.coop_state != 0)
{
    draw_set_color(c_black);
    draw_text(10, yy + 2, txt);
    draw_set_color(c_white);
    draw_text(8, yy, txt);
    yy += 20;
}
if (global.coop_notice_time > 0 && global.coop_notice != "")
{
    draw_set_color(c_black);
    draw_text(10, yy + 2, global.coop_notice);
    draw_set_color(c_red);
    draw_text(8, yy, global.coop_notice);
}
draw_set_color(c_white);
