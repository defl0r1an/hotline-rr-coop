if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (room == rmSequence8 || room == rmSequence9 || room == rmSequence10 || room == rmSequence11 || room == rmSequence12)
{
    if (instance_exists(objPlayer))
    {
        if (file_exists(working_directory + "\gameunlock"))
        {
            if (place_meeting(x - lengthdir_x(12, objPlayer.dir), y - lengthdir_y(12, objPlayer.dir), objPlayer))
            {
                image_speed = 0.2;
            }
            else
            {
                image_speed = 0;
            }
        }
    }
}
shader_reset();
