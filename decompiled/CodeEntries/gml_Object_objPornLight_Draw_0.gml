if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_set_blend_mode(bm_add);
if (destroyed == 0 || (destroyed == 1 && round(random(15)) == 2))
{
    draw_triangle_color(x, y, x + lengthdir_x(28, image_angle - 35), y + lengthdir_y(28, image_angle - 35), x + lengthdir_x(28, image_angle + 35), y + lengthdir_y(28, image_angle + 35), merge_color(c_black, merge_color(c_gray, c_dkgray, random(0.3)), light), 0, 0, 0);
}
if (destroyed == 1)
{
    light = lerp(light, 0, 0.05);
    if (life > 0)
    {
        life -= 1;
        if (round(random(3)) == 2)
        {
            my_id = instance_create(x, y, objElectricity);
            my_id.direction = random(360);
            my_id.speed = random(1);
        }
        if (round(random(2)) == 1)
        {
            my_id = instance_create((x - 5) + random(10), (y - 5) + random(10), objElectricSpark);
            my_id.direction = point_direction(x, y, my_id.x, my_id.y);
            my_id.speed = 3 + random(2);
            my_id.image_angle = my_id.direction;
        }
    }
}
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
