draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha / 5);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, 0, x + random_range(-0.5, 0.5), y + random_range(-0.5, 0.5), image_xscale, image_yscale, image_angle, merge_color(c_fuchsia, c_lime, random(1)), clamp((image_alpha - lengthdir_x(image_alpha / 4, dir * 12)) + random_range(-image_alpha, image_alpha), 0, 1));
if (instance_exists(objPlayer))
{
    image_angle = point_direction(x, y, objPlayer.x, objPlayer.y);
}
if (instance_exists(objSeveredHeadPlayer))
{
    image_angle = point_direction(x, y, objSeveredHeadPlayer.x, objSeveredHeadPlayer.y);
}
if (instance_exists(objBodyPartPlayer))
{
    image_angle = point_direction(x, y, objBodyPartPlayer.x, objBodyPartPlayer.y);
}
dir += 0.15;
draw_set_blend_mode(bm_normal);
