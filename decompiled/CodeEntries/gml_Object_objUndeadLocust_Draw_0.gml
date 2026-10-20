draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (sprite_index == sprUndeadLocustBody)
{
    shakehead = random_range(shakeheadlerp, -shakeheadlerp);
    shakeheadlerp = lerp(shakeheadlerp, 16, 0.15);
    _diff = angle_difference(point_direction(x, y, objPlayer.x, objPlayer.y), headdir);
    headdir += (_diff * 0.1);
    if (headsprite == 2891)
    {
        draw_sprite_ext(headsprite, 23, x + lengthdir_x(14, image_angle), y + lengthdir_y(14, image_angle), image_xscale, image_yscale, headdir - (shakehead / 4), image_blend, image_alpha);
    }
    if (headsprite == 2887)
    {
        draw_sprite_ext(headsprite, image_index, x + lengthdir_x(14, image_angle), y + lengthdir_y(14, image_angle), image_xscale, image_yscale, headdir - (shakehead / 4), image_blend, image_alpha);
        for (i = 0; i < 4; i += 1)
        {
            if (round(random(2)) == 2 || shakeheadtime[i] <= 70)
            {
                draw_sprite_ext(headsprite, shakeheadimage[i], x + lengthdir_x(shakeheadlength[i], (headdir + (i * 60)) - 90) + (shakehead / 12) + lengthdir_x(14, image_angle), y + lengthdir_y(shakeheadlength[i], (headdir + (i * 60)) - 90) + (shakehead / 12) + lengthdir_y(14, image_angle), image_xscale, image_yscale, headdir + shakehead, image_blend, 0.5 + random(0.25));
            }
            if (shakeheadtime[i] <= 0)
            {
                shakeheadtime[i] = 130 + round(random(95));
            }
            if (round(random(28)) == 2)
            {
                shakeheadimage[i] = round(random(3));
                shakeheadlength[i] = random(3);
            }
        }
    }
}
