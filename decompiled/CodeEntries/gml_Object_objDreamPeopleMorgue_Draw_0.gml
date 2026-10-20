if (sprite_index == sprWalkDreamDonJuan)
{
    maskindex = 4;
}
if (sprite_index == sprPWalkUnarmed)
{
    maskindex = 0;
}
if (sprite_index == sprEWalkUnarmed)
{
    maskindex = 1;
}
draw_sprite_ext(sprELegs, image_index * 2, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprELegs, image_index * 2, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
left = 1;
dir = image_angle;
maskdir = point_direction(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)] * left) + dir;
dist = point_distance(0, 0, maskaddx[floor(image_index)], maskaddy[floor(image_index)] * left);
maddx = lengthdir_x(dist, maskdir);
maddy = lengthdir_y(dist, maskdir);
shakehead = random_range(16, -16);
if (sprite_index == last_sprite)
{
    nothing = 1;
}
else
{
    scrUpdateHeadPos(sprite_index);
    last_sprite = sprite_index;
}
draw_sprite_ext(sprMasks, maskindex, x + maddx, y + maddy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
