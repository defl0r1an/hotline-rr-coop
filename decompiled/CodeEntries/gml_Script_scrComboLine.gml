d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
blankline = 63;
movingline = global.combotime / 2.65;
combostring = string(global.combo) + "x";
if (global.combo > 1 || (global.maskindex == 13 && global.hardmode == 1 && global.combo != 0))
{
    pluscombo = lerp(pluscombo, 0, 0.2);
}
else
{
    pluscombo = lerp(pluscombo, -160, 0.1);
}
if (global.interfaceon == 1)
{
    if (pluscombo > -160)
    {
        draw_set_color(c_black);
        draw_rectangle(global.viewwview - (string_width(combostring) / 1.5) - 91 - pluscombo, 44, global.viewwview, 58, false);
        draw_rectangle_color(global.viewwview - (string_width(combostring) / 1.5) - 92 - pluscombo, 44, global.viewwview - (string_width(combostring) / 1.5) - 91 - pluscombo, 58, colorcombo2, colorcombo2, colorcombo2, colorcombo2, 0);
        draw_set_color(colorcombo1);
        draw_rectangle(((global.viewwview - (string_width(combostring) / 1.5)) + 2) - 26 - pluscombo - blankline, 48, ((global.viewwview - (string_width(combostring) / 1.5)) + 2) - 26 - pluscombo, 54, false);
        draw_set_color(colorcombo2);
        if (global.hlm2hud == 0)
        {
            if (update == 1)
            {
                draw_set_color(c_white);
            }
        }
        draw_rectangle(global.viewwview - (string_width(combostring) / 1.5) - 26 - pluscombo - movingline, 49.4, global.viewwview - (string_width(combostring) / 1.5) - 26 - pluscombo, 52.6, false);
        draw_set_color(colorcombo1);
        i = 0;
        repeat (6)
        {
            draw_rectangle(((global.viewwview - (string_width(combostring) / 1.5)) + 2) - 26 - pluscombo - (i * 12.2), 48, global.viewwview - (string_width(combostring) / 1.5) - 26 - pluscombo - (i * 12.2), 54, false);
            i += 1;
        }
        draw_set_halign(fa_right);
        draw_set_valign(fa_middle);
        draw_set_font(fntCombo);
        draw_set_color(colorcombo1);
        draw_text(((global.viewwview - 16) + random(global.blink)) - pluscombo, 51.5 + random(global.blink), string(combostring));
        draw_set_color(colorcombo2);
        if (global.hlm2hud == 0)
        {
            if (update == 1)
            {
                draw_set_color(c_white);
            }
        }
        draw_text(((global.viewwview - 17) + random(global.blink)) - pluscombo, 50.5 + random(global.blink), string(combostring));
    }
}
