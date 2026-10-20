if (other.object_index == objWallSoftH || other.object_index == objWallSoftV)
{
    if (speed > 0)
    {
        x -= hspeed;
        y -= vspeed;
        speed = 0;
        move_contact_all(direction, 12);
        if (life > 0)
        {
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
                my_id.direction = (image_angle - 180) + dir;
                my_id.image_angle = (image_angle - 180) + dir;
                my_id.speed = 2 + (random(5) * random(1));
            }
            life -= 1;
        }
        audio_play_sound(sndHitWall, 0, false);
    }
}
if (other.object_index == objGlassPanelH)
{
    if (vspeed > 0)
    {
        other.add = -1;
    }
    else
    {
        other.add = 1;
    }
    with (other.id)
    {
        i = 0;
        repeat (24)
        {
            my_id = instance_create(x + (i * 1.5), y, objShard);
            my_id.speed = random(5);
            my_id.direction = ((add * 90) - 8) + random(16);
            i += 1;
        }
        instance_create(x, y, objGlassPanelHBroken);
        instance_destroy();
        audio_play_sound(sndGlass1, 0, false);
        audio_play_sound(sndGlass2, 0, false);
        audio_play_sound(sndWeaponHit, 0, false);
    }
    exit;
}
if (other.object_index == objGlassPanelV)
{
    if (hspeed > 0)
    {
        other.add = -1;
    }
    else
    {
        other.add = 1;
    }
    with (other.id)
    {
        i = 0;
        repeat (24)
        {
            my_id = instance_create(x, y + (i * 1.5), objShard);
            my_id.speed = random(5);
            my_id.direction = ((90 + (add * 90)) - 8) + random(16);
            i += 1;
        }
        instance_create(x, y, objGlassPanelVBroken);
        instance_destroy();
        audio_play_sound(sndGlass1, 0, false);
        audio_play_sound(sndGlass2, 0, false);
    }
    exit;
}
