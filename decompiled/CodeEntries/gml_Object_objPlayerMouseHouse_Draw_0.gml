if (persistent == true)
{
    exit;
}
if (sprite_index == sprPTakePhone)
{
    if (!instance_exists(objPhoneConversation))
    {
        sprite_index = sprPWalkUnarmed;
    }
    else if (image_index < 3)
    {
        image_index += 0.15;
    }
}
colorGlow = merge_color(c_black, merge_color(merge_color(c_lime, c_red, global.GlowSkippy), make_color_hsv((current_time / 12) % 255, 255, 255), random(1)), random(1));
draw_set_alpha(global.GlowSkippy - (global.GlowSkippy / 1.5) - global.GlowSkippyEnd);
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 25 + (global.PShaking * 2) + lengthdir_x(global.GlowSkippy * 2, global.flicker * 4) + (global.GlowSkippy * 15), merge_color(c_lime, c_red, global.GlowSkippy), c_black, 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
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
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30 + (light * 2)), c_black, 0);
draw_set_blend_mode(bm_normal);
if (myspeed == 2.25)
{
    legsprite = 43;
}
else
{
    legsprite = 42;
}
if (sprite_index == sprPWalkHospital)
{
    legsprite = 172;
}
if (sprite_index == sprPWalkHospitalScalpelBlood)
{
    legsprite = 2946;
}
if (aimon == 1)
{
    dir = point_direction(x, y, global.mousex, global.mousey);
    if (global.xbox == 1)
    {
        if (active == 1)
        {
            dir = scrXboxPlayerLook();
        }
        else if (point_distance(x, y, previousx, previousy) > 0.1)
        {
            dir = point_direction(previousx, previousy, x, y);
        }
    }
}
if (sprite_index == sprPUnlockDoor)
{
    dir = 90;
}
if (sprite_index == sprPPoliceKeycardLockOpen)
{
    dir = 180;
}
if (instance_exists(objJonesEnemyCrawl))
{
    dir = scrRotate(dir, point_direction(x, y, objJonesEnemyCrawl.x, objJonesEnemyCrawl.y), 6);
}
draw_sprite_ext(legsprite, legindex, x + 1, y + 1, image_xscale, image_yscale, legdir + global.PShaking, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, dir + global.PShaking, c_black, 0.5);
d3d_set_fog(true, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 0, 0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(legsprite, legindex, x, y, image_xscale, image_yscale, legdir + global.PShaking, image_blend, global.GlowSkippy - (global.GlowSkippy / 1.5) - global.GlowSkippyEnd);
draw_set_blend_mode(bm_normal);
d3d_set_fog(false, c_black, 0, 0);
draw_sprite_ext(legsprite, legindex, x, y, image_xscale, image_yscale, legdir + global.PShaking, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, image_blend, image_alpha);
d3d_set_fog(true, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 0, 0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, image_blend, global.GlowSkippy - (global.GlowSkippy / 1.5) - global.GlowSkippyEnd);
d3d_set_fog(false, c_black, 0, 0);
draw_sprite_ext(HotWeapon, image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_red, c_orange, 0.5), HotWeaponAlpha);
draw_sprite_ext(HotWeapon, image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_white, c_ltgray, 0.5), HotWeaponAlpha / 9);
draw_set_blend_mode(bm_normal);
if (sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Glow")))
{
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 1);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_purple, c_fuchsia, clamp(global.GlowDebuff, 0, 1)), global.GlowDebuff);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, c_white, global.GlowCharge);
    draw_set_blend_mode(bm_add);
    i = 0;
    repeat (8)
    {
        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x + clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) + i, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x - clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) - i, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y + clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) + i, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y - clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) - i, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
        i += 0.5;
    }
    draw_set_blend_mode(bm_normal);
}
if (reload > 0)
{
    reload -= 1;
}
if (light > 3)
{
    light -= 3;
}
if (sprite_index == sprPWalkThrow)
{
    left = 1;
    draw_set_alpha(0.35 - global.powerIgel);
    draw_set_blend_mode(bm_add);
    if (throwindex == 8)
    {
        draw_circle_color(x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90), y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90), 13 + (global.PShaking * 2) + lengthdir_x(global.GlowSkippy * 2, global.flicker * 4) + (global.GlowSkippy * 15), colorGlow, c_black, 0);
    }
    if (throwindex == 9 || throwindex == 10 || throwindex == 11)
    {
        if (round(random(120)) == 2)
        {
            instance_create(x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90), y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90), objBloodSplat);
        }
    }
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(1);
    draw_sprite_ext(sprThrowWeapons, throwindex, x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(7, dir - 90) + 1, y + 1 + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(7, dir - 90), image_xscale, image_yscale, dir + lengthdir_x(20, 360 * image_index * 0.125), c_black, 0.5);
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
if (maskon == 1)
{
    scrDrawMask(0);
}
if (sprite_index == sprPThrowMask)
{
    if (image_index < 3)
    {
        scrDrawMask(0);
    }
    if (image_index >= 3 && image_index < 4)
    {
        draw_sprite_ext(scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], "DropBack"), global.maskindex, x + lengthdir_x(4, dir), y + lengthdir_y(4, dir), 1, 1, dir, image_blend, image_alpha);
    }
    if (image_index >= 4 && image_index < 5)
    {
        draw_sprite_ext(scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], "DropBack"), global.maskindex, x + lengthdir_x(6, dir), y + lengthdir_y(6, dir), 1, 1, dir, image_blend, image_alpha);
    }
    if (image_index >= 5 && image_index < 16)
    {
        draw_sprite_ext(scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], "DropBack"), global.maskindex, x + lengthdir_x(7, dir), y + lengthdir_y(7, dir), 1, 1, dir, image_blend, image_alpha);
    }
}
scrDrawPlayerFire();
shader_reset();
