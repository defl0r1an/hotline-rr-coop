if (sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Fire")))
{
    if ((sprite_index == sprPWalkFlameThrower || sprite_index == sprPAttackFlameThrower || sprite_index == sprPIdleFlameThrower) && ammo == 0)
    {
        exit;
    }
    my_id = instance_create(x, y, objTrailFire);
    my_id.sprite_index = asset_get_index(sprite_get_name(sprite_index) + "Fire");
    my_id.direction = dir + lengthdir_x(2, global.dir * 8);
    my_id.image_angle = my_id.direction;
    my_id.image_index = image_index;
    my_id.image_alpha = 0.5;
    my_id.image_blend = c_orange;
    my_id.image_speed = 0;
    my_id.image_xscale = image_xscale;
    my_id.image_yscale = image_yscale * left;
    firedir = point_direction(0, 0, fireaddx[floor(image_index)], fireaddy[floor(image_index)] * left) + dir;
    firedist = point_distance(0, 0, fireaddx[floor(image_index)], fireaddy[floor(image_index)] * left);
    fireax = lengthdir_x(firedist, firedir);
    fireay = lengthdir_y(firedist, firedir);
    if (sprite_index == sprPStartLighter && image_index > 10 && Spark == 0)
    {
        repeat (4)
        {
            my_id = instance_create(x + lengthdir_x(13, dir - 18), y + lengthdir_y(13, dir - 18), objFireSpark);
            my_id.direction = random(360);
            my_id.speed = 1.5 + random(1.5);
            my_id.image_angle = my_id.direction;
        }
        audio_play_sound(sndLighter, 1, false);
        Lighter = 16;
        Spark = 1;
    }
    else if (Spark == 1)
    {
        Lighter = lerp(Lighter, 0, 0.2);
    }
    if (sprite_index == sprPStartLighter && image_index > 17 && Spark == 1)
    {
        repeat (5)
        {
            my_id = instance_create(x + lengthdir_x(13, dir - 18), y + lengthdir_y(13, dir - 18), objFireSpark);
            my_id.direction = random(360);
            my_id.speed = 1.5 + random(1.5);
            my_id.image_angle = my_id.direction;
        }
        audio_play_sound(sndLighter, 1, false);
        Spark = 2;
    }
    draw_set_blend_mode(bm_add);
    d3d_set_fog(true, c_orange, 0, 0);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Fire"), image_index - 2, x, y, image_xscale, image_yscale * left, dir, image_blend, 0.1875);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Fire"), image_index - 1, x, y, image_xscale, image_yscale * left, dir, image_blend, 0.375);
    d3d_set_fog(false, c_black, 0, 0);
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Fire"), image_index, x, y, image_xscale, image_yscale * left, dir, image_blend, image_alpha);
}
else
{
    Spark = 0;
}
