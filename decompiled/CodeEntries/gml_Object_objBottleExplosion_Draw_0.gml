if (image_index < 8)
{
    image_index += 0.3;
}
draw_set_blend_mode(bm_add);
if (global.maskindex == 26 && global.maskon == 1)
{
    draw_circle_colour(x, y, light, c_gray, c_black, 0);
}
else
{
    draw_circle_colour(x, y, light, c_yellow, c_black, 0);
}
draw_set_blend_mode(bm_normal);
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
    if (image_index < 8)
    {
        draw_sprite_ext(sprBottleExplode, image_index, x, y, 1, 1, angle, merge_color(c_white, c_gray, image_index * 0.1 * (0.8 + random(0.2))), 1);
        if (image_index >= 2)
        {
            draw_sprite_ext(sprBottleExplodeFlame, image_index - 2, x, y, 1, 1, angle, c_dkgray, 1);
        }
        if (image_index >= 1)
        {
            draw_sprite_ext(sprBottleExplodeFlame, image_index - 1, x, y, 1, 1, angle, c_gray, 1);
        }
        light = clamp(light, 0, 30);
        light += 2;
        draw_sprite_ext(sprBottleExplodeFlame, image_index, x, y, 1, 1, angle, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sprBottleExplode, 8, x, y, 1.15, 1.15, angle, merge_color(c_dkgray, c_black, 0.5 + random(0.5)), 1);
        draw_sprite_ext(sprBottleExplode, 8, x, y, 1.05 + random(0.05), 1.05 + random(0.05), angle, merge_color(c_black, c_dkgray, random(1)), 0.5 + random(0.5));
        draw_sprite_ext(sprBottleExplode, 8, x, y, 1, 1, angle, merge_color(c_gray, c_dkgray, random(0.35)), 1 - random(0.2));
        index += 0.25;
        light -= random_range(-0.2, 0.2);
        light = clamp(light, 29, 30);
        draw_sprite_ext(sprBottleFlames, index - 1, x, y, 1, 1, angle - 5, c_white, 0.6 + lengthdir_x(0.4, index * 10));
        draw_sprite_ext(sprBottleFlames, index - 3, x, y, 1, 1, angle + 5, c_white, 0.6 + lengthdir_x(0.4, (index * 10) + 90));
        draw_sprite_ext(sprBottleFlames, index, x, y, 1, 1, angle, c_white, 0.6 + lengthdir_x(0.4, (index * 10) + 180));
    }
    shader_reset();
}
else if (image_index < 8)
{
    draw_sprite_ext(sprBottleExplode, image_index, x, y, 1, 1, angle, merge_color(c_white, c_yellow, image_index * 0.1 * (0.8 + random(0.2))), 1);
    if (image_index >= 2)
    {
        draw_sprite_ext(sprBottleExplodeFlame, image_index - 2, x, y, 1, 1, angle, c_orange, 1);
    }
    if (image_index >= 1)
    {
        draw_sprite_ext(sprBottleExplodeFlame, image_index - 1, x, y, 1, 1, angle, c_yellow, 1);
    }
    light = clamp(light, 0, 30);
    light += 2;
    draw_sprite_ext(sprBottleExplodeFlame, image_index, x, y, 1, 1, angle, c_white, 1);
}
else
{
    light = clamp(light, 29, 30);
    light -= random_range(-0.2, 0.2);
    draw_sprite_ext(sprBottleExplode, 8, x, y, 1.15, 1.15, angle, merge_color(c_dkgray, c_black, 0.5 + random(0.5)), 1);
    draw_sprite_ext(sprBottleExplode, 8, x, y, 1.05 + random(0.05), 1.05 + random(0.05), angle, merge_color(c_red, c_orange, random(1)), 0.5 + random(0.5));
    draw_sprite_ext(sprBottleExplode, 8, x, y, 1, 1, angle, merge_color(c_yellow, c_orange, random(0.35)), 1 - random(0.2));
    index += 0.25;
    draw_sprite_ext(sprBottleFlames, index - 1, x, y, 1, 1, angle - 5, c_white, 0.6 + lengthdir_x(0.4, index * 10));
    draw_sprite_ext(sprBottleFlames, index - 3, x, y, 1, 1, angle + 5, c_white, 0.6 + lengthdir_x(0.4, (index * 10) + 90));
    draw_sprite_ext(sprBottleFlames, index, x, y, 1, 1, angle, c_white, 0.6 + lengthdir_x(0.4, (index * 10) + 180));
}
