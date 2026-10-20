// Draws the partner like objPlayerMouse_Draw_0 does (shadows, legs, body, thrown object, mask), without that
// event's gameplay side effects (reload/light timers, blood, global glow state).
var f, itype, mdir, dist, mx, my, ms, tx, ty;
if (p_kind == 0 || sprite_index < 0)
{
    exit;
}
if (p_kind == 2)
{
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, p_ang, c_black, 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, p_ang, image_blend, image_alpha);
    exit;
}
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + p_light, make_color_hsv(0, 0, 30 + (p_light * 2)), c_black, 0);
draw_set_blend_mode(bm_normal);
if (p_legspr >= 0)
{
    draw_sprite_ext(p_legspr, p_legimg, x + 1, y + 1, image_xscale, image_yscale, p_legdir, c_black, 0.5);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * p_left, p_ang, c_black, 0.5);
if (p_legspr >= 0)
{
    draw_sprite_ext(p_legspr, p_legimg, x, y, image_xscale, image_yscale, p_legdir, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * p_left, p_ang, image_blend, image_alpha);
f = floor(image_index);
if (sprite_index == sprPWalkThrow && f >= 0 && f < 9)
{
    tx = x + lengthdir_x(throwadd[f], p_ang) + lengthdir_x(7, p_ang - 90);
    ty = y + lengthdir_y(throwadd[f], p_ang) + lengthdir_y(7, p_ang - 90);
    draw_sprite_ext(sprThrowWeapons, p_thr, tx + 1, ty + 1, image_xscale, image_yscale, p_ang + lengthdir_x(20, 360 * image_index * 0.125), c_black, 0.5);
    draw_sprite_ext(sprThrowWeapons, p_thr, tx, ty, image_xscale, image_yscale, p_ang + lengthdir_x(20, 360 * image_index * 0.125), image_blend, image_alpha);
}
// Mask: same placement as scrDrawMask, with the partner's mask and the default skin (custom skins are per PC).
if (p_maskon == 1 && p_mask > 0 && f >= 0 && f < 64 && !(sprite_index == sprPMaskSlip && image_index < 2))
{
    itype = "Mask";
    if (sprite_index == sprPMaskSlip)
    {
        itype = "Slip";
    }
    mdir = point_direction(0, 0, maskaddx[f], maskaddy[f] * p_left) + p_ang;
    dist = point_distance(0, 0, maskaddx[f], maskaddy[f] * p_left);
    mx = lengthdir_x(dist, mdir);
    my = lengthdir_y(dist, mdir);
    ms = scrGetMaskSkin(p_mask, 0, itype);
    if (sprite_exists(ms))
    {
        draw_sprite_ext(ms, p_mask, x + mx + 1, y + my + 1, image_xscale, image_yscale, p_ang, c_black, 0.25);
        draw_sprite_ext(ms, p_mask, x + mx, y + my, image_xscale, image_yscale, p_ang, image_blend, image_alpha);
    }
}
