if (speed == 0)
{
    if (image_index == 0)
    {
        repeat (3 + random(4))
        {
            my_id = instance_create(x, y, objTinyBlood);
            my_id.direction = random(360);
            my_id.speed = 3 + random(2);
            my_id.image_angle = my_id.direction;
        }
        repeat (5 + random(7))
        {
            dir = random(360);
            length = 7 + random(10);
            global.myx = x + lengthdir_x(length, dir);
            global.myy = y + lengthdir_y(length, dir);
            draw_sprite_ext(sprBloodSpeck, random(10), global.myx * 2, global.myy * 2, 2, 2, dir, c_white, 1);
        }
        surface_reset_target();
    }
    if (image_index < (target - 1))
    {
        image_index += 0.25;
    }
    else
    {
        done = 1;
    }
}
