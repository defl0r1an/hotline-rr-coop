if (sprite_index == sprWallBoardsH && energie <= 0)
{
    solid = 0;
    i = 0;
    repeat (24)
    {
        if (round(random(2)) == 1)
        {
            my_id = instance_create(x + (i * 1.5), y, objShard);
            my_id.speed = random(5);
            my_id.direction = ((add * 90) - 8) + random(16);
            my_id.sprite_index = sprBoardsWallDebris;
            my_id.image_index = random(7);
        }
        i += 1;
    }
    audio_play_sound(Bat_break, 0, false);
    audio_play_sound(sndWeaponHit, 0, false);
    global.shake = 2;
    sprite_index = sprWallBrokenBoardsH;
}
