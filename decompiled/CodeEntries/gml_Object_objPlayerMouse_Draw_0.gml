colorGlow = merge_color(c_black, merge_color(merge_color(c_lime, c_red, global.GlowSkippy), make_color_hsv((current_time / 12) % 255, 255, 255), random(1)), random(1));
draw_set_alpha(global.GlowSkippy - (global.GlowSkippy / 1.5) - global.GlowSkippyEnd);
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 25 + (global.PShaking * 2) + lengthdir_x(global.GlowSkippy * 2, global.flicker * 4) + (global.GlowSkippy * 15), merge_color(c_lime, c_red, global.GlowSkippy), c_black, 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
if (persistent == true)
{
    exit;
}
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
if (sprite_index == last_sprite)
{
    nothing = 1;
}
else
{
    scrUpdateMaskPos(sprite_index);
    last_sprite = sprite_index;
}
if (sprite_index == sprGriffinWalk || sprite_index == sprGriffinAttackKnife || sprite_index == sprGriffinAttack9mm)
{
    if (myspeed == 2.25)
    {
        legsprite = 548;
    }
    else
    {
        legsprite = 548;
    }
}
else if (myspeed == 2.25)
{
    legsprite = 43;
}
else
{
    legsprite = 42;
}
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30 + (light * 2)), c_black, 0);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(legsprite, legindex, x + 1, y + 1, image_xscale, image_yscale, legdir + global.PShaking, c_black, 0.5);
shader_reset();
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, dir + global.PShaking, c_black, 0.5);
if (maskon == 1 && sprite_index == sprPMaskSlip && image_index < 2 && image_index > 1)
{
    scrDrawMask(0);
}
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_sprite_ext(legsprite, legindex, x, y, image_xscale, image_yscale, legdir + global.PShaking, image_blend, image_alpha);
d3d_set_fog(true, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 0, 0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(legsprite, legindex, x, y, image_xscale, image_yscale, legdir + global.PShaking, image_blend, global.GlowSkippy - (global.GlowSkippy / 1.5) - global.GlowSkippyEnd);
d3d_set_fog(false, c_black, 0, 0);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, image_blend, image_alpha);
scrDrawPlayerSkippy();
scrDrawPlayerHot();
if (reload > 0)
{
    reload -= 1;
}
if (reload > 0)
{
    debuffammo -= 0.05;
}
if (light > 3)
{
    light -= 3;
}
if (sprite_index == sprPMaskSlip && image_index < 2)
{
    exit;
}
if (maskon == 1)
{
    scrDrawMask(0);
}
if (sprite_index == sprPWalkThrow)
{
    left = 1;
    draw_set_alpha(0.35 - global.powerIgel);
    draw_set_blend_mode(bm_add);
    if (throwindex == 8)
    {
        draw_circle_color(x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90), y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90), 13 + (global.PShaking * 2) + lengthdir_x(global.GlowSkippy * 2, global.flicker * 4) + (global.GlowSkippy * 15), colorGlow, c_black, 0);
        global.powerIgel = 0;
    }
    if (throwindex == 9 || throwindex == 10 || throwindex == 11)
    {
        if (round(random(92)) == 2)
        {
            instance_create(x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90), y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90), objBloodSplat);
        }
    }
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(1);
    shader_reset();
    draw_sprite_ext(sprThrowWeapons, throwindex, x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90) + 1, y + 1 + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90), image_xscale, image_yscale, dir + lengthdir_x(20, 360 * image_index * 0.125), c_black, 0.5);
    if (global.maskindex == 26 && global.maskon == 1)
    {
        shader_set(shd_russell_player);
    }
    draw_sprite_ext(sprThrowWeapons, throwindex, x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90), y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90), image_xscale, image_yscale, dir + lengthdir_x(20, 360 * image_index * 0.125), image_blend, image_alpha);
    draw_set_blend_mode(bm_add);
    if (throwindex == 8)
    {
        draw_sprite_ext(sprThrowWeapons, throwindex, x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90), y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90), image_xscale, image_yscale, dir + lengthdir_x(20, 360 * image_index * 0.125), colorGlow, 0.5 - global.powerIgel);
    }
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(sprThrowWeaponsGlow, throwindex, x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90), y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90), image_xscale, image_yscale, dir + lengthdir_x(20, 360 * image_index * 0.125), colorGlow, 1);
    draw_set_blend_mode(bm_add);
    i = 0;
    repeat (8)
    {
        draw_sprite_ext(sprThrowWeaponsGlow, throwindex, x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90) + i, y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90), image_xscale, image_yscale, dir + lengthdir_x(20, 360 * image_index * 0.125), colorGlow, 0.75 - (i / 4));
        draw_sprite_ext(sprThrowWeaponsGlow, throwindex, (x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90)) - i, y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90), image_xscale, image_yscale, dir + lengthdir_x(20, 360 * image_index * 0.125), colorGlow, 0.75 - (i / 4));
        draw_sprite_ext(sprThrowWeaponsGlow, throwindex, x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90), y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90) + i, image_xscale, image_yscale, dir + lengthdir_x(20, 360 * image_index * 0.125), colorGlow, 0.75 - (i / 4));
        draw_sprite_ext(sprThrowWeaponsGlow, throwindex, x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90), (y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90)) - i, image_xscale, image_yscale, dir + lengthdir_x(20, 360 * image_index * 0.125), colorGlow, 0.75 - (i / 4));
        i += 1;
    }
    draw_set_blend_mode(bm_normal);
}
scrDrawPlayerFire();
shader_reset();
