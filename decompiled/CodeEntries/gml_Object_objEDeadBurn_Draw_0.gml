if (!init)
{
    burnsprite = asset_get_index(sprite_name(sprite_index) + "Burnt");
}
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
color += 0.15;
draw_sprite_ext(sprBombGround, image_index, x, y, image_xscale, image_yscale, groundangle, image_blend, alpha);
draw_sprite_ext(burnsprite, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
if (alpha < 1)
{
    alpha += burnspeed;
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1 - alpha);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, alpha);
}
else if (alphablack > 0)
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, alphablack);
    alphablack -= burnspeed;
}
else
{
    my_id = instance_create(x, y, objBombGround);
    my_id.image_angle = groundangle;
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_speed = 0;
    my_id.depth = depth;
    my_id.sprite_index = burnsprite;
    my_id.image_index = image_index;
    my_id.image_angle = image_angle;
    if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
    {
        my_id.decadenced = 1;
    }
    instance_destroy();
}
draw_set_alpha(light);
draw_set_blend_mode(bm_add);
draw_circle_colour(x, y, 32 + random_range(0.25, -0.15), merge_color(c_orange, c_black, 0.95), c_black, 0);
draw_circle_colour(x, y, 25 + random_range(0.25, -0.25), merge_color(c_orange, c_black, 0.8), c_black, 0);
draw_circle_colour(x, y, 16 + random_range(0.5, -0.5), merge_color(merge_colour(c_orange, c_red, 0.5 + lengthdir_x(0.5, color * 8)), c_black, 0.75), c_black, 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
shader_reset();
