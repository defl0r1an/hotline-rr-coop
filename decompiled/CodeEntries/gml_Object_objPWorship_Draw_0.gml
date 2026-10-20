maskdir = point_direction(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)]) + image_angle + 90;
dist = point_distance(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)]);
maddx = lengthdir_x(dist, maskdir);
maddy = lengthdir_y(dist, maskdir);
global.maddx = maddx;
global.maddy = maddy;
if (sprite_index == sprPMaskSlip && image_index < 2 && image_index > 1)
{
    draw_sprite_ext(scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], "Mask"), global.maskindex, x + maddx + 1, y + maddy + 1, image_xscale, image_yscale, image_angle + 90, c_black, 0.25);
    draw_sprite_ext(scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], "Mask"), global.maskindex, x + maddx, y + maddy, image_xscale, image_yscale, image_angle + 90, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle + 90, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle + 90, image_blend, image_alpha);
if (sprite_index == sprPMaskSlip && image_index < 2)
{
    exit;
}
if (sprite_index == sprPMaskSlip)
{
    draw_sprite_ext(scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], "Mask"), global.maskindex, x + maddx + 1, y + maddy + 1, image_xscale, image_yscale, image_angle + 90, c_black, 0.25);
    draw_sprite_ext(scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], "Mask"), global.maskindex, x + maddx, y + maddy, image_xscale, image_yscale, image_angle + 90, image_blend, image_alpha);
}
