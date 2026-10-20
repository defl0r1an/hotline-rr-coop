itype = "Mask";
if (argument0)
{
    left = 1;
    dir = image_angle;
}
if (sprite_index == sprPMaskSlip)
{
    itype = "Slip";
}
maskdir = point_direction(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)] * left) + dir;
dist = point_distance(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)] * left);
maddx = lengthdir_x(dist, maskdir);
maddy = lengthdir_y(dist, maskdir);
global.maddx = maddx;
global.maddy = maddy;
if ((global.maskindex == 1 && global.hardmode == 1 && sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[1], "Mask")) == "sprMasksHard") || sprite_index == sprPWalkHospitalScalpelBlood)
{
    scrDrawRasmusMask();
    exit;
}
if (global.maskindex == 21 && (sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[21], "Mask")) == "sprMasksHard" || sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[21], "Mask")) == "sprMasks"))
{
    scrDrawWalrusMask();
    exit;
}
if (global.maskindex == 27 && (sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[27], "Mask")) == "sprMasksHard" || sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[27], "Mask")) == "sprMasks"))
{
    scrIgelEmotionsDrawMask();
    exit;
}
draw_sprite_ext(scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], itype), global.maskindex, x + maddx + 1, y + maddy + 1, image_xscale, image_yscale, dir, c_black, 0.25);
draw_sprite_ext(scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], itype), global.maskindex, x + maddx, y + maddy, image_xscale, image_yscale, dir, image_blend, image_alpha);
