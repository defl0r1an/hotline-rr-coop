bullets = 0;
global.my_id = id;
with (objBullet)
{
    if (place_meeting(x, y, global.my_id))
    {
        global.my_id.bullets += 1;
    }
}
if (destroyed == 0)
{
    if (idcam != -1)
    {
        global.cameradestroy[idcam] = 1;
        i = 0;
        count = 0;
        repeat (8)
        {
            if (global.cameradestroy[i] == 1)
            {
                count++;
            }
            i += 1;
        }
        ini_open("Achievements.ini");
        ini_write_real("AchData", "CameraDestroy", count);
        ini_close();
        if (array_length_1d(global.cameradestroy) == count)
        {
            scrAchievementSet("Camera Shy");
        }
        scrSaveAchievements();
    }
    global.shake = 2 + round(random(2));
    audio_play_sound(sndBottleBreak, 0, false);
    audio_play_sound(choose(sndTaser, sndElectric), 0, false);
    i = 0;
    repeat (2 + random(1) + bullets)
    {
        my_id = instance_create(x + lengthdir_x(5, (image_angle - 45) + (i * 7.5)), y + lengthdir_y(5, (image_angle - 45) + (i * 7.5)), objTVShards);
        my_id.direction = ((image_angle + diradd + angle + random_range(-10, 10)) - 45) + (i * 7.5);
        my_id.speed = 1 + random(3);
        i += 1;
    }
    if (bullets > 1)
    {
        my_id = instance_create(x + lengthdir_x(6, image_angle + angle), y + lengthdir_y(6, image_angle + angle), objTVShards);
        my_id.direction = (image_angle + angle + random_range(-10, 10)) - 45;
        my_id.speed = 1 + random(3);
        my_id.sprite_index = sprCameraDestroyed;
        my_id.image_index = random(6);
        alpha = 0;
    }
    else
    {
        sprite = 2199;
        blinklight = (observer * 6) + random(3);
    }
    destroyed = 1;
}
