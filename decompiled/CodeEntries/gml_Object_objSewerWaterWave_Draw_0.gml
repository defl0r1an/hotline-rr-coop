if (global.maskindex == 26 && global.maskon == 1)
{
    draw_set_colour(make_colour_rgb(0, 0, 0));
    shader_set(shd_russell_furniture);
}
else
{
    draw_set_colour(make_colour_rgb(0, 21, 0));
}
if (depth == 1105)
{
    draw_sprite_tiled_ext(sprSewerFloor, image_index, x, y, 1, 1, c_white, 1);
}
if (depth == 1100)
{
    i = 0;
    repeat (TrashItems)
    {
        draw_sprite_ext(Trashsprite[i], Trashimage[i], Trashx[i] - 1.5, Trashy[i] + lengthdir_y(Trashspeed[i] / 2, Trashangle[i]), 1, 1, Trashangle[i], image_blend, Trashalpha[i] / 2.5);
        draw_sprite_ext(Trashsprite[i], Trashimage[i], Trashx[i] - 1, Trashy[i] + lengthdir_y(Trashspeed[i], Trashangle[i]), 1, 1, Trashangle[i], image_blend, Trashalpha[i] / 2);
        draw_sprite_ext(Trashsprite[i], Trashimage[i], Trashx[i], Trashy[i] + lengthdir_y(Trashspeed[i] * 2, Trashangle[i]), 1, 1, Trashangle[i], image_blend, Trashalpha[i]);
        Trashangle[i] += Trashspeed[i] / 2;
        Trashx[i] += Trashspeed[i];
        if (Trashx[i] >= (room_width + 48))
        {
            Trashx[i] = 0;
            Trashy[i] = random_range(y, y + 48);
            Trashspeed[i] = random_range(0.35, 0.75);
            Trashalpha[i] = random_range(0.45, 0.75);
            Trashsprite[i] = choose(1612, 876, 1157, 1158, 1159, 1175, 1176, 1199, 1320, 1522, 1529, 983, 1807, 2658, 2657, 1552);
            if (round(random(50)) == 2)
            {
                Trashsprite[i] = choose(2338, 1540, 1541, 1542, 1782, 2621, 1538);
            }
            Trashimage[i] = floor(random(sprite_get_number(Trashsprite[i])));
            if (Trashsprite[i] == 1612)
            {
                Trashimage[i] = choose(32, 31, 38);
            }
        }
        i += 1;
    }
    draw_set_alpha(0.75);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_sprite_tiled_ext(sprite_index, image_index - 2, xx, y, 1, 1, c_white, 0.1);
    draw_sprite_tiled_ext(sprite_index, image_index - 1, xx, y, 1, 1, c_white, 0.35);
    draw_sprite_tiled_ext(sprite_index, image_index, xx, y, 1, 1, c_white, 0.6);
    xx += 0.1;
    global.my_id = id;
    with (objGuts2)
    {
        if (place_meeting(x, y, global.my_id))
        {
            x += 0.5;
            image_angle += 0.25;
            depth = 1001;
            image_alpha = lerp(image_alpha, 0.35, 0.015);
        }
    }
    with (objBodyPartPlayer)
    {
        if (place_meeting(x, y, global.my_id))
        {
            x += 0.5;
            image_angle += 0.25;
            depth = 1001;
            image_alpha = lerp(image_alpha, 0.35, 0.015);
        }
    }
    with (objBottlePieces)
    {
        if (place_meeting(x, y, global.my_id))
        {
            x += 0.5;
            image_angle += 0.25;
            depth = 1001;
            image_alpha = lerp(image_alpha, 0.35, 0.015);
        }
    }
    with (objMaskDrop)
    {
        if (place_meeting(x, y, global.my_id))
        {
            x += 0.5;
            image_angle += 0.25;
            depth = 1001;
            image_alpha = lerp(image_alpha, 0.35, 0.015);
        }
    }
    with (objMaskOwlDrop)
    {
        if (place_meeting(x, y, global.my_id))
        {
            x += 0.5;
            image_angle += 0.25;
            depth = 1001;
            image_alpha = lerp(image_alpha, 0.35, 0.015);
        }
    }
    with (objBodyPart)
    {
        if (place_meeting(x, y, global.my_id))
        {
            x += 0.5;
            image_angle += 0.25;
            depth = 1001;
            image_alpha = lerp(image_alpha, 0.35, 0.015);
        }
    }
    with (objSeveredHeadPlayer)
    {
        if (place_meeting(x, y, global.my_id))
        {
            my_id = instance_create(x, y - abs(lengthdir_x(speed * 2, dir)), objBodyPartPlayer);
            my_id.sprite_index = sprite_index;
            my_id.image_index = image_index;
            my_id.image_angle = image_angle;
            instance_destroy();
        }
    }
    with (objShard)
    {
        if (place_meeting(x, y, global.my_id))
        {
            x += 0.5;
            image_angle += 0.25;
            depth = 1001;
            image_alpha = lerp(image_alpha, 0.35, 0.015);
        }
    }
}
shader_reset();
