draw_sprite_ext(sprite_index, index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha - alpha);
if (Endlife == 1)
{
    shake = 1 - alpha;
    draw_set_blend_mode(bm_subtract);
    draw_circle_colour(x, y, alpha * 10, merge_color(c_white, c_black, alpha), c_black, 0);
    draw_set_blend_mode(bm_add);
    for (i = 0; i < 8; i += 1)
    {
        draw_sprite_ext(sprMasksDropFront, 1, x + lengthdir_x(-4 + (alpha * 4), direction + (i * 44)) + random_range(shake, -shake), y + lengthdir_y(-4 + (alpha * 4), direction + (i * 44)) + random_range(shake, -shake), image_xscale, image_yscale, image_angle, merge_color(c_fuchsia, c_purple, alpha), alpha);
    }
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(sprMasksDropFront, 1, x + random_range(shake, -shake), y + random_range(shake, -shake), image_xscale, image_yscale, image_angle, merge_color(c_purple, c_white, alpha), alpha);
    draw_set_blend_mode(bm_subtract);
    i = 0;
    draw_set_circle_precision(14);
    repeat (28)
    {
        draw_circle_color(x + myx[i], y + myy[i], (size[i] * 3) + random(0.25), merge_color(c_black, c_green, clamp(1 - alpha - (point_distance(x + myx[i], y + myy[i], x, y) / 82), 0, 1)), c_black, 0);
        draw_set_circle_precision(6);
        draw_circle_color(x + myx[i], y + myy[i], size[i] + random(0.75), merge_color(c_black, c_dkgray, clamp(1 - alpha - (point_distance(x + myx[i], y + myy[i], x, y) / 82), 0, 1)), c_black, 0);
        draw_set_circle_precision(14);
        draw_circle_color(x + myx[i], y + myy[i], size[i] + random(0.5), merge_color(c_black, c_lime, clamp(1 - alpha - (point_distance(x + myx[i], y + myy[i], x, y) / 82), 0, 1)), c_black, 0);
        myx[i] += lengthdir_x(myspeed[i], mydir[i]);
        myy[i] += lengthdir_y(myspeed[i], mydir[i]);
        mydir[i] += diradd[i];
        if (round(random(30)) == 2)
        {
            diradd[i] = random_range(-4, 4);
        }
        i += 1;
    }
    draw_set_circle_precision(24);
    draw_set_blend_mode(bm_normal);
    alpha = lerp(alpha, 1, 0.05);
    if (alpha >= 0.99)
    {
        my_id = instance_create(x, y, objMaskDrop);
        my_id.depth = depth;
        my_id.rotspeed = rotspeed;
        my_id.image_angle = image_angle;
        my_id.sprite_index = sprMasksDropFront;
        my_id.image_index = 1;
        my_id.changemask = -1;
        instance_destroy();
    }
}
