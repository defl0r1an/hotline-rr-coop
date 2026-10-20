if (sprite_index == lastsprite)
{
    nothing = 1;
}
else
{
    scrUpdateMaskPos(sprite_index);
}
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6), make_color_hsv(0, 0, 30), c_black, 0);
draw_set_blend_mode(bm_normal);
if (sprite_index == sprPKneel || sprite_index == sprPStomped)
{
    dir = image_angle;
    nothing = 1;
}
else
{
    dir = direction;
    draw_sprite_ext(sprLegs, legindex, x + 1, y + 1, image_xscale, image_yscale, dir, c_black, image_alpha - 0.5);
    draw_sprite_ext(sprLegs, legindex, x, y, image_xscale, image_yscale, dir, image_blend, image_alpha);
}
if (sprite_index == sprPStomped)
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, dir, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, dir, c_black, image_alpha - 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, dir, image_blend, image_alpha);
}
draw_set_color(c_white);
lastsprite = sprite_index;
if (maskon)
{
    left = 1;
    maskdir = point_direction(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)] * left) + dir;
    dist = point_distance(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)] * left);
    maddx = lengthdir_x(dist, maskdir);
    maddy = lengthdir_y(dist, maskdir);
    if (!sprite_exists(scrGetMaskSkin(global.masksavedbiker, global.selectskin[global.masksavedbiker], "Mask")) || (global.masksavedbiker == 1 && scrGetMaskSkin(global.masksavedbiker, global.selectskin[global.masksavedbiker], "Mask") == 236))
    {
        draw_sprite_ext(sprMasks, global.masksavedbiker, x + maddx + 1, y + maddy + 1, image_xscale, image_yscale * left, dir, c_black, image_alpha - 0.25);
        draw_sprite_ext(sprMasks, global.masksavedbiker, x + maddx, y + maddy, image_xscale, image_yscale * left, dir, image_blend, image_alpha);
        exit;
    }
    if (sprite_exists(scrGetMaskSkin(global.masksavedbiker, global.selectskin[global.masksavedbiker], "Mask")))
    {
        draw_sprite_ext(scrGetMaskSkin(global.masksavedbiker, global.selectskin[global.masksavedbiker], "Mask"), global.masksavedbiker, x + maddx + 1, y + maddy + 1, image_xscale, image_yscale * left, dir, c_black, image_alpha - 0.25);
        draw_sprite_ext(scrGetMaskSkin(global.masksavedbiker, global.selectskin[global.masksavedbiker], "Mask"), global.masksavedbiker, x + maddx, y + maddy, image_xscale, image_yscale * left, dir, image_blend, image_alpha);
    }
}
