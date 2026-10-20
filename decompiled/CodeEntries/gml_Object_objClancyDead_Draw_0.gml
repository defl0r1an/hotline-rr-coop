if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (taken == 0)
{
    if (instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) > 28)
    {
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
    if (instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) < 28)
    {
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
        draw_sprite_ext(sprite_index, 1, x, y - abs(lengthdir_x(0.75, dir)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        d3d_set_fog(true, c_white, 0, 0);
        draw_sprite_ext(sprite_index, 1, x, y - abs(lengthdir_x(0.75, dir)), image_xscale, image_yscale, image_angle, image_blend, 0.1 + lengthdir_x(0.1, dir));
        d3d_set_fog(false, c_black, 0, 0);
        dir += 2.5;
    }
}
shader_reset();
