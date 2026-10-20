// Draws the main menu with the CO-OP item (level 0) or the co-op submenu (level 2) the same way
// objTitleNew draws its own items. Runs in objTitleNew's Step while global.surf1 is the target.
var n, k, idx, lbl, yy, rot, ii, rep, st, role, s, c, out;
rot = -lengthdir_x(1, dir * 0.1);
n = 5;
if (level == 2)
{
    n = 4;
    st = global.coop_state;
    role = global.coop_role;
    coop_alt[0] = "HOST GAME";
    if (role == 1 && (st == 1 || st == 3))
    {
        coop_alt[0] = "STOP HOSTING";
    }
    coop_alt[1] = "JOIN GAME";
    if (role == 2 && (st == 2 || st == 3))
    {
        coop_alt[1] = "LEAVE GAME";
    }
    if (coop_edit)
    {
        // Keep only characters that can appear in an IP address or host name.
        out = "";
        s = string_lower(keyboard_string);
        for (k = 1; k <= string_length(s); k += 1)
        {
            c = string_char_at(s, k);
            if (string_pos(c, "0123456789abcdefghijklmnopqrstuvwxyz.-:") > 0 && string_length(out) < 40)
            {
                out += c;
            }
        }
        keyboard_string = out;
        coop_blink = (coop_blink + 1) mod 40;
        coop_alt[2] = "IP: " + string_upper(out);
        if (coop_blink < 20)
        {
            coop_alt[2] += "_";
        }
    }
    else if (global.coop_ip == "")
    {
        coop_alt[2] = "IP: NOT SET";
    }
    else
    {
        coop_alt[2] = "IP: " + string_upper(global.coop_ip);
    }
    coop_alt[3] = "BACK";
}
for (k = 0; k < n; k += 1)
{
    if (level == 2)
    {
        idx = k;
        lbl = coop_alt[k];
        rep = coop_rep[k];
    }
    else
    {
        idx = coop_order[k];
        lbl = alt[idx];
        rep = altrepeat[idx];
    }
    yy = (view_hview[0] / 2) + 6 + (k * 22);
    draw_set_font(fntBigMenu);
    ii = 0;
    repeat (rep)
    {
        if (select == idx)
        {
            draw_set_color(colormenu2);
        }
        else
        {
            draw_set_color(merge_color(c_dkgray, c_black, 0.25 + lengthdir_x(0.25, dir + (ii * 45))));
        }
        draw_text_transformed((view_wview[0] / 2) - ii, yy, lbl, 1, 1, rot);
        ii += 1;
    }
    if (select == idx)
    {
        draw_set_color(c_black);
        draw_text_transformed((view_wview[0] / 2) - ii, yy, lbl, 1, 1, rot);
        draw_text_transformed_color((view_wview[0] / 2) - 1 - ii, yy, lbl, 1, 1, rot, c_white, c_white, colormenu2, colormenu2, 1);
        draw_text_transformed_color((view_wview[0] / 2) - 2 - ii, yy, lbl, 1, 1, rot, c_white, c_white, colormenu2, colormenu2, 1);
        draw_text_transformed_color((view_wview[0] / 2) - 3 - ii, yy, lbl, 1, 1, rot, c_white, c_white, colormenu2, colormenu2, 1);
        if (rep < 8)
        {
            rep += 0.5;
        }
    }
    else if (rep > 3)
    {
        rep -= 0.5;
    }
    if (level == 2)
    {
        coop_rep[k] = rep;
    }
    else
    {
        altrepeat[idx] = rep;
    }
}
if (level == 2)
{
    draw_set_font(fntDate);
    yy = (view_hview[0] / 2) + 6 + (n * 22) + 2;
    s = scrCoopStatusText();
    draw_set_color(c_black);
    draw_text_transformed((view_wview[0] / 2) + 1, yy + 1, s, 1, 1, rot);
    draw_set_color(c_white);
    draw_text_transformed(view_wview[0] / 2, yy, s, 1, 1, rot);
    s = "";
    c = c_yellow;
    if (coop_edit)
    {
        s = "TYPE THE HOST IP - ENTER TO SAVE, ESC TO CANCEL";
    }
    else if (global.coop_state == 5 && (global.coop_ip == "127.0.0.1" || global.coop_ip == "localhost"))
    {
        s = "127.0.0.1 IS THIS PC - ENTER THE HOST'S TAILSCALE IP";
    }
    else if (global.coop_state == 1)
    {
        s = "YOUR PARTNER ENTERS THIS IP IN CO-OP > IP";
    }
    else if (global.coop_notice_time > 0 && global.coop_notice != "" && global.coop_state < 4)
    {
        // Errors of a failed or lost session are already in the status line above.
        s = string_upper(global.coop_notice);
        c = c_red;
    }
    if (s != "")
    {
        draw_set_color(c_black);
        draw_text_transformed((view_wview[0] / 2) + 1, yy + 13, s, 1, 1, rot);
        draw_set_color(c);
        draw_text_transformed(view_wview[0] / 2, yy + 12, s, 1, 1, rot);
    }
}
