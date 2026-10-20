if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
if (instance_exists(objPlayer))
{
    if (touch == 0 && global.maskindex == 1)
    {
        if (point_distance(x, y, objPlayer.x, objPlayer.y) < 30)
        {
            draw_sprite_ext(sprite_index, 0, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
            draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            draw_sprite_general(sprWeapons, 10, 20, 20, 14, 9, x - 10, y - 5, image_xscale, image_yscale, image_angle + 90, c_black, c_black, c_black, c_black, 0.5);
            draw_sprite_general(sprWeapons, 10, 20, 20, 14, 9, x - 10, y - 5 - abs(lengthdir_x(1.5, dir)), image_xscale, image_yscale, image_angle + 90, c_white, c_white, c_white, c_white, image_alpha);
            d3d_set_fog(true, c_white, 0, 0);
            draw_sprite_general(sprWeapons, 10, 20, 20, 14, 9, x - 10, y - 5 - abs(lengthdir_x(1.5, dir)), image_xscale, image_yscale, image_angle + 90, c_white, c_white, c_white, c_white, 0.1 + lengthdir_x(0.1, dir));
            d3d_set_fog(false, c_black, 0, 0);
            dir += 4;
        }
        else
        {
            draw_sprite_ext(sprite_index, 1, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
            draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        }
    }
    else
    {
        draw_sprite_ext(sprite_index, 0, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
else if (touch == 0)
{
    draw_sprite_ext(sprite_index, 1, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, 0, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
shader_reset();
