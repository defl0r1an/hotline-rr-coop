dir += 0.5;
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
    color5 = 8421504;
    color4 = 0;
}
else
{
    color5 = merge_color(make_colour_rgb(253, 59, 0), make_colour_rgb(193, 48, 48), 0.5 + lengthdir_x(0.5, dir));
    color4 = merge_color(make_colour_rgb(227, 109, 41), make_colour_rgb(235, 181, 34), 0.5 + lengthdir_x(0.5, dir));
}
scale = lengthdir_x(0.25, dir);
draw_sprite_ext(sprRealTrashcan, 2, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_add);
draw_set_alpha(0.125 - (scale / 8));
draw_circle_color(x, y, 28 + scale + random(0.15), color4, c_black, 0);
draw_set_alpha(0.025 - (scale / 8));
draw_circle_color(x, y, 21 + scale + random(0.25), color5, c_black, 0);
draw_set_alpha(0.15 - (scale / 8));
draw_circle_color(x, y, 15 + scale + random(0.5), color4, c_black, 0);
draw_set_alpha(0.15 - (scale / 8));
draw_circle_color(x, y, 19 + scale + random(1), color4, c_black, 0);
d3d_set_fog(true, c_orange, 0, 0);
draw_sprite_ext(sprite_index, image_index - 2, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.0625);
draw_sprite_ext(sprite_index, image_index - 1, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.125);
d3d_set_fog(false, c_black, 0, 0);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_alpha(1);
if (instance_exists(objPlayer))
{
    if (collision_circle(x, y, 50, objPlayer, 0, 0))
    {
        if (collision_circle(x, y, 40, objPlayer, 0, 0))
        {
            dist = point_distance(x, y, objPlayer.x, objPlayer.y);
            vlm = 1 - (dist / 40);
            vlm = max(vlm, 0.1);
            if (!audio_is_playing(sndFireBurning))
            {
                audio_play_sound(sndFireBurning, vlm, true);
            }
            else
            {
                audio_sound_gain(sndFireBurning, vlm, 0);
            }
        }
        else if (audio_is_playing(sndFireBurning))
        {
            audio_stop_sound(sndFireBurning);
        }
    }
}
shader_reset();
