if (sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[21], "Mask")) == "sprMasksHard")
{
    draw_sprite_ext(sprMaskWalrusStages, 4 - global.meleeenergie, x + maddx + 1, y + maddy + 1, image_xscale, image_yscale, dir, c_black, 0.25);
    draw_sprite_ext(sprMaskWalrusStages, 4 - global.meleeenergie, x + maddx, y + maddy, image_xscale, image_yscale, dir, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(sprMaskWalrusStages, 2 - global.meleeenergie, x + maddx + 1, y + maddy + 1, image_xscale, image_yscale, dir, c_black, 0.25);
    draw_sprite_ext(sprMaskWalrusStages, 2 - global.meleeenergie, x + maddx, y + maddy, image_xscale, image_yscale, dir, image_blend, image_alpha);
}
