surface_set_target(global.surf1);
draw_clear(make_color_hsv(155, 5 - random(5), 200 + random(5)));
draw_set_blend_mode(bm_subtract);
with (objBurningTrashcan)
{
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 60 + random(10), c_yellow, c_black, 0);
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 35 + random(7.5), c_orange, c_black, 0);
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 21 + random(5), c_red, c_black, 0);
}
with (objFluorescentLamp)
{
    if (light == 1 && broken == 1)
    {
        draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 45 + random(15), c_yellow, c_black, 0);
        draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 20 + random(10), c_red, c_black, 0);
        if (image_index == 1 || image_index == 2)
        {
            draw_sprite_ext(sprFluorescentLampGlow, 0, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, light);
        }
        if (image_index == 1 || image_index == 3)
        {
            draw_sprite_ext(sprFluorescentLampGlow, 1, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, light);
        }
    }
}
with (objJonesBoss)
{
    if (state == -1 || state == -2 || state == -3)
    {
        draw_sprite_ext(sprJonesWalkChainsawEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, direction, image_blend, alphaEyes);
    }
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 13, merge_color(c_black, c_white, alphaEyes), c_black, 0);
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 30 + random(5), merge_color(c_black, merge_color(c_yellow, c_black, 0.25), HotWeaponAlpha), c_black, 0);
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 17.5 + random(3.75), merge_color(c_black, merge_color(c_orange, c_black, 0.25), HotWeaponAlpha), c_black, 0);
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 10.5 + random(2.5), merge_color(c_black, merge_color(c_red, c_black, 0.25), HotWeaponAlpha), c_black, 0);
}
with (objLight)
{
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, radius * (1 + random(0.1)), merge_color(c_black, color, strength * (0.9 + random(0.1))), c_black, 0);
}
with (objLighter)
{
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, (Lighter / 4) + random(0.25), c_yellow, c_black, 0);
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, Lighter + random(0.5), c_orange, c_black, 0);
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, (Lighter * 2) + random(0.75), c_red, c_black, 0);
}
with (objPlayer)
{
    if (Spark != 0 && Spark != -1)
    {
        xaura = lerp(xaura, x + fireax, 0.35);
        yaura = lerp(yaura, y + fireay, 0.35);
        draw_circle_color((xaura - view_xview[0]) + 16, (yaura - view_yview[0]) + 16, (Lighter / 4) + random(0.25), c_yellow, c_black, 0);
        draw_circle_color((xaura - view_xview[0]) + 16, (yaura - view_yview[0]) + 16, Lighter + random(0.5), c_orange, c_black, 0);
        draw_circle_color((xaura - view_xview[0]) + 16, (yaura - view_yview[0]) + 16, (Lighter * 2) + random(0.75), c_red, c_black, 0);
        if (Spark == 2)
        {
            if (position_meeting(x + fireax, y + fireay, objVeryBigPipeV))
            {
                Lighter = lerp(Lighter, 12 + random(1), 0.5);
            }
            else
            {
                Lighter = lerp(Lighter, 24 + random(2), 0.5);
            }
        }
    }
    else if (object_index == objPlayerMouse || object_index == objPlayerMouseHouse)
    {
        firedir = point_direction(0, 0, fireaddx[floor(image_index)], fireaddy[floor(image_index)] * left) + dir;
        firedist = point_distance(0, 0, fireaddx[floor(image_index)], fireaddy[floor(image_index)] * left);
        fireax = lengthdir_x(firedist, firedir);
        fireay = lengthdir_y(firedist, firedir);
        xaura = x + fireax;
        yaura = y + fireay;
        if (Spark == -1)
        {
            Spark = 2;
        }
    }
}
draw_set_blend_mode(bm_normal);
surface_reset_target();
if (!on)
{
    exit;
}
