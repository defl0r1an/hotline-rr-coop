if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, image_angle, image_blend, image_alpha);
if (sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Fire") && Lighter != 0))
{
    my_id = instance_create(x, y, objTrailFire);
    my_id.sprite_index = asset_get_index(sprite_get_name(sprite_index) + "Fire");
    my_id.direction = image_angle + lengthdir_x(2, global.dir * 8);
    my_id.image_angle = my_id.direction;
    my_id.image_index = image_index;
    my_id.image_alpha = Lighter / 24;
    my_id.image_blend = c_orange;
    my_id.image_speed = 0;
    my_id.image_xscale = image_xscale;
    my_id.image_yscale = image_yscale * left;
    draw_set_blend_mode(bm_add);
    d3d_set_fog(true, c_orange, 0, 0);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Fire"), image_index - 2, x, y, image_xscale, image_yscale * left, image_angle, image_blend, Lighter / 128);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Fire"), image_index - 1, x, y, image_xscale, image_yscale * left, image_angle, image_blend, Lighter / 64);
    d3d_set_fog(false, c_black, 0, 0);
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Fire"), image_index, x, y, image_xscale, image_yscale * left, image_angle, image_blend, Lighter / 24);
}
if (round(random(30)) <= 2 || Lighter <= 8)
{
    Lighter = lerp(Lighter, 0, 0.05);
}
shader_reset();
