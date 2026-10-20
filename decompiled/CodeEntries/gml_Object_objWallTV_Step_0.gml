if (sprite_index == sprWallTVBreak)
{
    if (life > 0)
    {
        life -= 1;
        if (round(random(3)) == 2)
        {
            my_id = instance_create(x, y, objElectricity);
            my_id.direction = random(360);
            my_id.speed = random(1);
        }
        if (round(random(2)) == 1)
        {
            my_id = instance_create((x - 5) + random(10), (y - 5) + random(10), objElectricSpark);
            my_id.direction = point_direction(x, y, my_id.x, my_id.y);
            my_id.speed = 3 + random(2);
            my_id.image_angle = my_id.direction;
        }
    }
    else
    {
        image_speed = 0;
        image_index = 0;
    }
    exit;
}
if (scrMovingPlayerExists() && sprite_index == sprELisWallTV)
{
    if (scrIsAttacking(objPlayer.sprite_index) && place_meeting(x - lengthdir_x(12, objPlayer.dir), y - lengthdir_y(12, objPlayer.dir), objPlayer))
    {
        if (life > 0)
        {
            audio_play_sound(sndTaser, 0, false);
        }
        image_index = choose(0, 1);
        audio_play_sound(sndBottleBreak, 0, false);
        i = 0;
        repeat (12)
        {
            my_id = instance_create(x + lengthdir_x(5, (image_angle - 45) + (i * 7.5)), y + lengthdir_y(5, (image_angle - 45) + (i * 7.5)), objTVShards);
            my_id.direction = (image_angle - 45) + (i * 7.5);
            my_id.speed = 1 + random(3);
            i += 1;
        }
        sprite_index = sprWallTVBreak;
    }
}
