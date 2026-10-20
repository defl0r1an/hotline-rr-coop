if (collision < line)
{
    global.my_id = id;
    with (objDoorH2)
    {
        if (sprite_index == sprBombDoorH)
        {
            if (place_meeting(x, y, global.my_id))
            {
                image_angle += 1;
            }
        }
    }
    with (objDoorV2)
    {
        if (sprite_index == sprBombDoorV)
        {
            if (place_meeting(x, y, global.my_id))
            {
                image_angle += 1;
            }
        }
    }
    my_id = instance_create(x, y, objSmokeHit);
    my_id.image_angle = direction;
    my_id.direction = direction - 180;
    my_id.speed = random(1);
    amount = random(0.5);
    my_id.color1 = merge_color(c_gray, c_dkgray, amount);
    my_id.color2 = merge_color(c_dkgray, c_black, amount);
    repeat (4 + random(6))
    {
        dir = -65 + random(130);
        my_id = instance_create(x + lengthdir_x(8, (image_angle - 180) + dir), y + lengthdir_y(8, (image_angle - 180) + dir), objSpark);
        my_id.direction = image_angle + dir;
        my_id.image_angle = image_angle + dir;
        my_id.speed = 2 + (random(5) * random(1));
    }
    repeat (4)
    {
        my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objDebris);
        my_id.direction = direction - 140 - random(80);
        my_id.speed = random(4);
    }
    linexend[collision] = linex[collision - pop];
    lineyend[collision] = liney[collision - pop];
    linex[collision] = x;
    liney[collision] = y;
    if (collision == (line - 1))
    {
        circlescalespeed = 0.025;
        circlescale[collision] = 26;
    }
    else
    {
        circlescale[collision] = 10;
    }
    linealphaend[collision] = 255 / pop;
    alphaend = 255 / pop;
    linealpha[collision] = 255;
    alpha = 255;
    if (speedlerp > 6)
    {
        speedlerp -= 2;
    }
    pop = 1;
    collision += 1;
    with (other.id)
    {
        if (solid == 1)
        {
            with (objBulletSkippyLaser)
            {
                move_bounce_solid(0);
            }
        }
    }
}
