dir = point_direction(startx, starty, x, y);
draw_set_blend_mode(bm_add);
if (collision != line)
{
    alpha = lerp(alpha, 0, 0.025);
    alphaend = lerp(alphaend, 0, 0.05);
    draw_line_width_colour(linex[collision - pop], liney[collision - pop], x, y, 3, make_colour_rgb(alphaend / pop, alphaend / pop, alphaend / pop), make_colour_rgb(alpha, alpha, alpha));
    draw_circle_colour(x, y, 10, c_white, c_black, 0);
}
i = 0;
repeat (line)
{
    draw_line_width_colour(linexend[i], lineyend[i], linex[i], liney[i], 3, make_colour_rgb(linealphaend[i], linealphaend[i], linealphaend[i]), make_colour_rgb(linealpha[i], linealpha[i], linealpha[i]));
    draw_circle_colour(linex[i], liney[i], circlescale[i], c_white, c_black, 0);
    linealphaend[i] = lerp(linealphaend[i], 0, 0.05);
    linealpha[i] = lerp(linealpha[i], 0, 0.025);
    circlescale[i] = lerp(circlescale[i], 0, circlescalespeed);
    i += 1;
}
draw_set_blend_mode(bm_normal);
