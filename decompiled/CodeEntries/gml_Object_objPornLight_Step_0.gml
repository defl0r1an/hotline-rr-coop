if (scrMovingPlayerExists() && destroyed == 0)
{
    if (scrIsAttacking(objPlayer.sprite_index) && place_meeting(x - lengthdir_x(12, objPlayer.dir), y - lengthdir_y(12, objPlayer.dir), objPlayer))
    {
        global.shake = 3;
        audio_play_sound(sndBottleBreak, 0, false);
        audio_play_sound(sndTaser, 0, false);
        sprite_index = sprPornLightBroken;
        i = 0;
        dired = image_angle + diradd;
        repeat (5 + round(random(2)))
        {
            my_id = instance_create(x + lengthdir_x(5, (image_angle - 45) + (i * 7.5)), y + lengthdir_y(5, (image_angle - 45) + (i * 7.5)), objTVShards);
            my_id.direction = ((image_angle + diradd + random_range(-10, 10)) - 45) + (i * 7.5);
            my_id.speed = 1 + random(3);
            i += 1;
        }
        repeat (4)
        {
            my_id = instance_create(x, y, objSpark);
            my_id.direction = random(360);
            my_id.speed = 3 + random(3);
            my_id.image_angle = my_id.direction;
        }
        my_id = instance_create(x, y, objFurniture);
        my_id.direction = image_angle;
        my_id.sprite_index = sprite_index;
        my_id.mask_index = mask_index;
        my_id.solid = 1;
        my_id.visible = false;
        mask_index = sprNothing;
        destroyed = 1;
    }
}
