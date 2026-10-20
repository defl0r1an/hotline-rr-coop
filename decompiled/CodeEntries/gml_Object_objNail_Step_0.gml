if (((collision_line(x, y, x + lengthdir_x(dist, direction), y + lengthdir_y(dist, direction), objSolid, false, true) || collision_circle(x, y, 5, objSolid, 0, 1)) && collision == 0) || collision == -1)
{
    AngleFail = abs(direction - angle);
    if (random(100) >= 75)
    {
        sprite_index = sprNailCurved;
        image_index = floor(random(sprite_get_number(sprite_index)));
    }
    if (AngleFail > (30 + random(8)))
    {
        if (random(100) >= 50)
        {
            sprite_index = sprNailBroken;
            image_index = 1;
            my_id = instance_create(lengthdir_x(distance_to_object(objSolid) - 8, direction) + x, lengthdir_y(distance_to_object(objSolid) - 8, direction) + y, objBrokenWeapon);
            my_id.speed = 2 + random(2);
            my_id.direction = direction - 140 - random(80);
            my_id.sprite_index = sprNailBroken;
            my_id.image_speed = 0;
            my_id.image_index = 0;
        }
        else
        {
            audio_play_sound(sndHitWall, 0, false);
            my_id = instance_create(lengthdir_x(distance_to_object(objSolid) - 8, direction) + x, lengthdir_y(distance_to_object(objSolid) - 8, direction) + y, objNailAmmo);
            my_id.speed = 2 + random(2);
            my_id.direction = direction - 140 - random(80);
            instance_destroy();
            exit;
        }
    }
    speed = 0;
    length = 0;
    if (collision != -1)
    {
        while (length < 500 && !place_meeting(x + lengthdir_x(length, direction), y + lengthdir_y(length, direction), objSolid))
        {
            length += 1;
        }
        x += lengthdir_x(length + 8, direction);
        y += lengthdir_y(length + 8, direction);
    }
    audio_play_sound(sndHitWall, 0, false);
    my_id = instance_create(lengthdir_x((distance_to_object(objSolid) - 4) + random(0.5), direction) + x, lengthdir_y((distance_to_object(objSolid) - 4) + random(0.5), direction) + y, objSmokeHit);
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
        my_id.direction = (image_angle - 180) + dir;
        my_id.image_angle = (image_angle - 180) + dir;
        my_id.speed = 2 + (random(5) * random(1));
    }
    AngleImpact = choose(450, -450) + random_range(150, -150);
    collision = 1;
}
if (collision == 1)
{
    AngleSpeed = lerp(AngleSpeed, 0.1, 0.05);
    AngleImpact = lerp(AngleImpact, 0, AngleSpeed);
    mask_index = sprNothing;
    if (round(AngleImpact) <= 0)
    {
        if (surface_exists(global.surf2))
        {
            image_xscale = 1;
            AngleImpact = 0;
            image_alpha = 1;
            addToSurface(global.surf2, 0);
            speed = 0;
        }
    }
}
startx += lengthdir_x(speed / 1.6, direction);
starty += lengthdir_y(speed / 1.6, direction);
