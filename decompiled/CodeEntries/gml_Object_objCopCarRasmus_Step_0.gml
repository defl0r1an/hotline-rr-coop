if (global.maskon)
{
    if (global.maskindex == 1 && instance_exists(objPlayerMouse))
    {
        trunkx = x - lengthdir_x(60, -image_angle);
        trunky = y - lengthdir_y(60, image_angle);
        if (point_distance(trunkx, trunky, objPlayer.x, objPlayer.y) < 20)
        {
            if (near < 6)
            {
                near += 0.2;
            }
            move += 4;
            moveinst = 0.75 + lengthdir_x(0.75, move);
            light = lerp(light, 12, 0.25);
            shadow = lerp(shadow, 0, 0.25);
            if (sound == 0)
            {
                audio_play_sound(sndCarTrunkOpen, 1, false);
                sound = 1;
            }
        }
        else if (near > 0)
        {
            near -= 0.2;
            moveinst = lerp(moveinst, 0, 0.15);
            light = lerp(light, 0, 0.25);
            shadow = lerp(shadow, 0.35, 0.2);
            if (sound == 1 && near == 1)
            {
                audio_play_sound(sndCarTrunkClose, 1, false);
                sound = 0;
            }
        }
    }
    else
    {
        instance_create(x + 3, y + 5, objCopCar);
        instance_destroy();
    }
}
