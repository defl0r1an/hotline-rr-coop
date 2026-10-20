if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
if ((global.hardmode == 1 && global.maskindex == 2) || instance_exists(objPlayerBiker) || instance_exists(objPlayerBikerHouse) || instance_exists(objMCStompKill) || instance_exists(objMCChopKill) || instance_exists(objMCKnifeKill) || instance_exists(objMCBartender) || instance_exists(objPlayerBikerHack) || instance_exists(objBikerSushi) || instance_exists(objBikerClimbDown) || instance_exists(objBikerClimbUp) || instance_exists(objBikerKillJonatan) || instance_exists(objMCHelmet) || instance_exists(objPlayerBikerKick) || instance_exists(objBikerHeadKick) || (instance_exists(objMCBike) && (objMCBike.sprite_index == sprMCGetOnBike || objMCBike.sprite_index == sprBikerGetOnBikeWounded || objMCBike.sprite_index == sprBikerGetOnBikeUnmasked)))
{
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    if (light > 0)
    {
        light -= 1;
    }
    draw_set_blend_mode(bm_add);
    draw_circle_color(x, y, 12 + random(6) + light, make_color_hsv(0, 0, 30), c_black, 0);
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, image_index, x, (y - 1) + lengthdir_x(1, dir), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, x, (y - 1) + lengthdir_x(1, dir), image_xscale, image_yscale, image_angle, image_blend, 0.1 + lengthdir_x(0.1, dir));
    d3d_set_fog(false, c_black, 0, 0);
    dir += 4;
}
if (jones == 0 && image_index > 3)
{
    if (random(100) <= 25)
    {
        my_id = instance_create(x + lengthdir_x(8 + random_range(1, -1), random(360)), y + lengthdir_y(8 + random_range(1, -1), random(360)), objGasCanister);
        my_id.image_index = 3 + ceil(random(4));
        my_id.dir = random(360);
        my_id.jones = 1;
    }
    jones = 1;
}
shader_reset();
