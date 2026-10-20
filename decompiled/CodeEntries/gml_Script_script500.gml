if (global.interfaceon == 1)
{
    with (objLevelComplete)
    {
        if (global.hlm2hud == 0)
        {
            d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
            i = 0;
            factor = 0.5 - lengthdir_x(0.5, dir2);
            if (dir2 < 360)
            {
                dir2 += 4;
            }
            else
            {
                instance_destroy();
            }
            draw_set_font(fntLevelComplete);
            draw_set_halign(fa_left);
            draw_set_valign(fa_middle);
            start_x = (global.viewwview / 2) - (string_width(text) * 0.5);
            repeat (string_length(text))
            {
                letter = string_copy(text, 1 + i, 1);
                ii = 0;
                draw_text_transformed_color(start_x, (global.viewhview * 0.5) - (ii * 0.35) - 1, letter, 1, 1, 0, c_black, c_black, c_black, c_black, 0.5 - lengthdir_x(0.5, dir2));
                draw_text_transformed_color(start_x, ((global.viewhview * 0.5) - (ii * 0.35)) + 1, letter, 1, 1, 0, c_black, c_black, c_black, c_black, 0.5 - lengthdir_x(0.5, dir2));
                draw_text_transformed_color(start_x + 1, (global.viewhview * 0.5) - (ii * 0.35), letter, 1, 1, 0, c_black, c_black, c_black, c_black, 0.5 - lengthdir_x(0.5, dir2));
                draw_text_transformed_color(start_x - 1, (global.viewhview * 0.5) - (ii * 0.35), letter, 1, 1, 0, c_black, c_black, c_black, c_black, 0.5 - lengthdir_x(0.5, dir2));
                repeat ((5 + lengthdir_x(4, dir + (i * 60))) * factor)
                {
                    color2 = merge_color(merge_color(c_yellow, c_orange, 0.5), c_white, ii * 0.1);
                    color1 = merge_color(merge_color(c_fuchsia, c_red, 0.5), c_white, ii * 0.1);
                    draw_text_transformed_color(start_x, (global.viewhview * 0.5) - (ii * 0.35), letter, 1, 1, 0, color2, color2, color1, color1, 0.5 - lengthdir_x(0.5, dir2));
                    ii += 1;
                }
                start_x += string_width(letter);
                i += 1;
            }
            dir += 8;
        }
        else
        {
            d3d_set_projection_ortho(0, 0, global.viewwview, global.viewhview, 0);
            if (surface_exists(surf))
            {
                draw_surface_ext(surf, -1, 0, 1, 1, 0, c_black, 1);
                draw_surface_ext(surf, 1, 0, 1, 1, 0, c_black, 1);
                draw_surface_ext(surf, 0, -1, 1, 1, 0, c_black, 1);
                draw_surface_ext(surf, 0, 1, 1, 1, 0, c_black, 1);
                draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 1);
            }
        }
    }
}
