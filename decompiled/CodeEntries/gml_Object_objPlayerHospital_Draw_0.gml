with (objWindowV)
{
    if (x == 32 && y == 352)
    {
        draw_sprite_ext(sprArrow, 0, x + 12 + lengthdir_x(3, global.dir * 8), y + 16, 1, 1, 270, c_white, 1);
    }
}
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30 + (light * 2)), c_black, 0);
draw_set_blend_mode(bm_normal);
if (myspeed == 2.5)
{
    legsprite = 2783;
}
else
{
    legsprite = 173;
}
draw_sprite_ext(legsprite, legindex, x + 1, y + 1, image_xscale, image_yscale, legdir, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, dir, c_black, 0.5);
draw_sprite_ext(legsprite, legindex, x, y, image_xscale, image_yscale, legdir, image_blend, image_alpha);
draw_sprite_ext(sprLegsNudeUndead, legindex, x, y, image_xscale, image_yscale, legdir, image_blend, alphaundead);
if ((sprite_index == sprPWalkHospital || sprite_index == sprPJacketWalkTrauma || sprite_index == sprPWalkHospitalUndead) && active == 1)
{
    dir = point_direction(x, y, global.mousex, global.mousey);
    if (global.xbox == 1)
    {
        dir = scrXboxPlayerLook();
    }
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, dir, image_blend, image_alpha);
draw_sprite_ext(sprPWalkHospitalUndead, image_index, x, y, image_xscale, image_yscale * left, dir, image_blend, alphaundead);
if (reload > 0)
{
    reload -= 1;
}
if (light > 3)
{
    light -= 3;
}
draw_set_colour(c_blue);
draw_set_font(fntDate);
