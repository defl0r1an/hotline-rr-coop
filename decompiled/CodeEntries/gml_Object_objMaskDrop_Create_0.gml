friction = 0.1;
rotspeed = (-1 + (round(random(1)) * 2)) * random(8);
startspeed = 0;
change = 0;
changemask = 0;
image_speed = 0;
image_angle = random(360);
sprite_index = scrGetMaskSkin(global.maskindex, global.selectskin[global.maskindex], choose("DropFront", "DropBack"));
image_index = global.maskindex;
if (global.maskindex == 1 && global.hardmode == 1 && sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[1], "Mask")) == "sprMasksHard")
{
    change = 1;
}
if (image_index == 21 && (sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[21], "Mask")) == "sprMasksHard" || sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[21], "Mask")) == "sprMasks"))
{
    sprite_index = choose(sprMasksDropBackWalrusStages, sprMasksDropFrontWalrusStages);
    if (sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[21], "Mask")) == "sprMasksHard")
    {
        image_index = 4 - global.meleeenergie;
    }
    else
    {
        image_index = 2 - global.meleeenergie;
    }
}
if (room == room152)
{
    image_index = 3;
}
